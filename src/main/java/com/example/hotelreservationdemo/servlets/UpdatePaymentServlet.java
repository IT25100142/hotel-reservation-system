package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// UPDATE OPERATION
@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String invoiceIdToUpdate = request.getParameter("invoiceId");
        String newStatus = request.getParameter("newStatus"); // "Paid" or "Pending"

        List<String> payments = FileHandler.readFromFile("payments.txt");
        boolean isUpdated = false;

        for (int i = 0; i < payments.size(); i++) {
            String[] data = payments.get(i).split(",");
            if (data[0].equals(invoiceIdToUpdate)) {
                // Keep everything same, but update the status (Index 3)
                String updatedLine = data[0] + "," + data[1] + "," + data[2] + "," + newStatus + "," + data[4] + "," + data[5];
                payments.set(i, updatedLine);
                isUpdated = true;
                break;
            }
        }

        if (isUpdated) {
            FileHandler.overwriteFile("payments.txt", payments);
            response.sendRedirect("updatePayment.jsp?success=true");
        } else {
            response.sendRedirect("updatePayment.jsp?error=true");
        }
    }
}