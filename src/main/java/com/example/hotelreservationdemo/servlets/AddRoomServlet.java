package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.models.DeluxeRoom;
import com.example.hotelreservationdemo.models.Room;
import com.example.hotelreservationdemo.models.StandardRoom;
import com.example.hotelreservationdemo.models.SuiteRoom;
import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// CREATE OPERATION
@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("roomId");
        double baseRate = Double.parseDouble(request.getParameter("baseRate"));
        String roomType = request.getParameter("roomType");
        boolean hasFeature = "true".equals(request.getParameter("hasFeature"));
        boolean isAvailable = true; // New rooms are available by default

        Room newRoom;

        // POLYMORPHISM: Now handling 3 different child classes!
        if ("Standard".equals(roomType)) {
            newRoom = new StandardRoom(roomId, baseRate, isAvailable, hasFeature);
        } else if ("Suite".equals(roomType)) {
            newRoom = new SuiteRoom(roomId, baseRate, isAvailable, hasFeature);
        } else {
            newRoom = new DeluxeRoom(roomId, baseRate, isAvailable, hasFeature);
        }

        // Save to rooms.txt
        FileHandler.appendToFile("rooms.txt", newRoom.toFileString());

        response.sendRedirect("addRoom.jsp?success=true");
    }
}