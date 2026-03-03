<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #f4f6f9; }
        .ticket-card { border-left: 5px solid #198754; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        .ticket-header { background: #e8f5e9; padding: 20px; border-bottom: 2px dashed #ccc; }
    </style>
</head>
<body>

<!-- UNIVERSAL NAVIGATION BUTTONS -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="DashboardServlet" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>

<div class="container py-5 mt-4">
    <div class="card shadow p-4 mx-auto" style="max-width: 900px; border-radius: 15px;">
        <div class="text-center mb-4">
            <i class="bi bi-search text-success" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2 text-dark">Look Up Reservations</h2>
            <p class="text-muted">Search for a specific booking or view all reservations.</p>
        </div>

        <!-- Success/Error Messages -->
        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success shadow-sm text-center"><i class="bi bi-check-circle-fill me-2"></i>Reservation cancelled successfully!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger shadow-sm text-center"><i class="bi bi-exclamation-triangle-fill me-2"></i>Failed to cancel reservation.</div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger shadow-sm"><i class="bi bi-exclamation-triangle-fill me-2"></i><%= request.getAttribute("error") %></div>
        <% } %>

        <!-- Search Form & Show All Button -->
        <div class="d-flex justify-content-center gap-2 mb-4">
            <form action="ViewReservationServlet" method="GET" class="d-flex flex-grow-1" style="max-width: 500px;">
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-upc-scan"></i></span>
                    <input type="text" name="searchId" class="form-control" placeholder="Enter Booking ID (e.g. BKG-1234)" required>
                    <button type="submit" class="btn btn-success fw-bold px-4">Search</button>
                </div>
            </form>
            <form action="ListReservationsServlet" method="GET">
                <button type="submit" class="btn btn-outline-success fw-bold"><i class="bi bi-list-ul me-2"></i>Show All</button>
            </form>
        </div>

        <!-- SINGLE TICKET DISPLAY -->
        <%
            String bookingData = (String) request.getAttribute("bookingData");
            if (bookingData != null) {
                String[] details = bookingData.split(",");
        %>
        <div class="card bg-white ticket-card mt-3 mx-auto" style="max-width: 600px;">
            <div class="ticket-header text-center rounded-top">
                <h5 class="text-success mb-0 fw-bold">CONFIRMED RESERVATION</h5>
                <small class="text-muted">ID: <%= details[0] %></small>
            </div>
            <div class="card-body p-4">
                <div class="row mb-3">
                    <div class="col-6">
                        <p class="text-muted mb-0 small text-uppercase">Guest Name</p>
                        <h5 class="fw-bold"><i class="bi bi-person-badge text-primary me-2"></i><%= details[1] %></h5>
                    </div>
                    <div class="col-6 text-end">
                        <p class="text-muted mb-0 small text-uppercase">Room</p>
                        <h5 class="fw-bold"><i class="bi bi-door-open text-primary me-2"></i><%= details[2] %></h5>
                    </div>
                </div>
                <hr>
                <div class="row mb-3 text-center">
                    <div class="col-5">
                        <p class="text-muted mb-0 small text-uppercase">Check-In</p>
                        <p class="fw-bold text-dark mb-0"><%= details[3] %></p>
                    </div>
                    <div class="col-2 pt-2 text-muted"><i class="bi bi-arrow-right fs-4"></i></div>
                    <div class="col-5">
                        <p class="text-muted mb-0 small text-uppercase">Check-Out</p>
                        <p class="fw-bold text-dark mb-0"><%= details[4] %></p>
                    </div>
                </div>
                <div class="bg-light p-3 rounded mt-3">
                    <span class="badge bg-dark mb-2 px-3 py-2"><%= details[5] %> Booking</span><br>
                    <small class="text-muted">
                        <% if ("Personal".equals(details[5])) { %>
                        <i class="bi bi-people-fill me-1"></i> Guests: <%= details[6] %>
                        <% } else { %>
                        <i class="bi bi-building-fill me-1"></i> Company: <%= details[6] %>
                        <% } %>
                    </small>
                </div>
            </div>
        </div>
        <% } %>

        <!-- FULL LIST TABLE DISPLAY -->
        <%
            List<String> allReservationsList = (List<String>) request.getAttribute("allReservationsList");
            if (allReservationsList != null) {
                if (allReservationsList.isEmpty()) {
        %>
        <div class="alert alert-info text-center mt-4"><i class="bi bi-info-circle me-2"></i>No reservations found in the system.</div>
        <% } else { %>
        <div class="table-responsive mt-4">
            <table class="table table-hover table-bordered align-middle text-center">
                <thead class="table-success">
                <tr>
                    <th>Booking ID</th>
                    <th>Guest Name</th>
                    <th>Room</th>
                    <th>Dates</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (String line : allReservationsList) {
                        String[] data = line.split(",");
                        if (data.length < 6) continue;
                %>
                <tr>
                    <td class="fw-bold text-secondary"><%= data[0] %></td>
                    <td class="fw-bold"><%= data[1] %></td>
                    <td><span class="badge bg-secondary">Room <%= data[2] %></span></td>
                    <td class="text-muted small">
                        <span class="text-success"><%= data[3] %></span><br>to<br><span class="text-danger"><%= data[4] %></span>
                    </td>
                    <td>
                        <span class="badge <%= "Corporate".equals(data[5]) ? "bg-dark" : "bg-primary" %>"><%= data[5] %></span><br>
                        <small class="text-muted"><%= data[6] %></small>
                    </td>
                    <td>
                        <!-- Inline Cancel Button -->
                        <form action="CancelReservationServlet" method="POST" style="margin: 0;">
                            <input type="hidden" name="bookingId" value="<%= data[0] %>">
                            <input type="hidden" name="source" value="list">
                            <button type="submit" class="btn btn-sm btn-outline-danger" title="Cancel Booking" onclick="return confirm('Are you sure you want to cancel booking <%= data[0] %>?');">
                                <i class="bi bi-x-octagon-fill"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <%
                }
            }
        %>

        <!-- STYLED BOTTOM MENU -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="makeReservation.jsp" class="btn btn-outline-primary shadow-sm fw-bold"><i class="bi bi-calendar-plus me-1"></i>New Booking</a>
            <a href="cancelBooking.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash3 me-1"></i>Cancel Booking</a>
        </div>
    </div>
</div>
</body>
</html>