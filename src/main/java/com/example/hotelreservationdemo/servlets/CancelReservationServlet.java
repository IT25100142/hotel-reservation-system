package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// DELETE OPERATION
@WebServlet("/CancelReservationServlet")
public class CancelReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdToDelete = request.getParameter("bookingId");
        String source = request.getParameter("source"); // Check where the request came from

        List<String> bookings = FileHandler.readFromFile("reservations.txt");
        boolean isDeleted = false;

        for (int i = 0; i < bookings.size(); i++) {
            String[] data = bookings.get(i).split(",");
            if (data[0].equals(bookingIdToDelete)) {
                bookings.remove(i);
                isDeleted = true;
                break;
            }
        }

        // Smart Redirect Logic
        if (isDeleted) {
            FileHandler.overwriteFile("reservations.txt", bookings);
            if ("list".equals(source)) {
                response.sendRedirect("ListReservationsServlet?success=true");
            } else {
                response.sendRedirect("cancelBooking.jsp?success=true");
            }
        } else {
            if ("list".equals(source)) {
                response.sendRedirect("ListReservationsServlet?error=true");
            } else {
                response.sendRedirect("cancelBooking.jsp?error=true");
            }
        }
    }
}