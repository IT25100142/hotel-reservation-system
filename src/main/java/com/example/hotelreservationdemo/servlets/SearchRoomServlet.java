package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// READ OPERATION
@WebServlet("/SearchRoomServlet")
public class SearchRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchType = request.getParameter("roomType");
        List<String> allRooms = FileHandler.readFromFile("rooms.txt");
        List<String> filteredRooms = new ArrayList<>();

        // If no filter is applied, show all rooms. Otherwise, filter by type.
        for (String line : allRooms) {
            String[] data = line.split(",");
            if (data.length >= 2) {
                if (searchType == null || searchType.isEmpty() || searchType.equals("All") || data[1].equals(searchType)) {
                    filteredRooms.add(line);
                }
            }
        }

        request.setAttribute("roomList", filteredRooms);
        request.getRequestDispatcher("searchRooms.jsp").forward(request, response);
    }
}