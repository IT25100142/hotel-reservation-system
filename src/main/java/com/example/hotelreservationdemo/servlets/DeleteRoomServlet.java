package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

// DELETE OPERATION
@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomIdToDelete = request.getParameter("roomId");

        List<String> rooms = FileHandler.readFromFile("rooms.txt");
        boolean isDeleted = false;

        // Search for the room and remove it from the list
        for (int i = 0; i < rooms.size(); i++) {
            String[] data = rooms.get(i).split(",");
            if (data[0].equals(roomIdToDelete)) {
                rooms.remove(i);
                isDeleted = true;
                break;
            }
        }

        // If found and removed, overwrite the file with the new list
        if (isDeleted) {
            FileHandler.overwriteFile("rooms.txt", rooms);
            response.sendRedirect("removeRoom.jsp?success=true");
        } else {
            response.sendRedirect("removeRoom.jsp?error=true");
        }
    }
}