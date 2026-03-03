package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/GuestAuthServlet")
public class GuestAuthServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        if ("register".equals(action)) {
            // Save to a new text file just for guest web accounts
            FileHandler.appendToFile("web_guests.txt", email + "," + pass);

            // Auto-login after registration
            HttpSession session = request.getSession();
            session.setAttribute("username", email);
            session.setAttribute("role", "GUEST");
            response.sendRedirect("guestDashboard.jsp");

        } else if ("login".equals(action)) {
            List<String> guests = FileHandler.readFromFile("web_guests.txt");
            boolean found = false;

            for (String line : guests) {
                String[] data = line.split(",");
                if (data.length == 2 && data[0].equals(email) && data[1].equals(pass)) {
                    found = true;
                    HttpSession session = request.getSession();
                    session.setAttribute("username", email);
                    session.setAttribute("role", "GUEST");
                    response.sendRedirect("guestDashboard.jsp");
                    return;
                }
            }
            if (!found) {
                response.sendRedirect("guestLogin.jsp?error=Invalid email or password.");
            }
        }
    }
}