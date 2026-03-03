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
@WebServlet("/DeleteGuestServlet")
public class DeleteGuestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String guestIdToDelete = request.getParameter("id");
        String source = request.getParameter("source"); // Tells us where the request came from

        List<String> guests = FileHandler.readFromFile("guests.txt");
        boolean isDeleted = false;

        // Search for the guest and remove their line from the list
        for (int i = 0; i < guests.size(); i++) {
            String[] data = guests.get(i).split(",");
            if (data[0].equals(guestIdToDelete)) {
                guests.remove(i);
                isDeleted = true;
                break;
            }
        }

        // Overwrite the file with the updated list and redirect smartly!
        if (isDeleted) {
            FileHandler.overwriteFile("guests.txt", guests);
            if ("list".equals(source)) {
                response.sendRedirect("ListGuestsServlet?success=true");
            } else {
                response.sendRedirect("removeGuest.jsp?success=true");
            }
        } else {
            if ("list".equals(source)) {
                response.sendRedirect("ListGuestsServlet?error=true");
            } else {
                response.sendRedirect("removeGuest.jsp?error=true");
            }
        }
    }
}