package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.Booking;
import com.example.hotelreservationdemo.models.CorporateBooking;
import com.example.hotelreservationdemo.models.PersonalBooking;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/CreateReservationServlet")
public class CreateReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = "BKG-" + System.currentTimeMillis(); // Auto-generate ID
        String guestName = request.getParameter("guestName");
        String roomId = request.getParameter("roomId");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String bookingType = request.getParameter("bookingType");

        Booking newBooking;

        // Polymorphism applied based on form selection
        if ("Corporate".equals(bookingType)) {
            String companyName = request.getParameter("companyName");
            newBooking = new CorporateBooking(bookingId, guestName, roomId, checkInDate, checkOutDate, companyName);
        } else {
            int numGuests = Integer.parseInt(request.getParameter("numberOfGuests"));
            newBooking = new PersonalBooking(bookingId, guestName, roomId, checkInDate, checkOutDate, numGuests);
        }

        // Save to Database (reservations.txt)
        FileHandler.appendToFile("reservations.txt", newBooking.toFileString());

        // Redirect with success message and the auto-generated ID!
        response.sendRedirect("makeReservation.jsp?success=true&bookingId=" + bookingId);
    }
}