package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Auto-create 3 Master Admins if the file is completely empty
        List<String> users = FileHandler.readFromFile("users.txt");
        if (users.isEmpty()) {
            FileHandler.appendToFile("users.txt", "master1,admin123,MASTER,APPROVED");
            FileHandler.appendToFile("users.txt", "master2,admin123,MASTER,APPROVED");
            FileHandler.appendToFile("users.txt", "master3,admin123,MASTER,APPROVED");
            users = FileHandler.readFromFile("users.txt");
        }

        boolean found = false;
        for (String line : users) {
            String[] data = line.split(","); // format: user,pass,role,status
            if (data[0].equals(user) && data[1].equals(pass)) {
                found = true;
                if ("PENDING".equals(data[3])) {
                    response.sendRedirect("staffLogin.jsp?error=Your account is awaiting Master approval.");
                    return;
                }

                // Login Success: Create Session
                HttpSession session = request.getSession();
                session.setAttribute("username", data[0]);
                session.setAttribute("role", data[2]);

                // Redirect based on Hierarchy
                if ("MASTER".equals(data[2])) {
                    response.sendRedirect("MasterDashboardServlet");
                } else {
                    response.sendRedirect("DashboardServlet");
                }
                return;
            }
        }

        if (!found) {
            response.sendRedirect("staffLogin.jsp?error=Invalid username or password.");
        }
    }
}