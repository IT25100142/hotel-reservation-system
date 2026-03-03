package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.Guest;
import com.example.hotelreservationdemo.models.User;
import com.example.hotelreservationdemo.models.VIPGuest;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/RegisterGuestServlet")
public class RegisterGuestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String type = request.getParameter("type");

        User newGuest;

        // Polymorphism applied dynamically
        if ("VIP".equals(type)) {
            int points = Integer.parseInt(request.getParameter("points"));
            newGuest = new VIPGuest(id, name, email, phone, points);
        } else {
            newGuest = new Guest(id, name, email, phone);
        }

        // Save to Database (guests.txt)
        FileHandler.appendToFile("guests.txt", newGuest.toFileString());

        response.sendRedirect("guestRegistration.jsp?success=true");
    }
}