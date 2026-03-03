package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// READ OPERATION
@WebServlet("/ViewReservationServlet")
public class ViewReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchId = request.getParameter("searchId");
        List<String> bookings = FileHandler.readFromFile("reservations.txt");
        String foundBooking = null;

        for (String line : bookings) {
            String[] data = line.split(",");
            if (data[0].equals(searchId)) {
                foundBooking = line;
                break;
            }
        }

        if (foundBooking != null) {
            request.setAttribute("bookingData", foundBooking);
        } else {
            request.setAttribute("error", "Reservation ID '" + searchId + "' not found.");
        }

        request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
    }
}