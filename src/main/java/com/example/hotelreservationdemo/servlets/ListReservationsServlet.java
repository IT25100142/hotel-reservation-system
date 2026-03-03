package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// READ ALL OPERATION
@WebServlet("/ListReservationsServlet")
public class ListReservationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read all lines from the reservations text file
        List<String> allReservations = FileHandler.readFromFile("reservations.txt");

        // Pass the list to the JSP page
        request.setAttribute("allReservationsList", allReservations);

        // Forward back to the view booking page
        request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
    }
}