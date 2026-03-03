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
@WebServlet("/UpdateStaffServlet")
public class UpdateStaffServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empIdToUpdate = request.getParameter("employeeId");
        String newPhone = request.getParameter("phone");
        String newSalaryStr = request.getParameter("salary");

        List<String> staff = FileHandler.readFromFile("staff.txt");
        boolean isUpdated = false;

        for (int i = 0; i < staff.size(); i++) {
            String[] data = staff.get(i).split(",");
            if (data[0].equals(empIdToUpdate)) {
                // Update phone (index 2) and salary (index 3). Keep the rest the same.
                String updatedLine = data[0] + "," + data[1] + "," + newPhone + "," + newSalaryStr + "," + data[4] + "," + data[5];
                staff.set(i, updatedLine);
                isUpdated = true;
                break;
            }
        }

        if (isUpdated) {
            FileHandler.overwriteFile("staff.txt", staff);
            response.sendRedirect("editStaff.jsp?success=true");
        } else {
            response.sendRedirect("editStaff.jsp?error=true");
        }
    }
}