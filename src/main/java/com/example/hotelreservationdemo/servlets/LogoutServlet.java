package com.example.hotelreservationdemo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String role = ""; // We will store their role here before logging them out

        if (session != null) {
            // Check if they are a GUEST or a Staff Member (ADMIN/MASTER)
            if (session.getAttribute("role") != null) {
                role = (String) session.getAttribute("role");
            }
            session.invalidate(); // Destroy the session entirely
        }

        // SMART REDIRECT: Send them to the correct login page based on their role
        if ("GUEST".equals(role)) {
            response.sendRedirect("guestLogin.jsp?msg=You have successfully logged out of your Guest Account.");
        } else {
            response.sendRedirect("staffLogin.jsp?msg=You have successfully logged out of the Secure Staff Portal.");
        }
    }
}