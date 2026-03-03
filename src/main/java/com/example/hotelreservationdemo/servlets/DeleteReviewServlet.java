package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// DELETE OPERATION (Admin Only)
@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reviewIdToDelete = request.getParameter("reviewId");
        String source = request.getParameter("source"); // Check where the request came from

        List<String> reviews = FileHandler.readFromFile("reviews.txt");
        boolean isDeleted = false;

        // Search for the review and remove it from the list
        for (int i = 0; i < reviews.size(); i++) {
            String[] data = reviews.get(i).split(",");
            if (data[0].equals(reviewIdToDelete)) {
                reviews.remove(i);
                isDeleted = true;
                break;
            }
        }

        // Smart Redirect Logic
        if (isDeleted) {
            FileHandler.overwriteFile("reviews.txt", reviews);
            if ("list".equals(source)) {
                response.sendRedirect("ViewReviewsServlet?success=true");
            } else {
                response.sendRedirect("moderateReviews.jsp?success=true");
            }
        } else {
            if ("list".equals(source)) {
                response.sendRedirect("ViewReviewsServlet?error=true");
            } else {
                response.sendRedirect("moderateReviews.jsp?error=true");
            }
        }
    }
}