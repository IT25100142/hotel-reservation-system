package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.AnonymousReview;
import com.example.hotelreservationdemo.models.Review;
import com.example.hotelreservationdemo.models.VerifiedReview;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reviewId = "REV-" + System.currentTimeMillis(); // Auto-generate ID
        String roomId = request.getParameter("roomId");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Replace commas in comments to prevent breaking our CSV text file structure
        String comments = request.getParameter("comments").replace(",", ";");
        String reviewType = request.getParameter("reviewType");

        Review newReview;

        // Apply Polymorphism dynamically based on the form
        if ("Verified".equals(reviewType)) {
            String guestName = request.getParameter("guestName");
            newReview = new VerifiedReview(reviewId, roomId, rating, comments, guestName);
        } else {
            String purpose = request.getParameter("stayPurpose");
            newReview = new AnonymousReview(reviewId, roomId, rating, comments, purpose);
        }

        // Save to reviews.txt
        FileHandler.appendToFile("reviews.txt", newReview.toFileString());

        response.sendRedirect("submitReview.jsp?success=true");
    }
}