package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String newCheckOut = request.getParameter("checkOutDate");

        List<String> bookings = FileHandler.readFromFile("reservations.txt");
        boolean isUpdated = false;

        for (int i = 0; i < bookings.size(); i++) {
            String[] data = bookings.get(i).split(",");
            if (data[0].equals(bookingId)) {
                // Update CheckOutDate (index 4)
                bookings.set(i, data[0] + "," + data[1] + "," + data[2] + "," + data[3] + "," + newCheckOut + "," + data[5] + "," + data[6]);
                isUpdated = true;
                break;
            }
        }

        if (isUpdated) {
            FileHandler.overwriteFile("reservations.txt", bookings);
            response.sendRedirect("editBooking.jsp?success=true");
        } else {
            response.sendRedirect("editBooking.jsp?error=true");
        }
    }
}