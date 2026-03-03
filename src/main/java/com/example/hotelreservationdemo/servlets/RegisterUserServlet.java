package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Format: username, password, role (ADMIN), status (PENDING)
        String newUserRecord = user + "," + pass + ",ADMIN,PENDING";
        FileHandler.appendToFile("users.txt", newUserRecord);

        response.sendRedirect("staffLogin.jsp?msg=Access requested! Wait for a Master Admin to approve your account.");
    }
}