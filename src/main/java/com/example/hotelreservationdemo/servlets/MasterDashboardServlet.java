package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/MasterDashboardServlet")
public class MasterDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Protect this specific Servlet from regular Admins hacking the URL
        HttpSession session = request.getSession(false);
        if (session == null || !"MASTER".equals(session.getAttribute("role"))) {
            response.sendRedirect("DashboardServlet"); // Kick regular admins to normal dashboard
            return;
        }

        List<String> users = FileHandler.readFromFile("users.txt");
        List<String[]> pendingUsers = new ArrayList<>();

        for (String line : users) {
            String[] data = line.split(",");
            if (data.length == 4 && "PENDING".equals(data[3])) {
                pendingUsers.add(data);
            }
        }

        request.setAttribute("pendingUsers", pendingUsers);
        request.getRequestDispatcher("masterDashboard.jsp").forward(request, response);
    }
}