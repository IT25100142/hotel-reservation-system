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
@WebServlet("/ViewPaymentServlet")
public class ViewPaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchId = request.getParameter("searchId");
        List<String> payments = FileHandler.readFromFile("payments.txt");
        String foundPayment = null;

        for (String line : payments) {
            String[] data = line.split(",");
            if (data[0].equals(searchId)) {
                foundPayment = line;
                break;
            }
        }

        if (foundPayment != null) {
            request.setAttribute("paymentData", foundPayment);
        } else {
            request.setAttribute("error", "Invoice ID '" + searchId + "' not found.");
        }

        request.getRequestDispatcher("viewPayments.jsp").forward(request, response);
    }
}