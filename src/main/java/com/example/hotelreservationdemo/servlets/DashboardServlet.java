package com.example.hotelreservationdemo.servlets;

import com.example.hotelreservationdemo.utils.FileHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Count Total Guests
        List<String> guests = FileHandler.readFromFile("guests.txt");
        request.setAttribute("totalGuests", guests.size());

        // 2. Count Available Rooms
        List<String> rooms = FileHandler.readFromFile("rooms.txt");
        int availableRooms = 0;
        for (String room : rooms) {
            String[] data = room.split(",");
            if (data.length >= 4 && "true".equals(data[3])) {
                availableRooms++;
            }
        }
        request.setAttribute("availableRooms", availableRooms);

        // 3. Count Pending Invoices
        List<String> payments = FileHandler.readFromFile("payments.txt");
        int pendingInvoices = 0;
        for (String payment : payments) {
            String[] data = payment.split(",");
            if (data.length >= 4 && "Pending".equals(data[3])) {
                pendingInvoices++;
            }
        }
        request.setAttribute("pendingInvoices", pendingInvoices);

        // Forward to the upgraded Dashboard
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}