package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("roomId");
        String newRate = request.getParameter("baseRate");
        String newAvailability = request.getParameter("isAvailable");

        List<String> rooms = FileHandler.readFromFile("rooms.txt");
        boolean isUpdated = false;

        for (int i = 0; i < rooms.size(); i++) {
            String[] data = rooms.get(i).split(",");
            if (data[0].equals(roomId)) {
                // Keep ID(0), Type(1), and Feature(4) the same. Update Rate(2) and Availability(3)
                String feature = data.length > 4 ? data[4] : "false";
                rooms.set(i, data[0] + "," + data[1] + "," + newRate + "," + newAvailability + "," + feature);
                isUpdated = true;
                break;
            }
        }

        if (isUpdated) {
            FileHandler.overwriteFile("rooms.txt", rooms);
            response.sendRedirect("editRoom.jsp?success=true");
        } else {
            response.sendRedirect("editRoom.jsp?error=true");
        }
    }
}