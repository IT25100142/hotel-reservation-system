package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.CardPayment;
import com.example.hotelreservationdemo.models.CashPayment;
import com.example.hotelreservationdemo.models.Payment;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/GenerateInvoiceServlet")
public class GenerateInvoiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = "INV-" + System.currentTimeMillis(); // Auto-generate Invoice ID
        String guestName = request.getParameter("guestName");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentType = request.getParameter("paymentType");
        String status = "Pending"; // New invoices are always pending until paid

        Payment newPayment;

        // Polymorphism based on UI selection
        if ("Card".equals(paymentType)) {
            String provider = request.getParameter("cardProvider");
            newPayment = new CardPayment(paymentId, guestName, amount, status, provider);
        } else {
            String currency = request.getParameter("currencyType");
            newPayment = new CashPayment(paymentId, guestName, amount, status, currency);
        }

        // Save to Database (payments.txt)
        FileHandler.appendToFile("payments.txt", newPayment.toFileString());

        response.sendRedirect("generateInvoice.jsp?success=true&invoiceId=" + paymentId);
    }
}