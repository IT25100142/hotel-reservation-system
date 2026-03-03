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
@WebServlet("/SearchGuestServlet")
public class SearchGuestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchId = request.getParameter("searchId");
        List<String> guests = FileHandler.readFromFile("guests.txt");
        String foundGuest = null;

        // Search the text file row by row
        for (String line : guests) {
            String[] data = line.split(",");
            if (data[0].equals(searchId)) {
                foundGuest = line;
                break;
            }
        }

        if (foundGuest != null) {
            request.setAttribute("guestData", foundGuest);
        } else {
            request.setAttribute("error", "Guest with ID " + searchId + " not found.");
        }

        // Forward back to the JSP page with the data
        request.getRequestDispatcher("viewGuestProfile.jsp").forward(request, response);
    }
}