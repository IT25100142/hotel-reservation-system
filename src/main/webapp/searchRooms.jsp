<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search Rooms</title>
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

<div class="container mt-5 pt-4">
    <div class="card shadow p-4 mx-auto" style="max-width: 900px;">
        <div class="text-center mb-4">
            <i class="bi bi-building-check text-success" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2 text-success">Room Inventory</h2>
        </div>

        <!-- Filter Form -->
        <form action="SearchRoomServlet" method="GET" class="d-flex mb-4">
            <select name="roomType" class="form-select me-2 border-success">
                <option value="All">All Room Types</option>
                <option value="Standard">Standard Rooms</option>
                <option value="Deluxe">Deluxe Rooms</option>
                <option value="Suite">Suite Rooms</option>
            </select>
            <button type="submit" class="btn btn-success fw-bold"><i class="bi bi-funnel-fill me-2"></i>Filter</button>
        </form>

        <!-- Rooms Table -->
        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center align-middle">
                <thead class="table-success">
                <tr>
                    <th>Room ID</th>
                    <th>Type</th>
                    <th>Rate/Night (Rs)</th>
                    <th>Available?</th>
                    <th>Feature Status</th>
                    <th>Action</th> <!-- NEW ACTION COLUMN -->
                </tr>
                </thead>
                <tbody>
                <%
                    List<String> roomList = (List<String>) request.getAttribute("roomList");
                    if (roomList != null && !roomList.isEmpty()) {
                        for (String room : roomList) {
                            String[] data = room.split(",");

                            // SAFETY CHECK: Skip broken lines
                            if (data.length < 4) continue;

                            String badgeColor = "bg-secondary";
                            if("Suite".equals(data[1])) badgeColor = "bg-warning text-dark";
                            if("Deluxe".equals(data[1])) badgeColor = "bg-info text-dark";
                %>
                <tr>
                    <td class="fw-bold"><%= data[0] %></td>
                    <td><span class="badge <%= badgeColor %>"><%= data[1] %></span></td>
                    <td class="fw-bold text-muted">Rs <%= data[2] %></td>
                    <td class="<%= "true".equals(data[3]) ? "text-success" : "text-danger" %> fw-bold">
                        <%= "true".equals(data[3]) ? "<i class='bi bi-check-circle-fill me-1'></i>Yes" : "<i class='bi bi-x-circle-fill me-1'></i>No" %>
                    </td>
                    <td>
                        <%= (data.length > 4 && "true".equals(data[4])) ? "<span class='text-primary fw-bold'>Included</span>" : "Not Included" %>
                    </td>
                    <td>
                        <!-- INLINE EDIT BUTTON -->
                        <a href="editRoom.jsp?roomId=<%= data[0] %>" class="btn btn-sm btn-outline-warning" title="Edit Room Details">
                            <i class="bi bi-pencil-square text-dark"></i>
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center text-muted py-5">
                        <i class="bi bi-door-closed text-muted opacity-50 d-block mb-3" style="font-size: 3rem;"></i>
                        <h5>No rooms match your filter.</h5>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <!-- STYLED BUTTON MENU -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="addRoom.jsp" class="btn btn-outline-primary shadow-sm fw-bold"><i class="bi bi-plus-circle me-1"></i>Add New Room</a>
            <a href="editRoom.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit Room</a>
            <a href="removeRoom.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash me-1"></i>Remove Room</a>
        </div>
    </div>
</div>
</body>
</html>