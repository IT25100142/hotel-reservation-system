package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReplyReviewServlet")
public class ReplyReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reviewId = request.getParameter("reviewId");
        // Replace commas so it doesn't break our CSV text file!
        String replyText = request.getParameter("replyText").replace(",", ";");

        List<String> reviews = FileHandler.readFromFile("reviews.txt");
        boolean isUpdated = false;

        for (int i = 0; i < reviews.size(); i++) {
            String[] data = reviews.get(i).split(",");
            if (data[0].equals(reviewId)) {
                // Keep the original 6 items, and append the reply as the 7th item!
                String baseData = data[0] + "," + data[1] + "," + data[2] + "," + data[3] + "," + data[4] + "," + data[5];
                reviews.set(i, baseData + "," + replyText);
                isUpdated = true;
                break;
            }
        }

        if (isUpdated) {
            FileHandler.overwriteFile("reviews.txt", reviews);
            response.sendRedirect("ViewReviewsServlet?replySuccess=true");
        } else {
            response.sendRedirect("ViewReviewsServlet?error=true");
        }
    }
}