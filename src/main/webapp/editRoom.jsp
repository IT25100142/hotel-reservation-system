<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // SMART FEATURE: Grab the roomId from the URL if we clicked the inline Edit button!
    String prefillId = request.getParameter("roomId") != null ? request.getParameter("roomId") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Room</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

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
    <div class="card shadow p-4 mx-auto border-top border-warning border-4" style="max-width: 500px;">
        <div class="text-center mb-4">
            <i class="bi bi-pencil-square text-warning" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2">Update Room Pricing & Status</h2>
        </div>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success shadow-sm text-center"><i class="bi bi-check-circle-fill me-2"></i>Room successfully updated!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger shadow-sm text-center"><i class="bi bi-exclamation-triangle-fill me-2"></i>Room ID not found.</div>
        <% } %>

        <form action="UpdateRoomServlet" method="POST">
            <div class="mb-3">
                <label class="form-label fw-bold text-secondary">Room ID to Edit</label>
                <input type="text" name="roomId" class="form-control" value="<%= prefillId %>" required <%= prefillId.isEmpty() ? "" : "readonly" %>>
                <% if (!prefillId.isEmpty()) { %>
                <small class="text-success"><i class="bi bi-check2 me-1"></i>Auto-filled from inventory</small>
                <% } %>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold text-secondary">New Rate per Night (Rs)</label>
                <div class="input-group">
                    <span class="input-group-text bg-light fw-bold">Rs</span>
                    <input type="number" step="0.01" name="baseRate" class="form-control" placeholder="E.g., 25000.00" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold text-secondary">Room Availability</label>
                <select name="isAvailable" class="form-select border-warning shadow-sm">
                    <option value="true">Available for Booking</option>
                    <option value="false">Out of Service / Occupied</option>
                </select>
            </div>

            <button type="submit" class="btn btn-warning w-100 fw-bold shadow-sm">
                <i class="bi bi-save-fill me-2"></i>Save Changes
            </button>
        </form>

        <div class="text-center mt-4 pt-3 border-top">
            <a href="SearchRoomServlet" class="text-decoration-none text-secondary me-3 fw-bold"><i class="bi bi-search me-1"></i>View Inventory</a>
        </div>
    </div>
</div>
</body>
</html>