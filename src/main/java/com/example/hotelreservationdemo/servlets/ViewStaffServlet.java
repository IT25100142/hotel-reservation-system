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
@WebServlet("/ViewStaffServlet")
public class ViewStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read all staff from the text file
        List<String> staffList = FileHandler.readFromFile("staff.txt");

        // Pass the list to the JSP page
        request.setAttribute("staffList", staffList);
        request.getRequestDispatcher("staffDirectory.jsp").forward(request, response);
    }
}