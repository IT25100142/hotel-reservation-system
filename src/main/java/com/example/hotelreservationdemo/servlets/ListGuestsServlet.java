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
@WebServlet("/ListGuestsServlet")
public class ListGuestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read all lines from the guests text file
        List<String> allGuests = FileHandler.readFromFile("guests.txt");

        // Pass the list to the JSP page
        request.setAttribute("allGuestsList", allGuests);

        // Forward back to the view profile page
        request.getRequestDispatcher("viewGuestProfile.jsp").forward(request, response);
    }
}