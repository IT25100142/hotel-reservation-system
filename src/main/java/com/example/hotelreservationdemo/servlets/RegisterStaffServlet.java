package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.Employee;
import com.example.hotelreservationdemo.models.Housekeeper;
import com.example.hotelreservationdemo.models.Manager;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/RegisterStaffServlet")
public class RegisterStaffServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empId = request.getParameter("employeeId");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String role = request.getParameter("role");

        Employee newEmployee;

        // Apply Polymorphism dynamically based on the form
        if ("Manager".equals(role)) {
            String department = request.getParameter("department");
            newEmployee = new Manager(empId, name, phone, salary, department);
        } else {
            int floor = Integer.parseInt(request.getParameter("assignedFloor"));
            newEmployee = new Housekeeper(empId, name, phone, salary, floor);
        }

        // Save to staff.txt
        FileHandler.appendToFile("staff.txt", newEmployee.toFileString());

        response.sendRedirect("staffRegistration.jsp?success=true");
    }
}