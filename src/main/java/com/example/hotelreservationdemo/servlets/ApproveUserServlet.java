package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String targetUser = request.getParameter("username");
        List<String> users = FileHandler.readFromFile("users.txt");

        for (int i = 0; i < users.size(); i++) {
            String[] data = users.get(i).split(",");
            if (data[0].equals(targetUser)) {
                // Change status from PENDING to APPROVED
                String updatedLine = data[0] + "," + data[1] + "," + data[2] + ",APPROVED";
                users.set(i, updatedLine);
                break;
            }
        }

        FileHandler.overwriteFile("users.txt", users);
        response.sendRedirect("MasterDashboardServlet?success=true");
    }
}