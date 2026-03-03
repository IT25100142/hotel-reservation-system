package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteStaffServlet")
public class DeleteStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empId = request.getParameter("employeeId");

        List<String> staff = FileHandler.readFromFile("staff.txt");
        boolean isDeleted = false;

        for (int i = 0; i < staff.size(); i++) {
            if (staff.get(i).startsWith(empId + ",")) {
                staff.remove(i);
                isDeleted = true;
                break;
            }
        }

        if (isDeleted) {
            FileHandler.overwriteFile("staff.txt", staff);
            response.sendRedirect("removeStaff.jsp?success=true");
        } else {
            response.sendRedirect("removeStaff.jsp?error=true");
        }
    }
}