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
@WebServlet("/UpdateGuestServlet")
public class UpdateGuestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idToUpdate = request.getParameter("id");
        String newEmail = request.getParameter("email");
        String newPhone = request.getParameter("phone");

        List<String> guests = FileHandler.readFromFile("guests.txt");
        boolean updated = false;

        // Loop through and update the matching record
        for (int i = 0; i < guests.size(); i++) {
            String[] data = guests.get(i).split(",");
            if (data[0].equals(idToUpdate)) {
                // Keep ID, Name, Type, Extra, but update Email and Phone
                String updatedLine = data[0] + "," + data[1] + "," + newEmail + "," + newPhone + "," + data[4] + "," + data[5];
                guests.set(i, updatedLine);
                updated = true;
                break;
            }
        }

        if (updated) {
            FileHandler.overwriteFile("guests.txt", guests);
            response.sendRedirect("editGuest.jsp?success=true");
        } else {
            response.sendRedirect("editGuest.jsp?error=true");
        }
    }
}