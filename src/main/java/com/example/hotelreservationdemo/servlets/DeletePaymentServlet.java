package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String invoiceId = request.getParameter("invoiceId");

        List<String> payments = FileHandler.readFromFile("payments.txt");
        boolean isDeleted = false;

        for (int i = 0; i < payments.size(); i++) {
            if (payments.get(i).startsWith(invoiceId + ",")) {
                payments.remove(i);
                isDeleted = true;
                break;
            }
        }

        if (isDeleted) {
            FileHandler.overwriteFile("payments.txt", payments);
            response.sendRedirect("removePayment.jsp?success=true");
        } else {
            response.sendRedirect("removePayment.jsp?error=true");
        }
    }
}