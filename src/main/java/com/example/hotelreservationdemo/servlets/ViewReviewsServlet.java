package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// READ OPERATION
@WebServlet("/ViewReviewsServlet")
public class ViewReviewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterRoomId = request.getParameter("roomId");
        List<String> allReviews = FileHandler.readFromFile("reviews.txt");
        List<String> filteredReviews = new ArrayList<>();

        // If a Room ID is provided, filter by it. Otherwise, show all.
        for (String line : allReviews) {
            String[] data = line.split(",");
            if (data.length >= 6) {
                if (filterRoomId == null || filterRoomId.trim().isEmpty() || data[1].equals(filterRoomId)) {
                    filteredReviews.add(line);
                }
            }
        }

        request.setAttribute("reviewList", filteredReviews);
        request.getRequestDispatcher("viewReviews.jsp").forward(request, response);
    }
}