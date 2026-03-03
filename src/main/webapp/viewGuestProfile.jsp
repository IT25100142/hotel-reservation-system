<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guest Profiles & Directory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .guest-card { border-top: 4px solid #198754; border-radius: 12px; }
    </style>
</head>
<body>

<!-- UNIVERSAL NAVIGATION BUTTONS -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="index.jsp" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>

<div class="container mt-5 pt-4">
    <div class="card shadow-sm p-4 mx-auto guest-card" style="max-width: 900px;">
        <div class="text-center mb-4">
            <i class="bi bi-person-lines-fill text-success" style="font-size: 3rem;"></i>
            <h2 class="fw-bold mt-2">Guest Directory</h2>
            <p class="text-muted">Search for a specific guest or view the entire registered list.</p>
        </div>

        <!-- Success/Error Messages for Table Deletions -->
        <% if ("true".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success shadow-sm text-center"><i class="bi bi-check-circle-fill me-2"></i>Guest successfully deleted!</div>
        <% } else if ("true".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger shadow-sm text-center"><i class="bi bi-exclamation-triangle-fill me-2"></i>Failed to delete guest.</div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger shadow-sm"><i class="bi bi-exclamation-triangle-fill me-2"></i><%= request.getAttribute("error") %></div>
        <% } %>

        <!-- Search Form and Show All Button -->
        <div class="d-flex justify-content-center gap-2 mb-4">
            <form action="SearchGuestServlet" method="GET" class="d-flex flex-grow-1" style="max-width: 500px;">
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="bi bi-search"></i></span>
                    <input type="text" name="searchId" class="form-control" placeholder="Enter Guest ID (e.g., G101)" required>
                    <button type="submit" class="btn btn-success fw-bold">Search</button>
                </div>
            </form>
            <form action="ListGuestsServlet" method="GET">
                <button type="submit" class="btn btn-outline-success fw-bold"><i class="bi bi-list-ul me-2"></i>Show All Guests</button>
            </form>
        </div>

        <!-- Single Guest Display (If Search Was Used) -->
        <%
            String guestData = (String) request.getAttribute("guestData");
            if (guestData != null) {
                String[] details = guestData.split(",");
                boolean isVIP = "VIP".equals(details[4]);
        %>
        <div class="card bg-light border-0 mb-3 shadow-sm rounded-4">
            <div class="card-body p-4 text-center">
                <h4 class="fw-bold text-dark"><%= details[1] %></h4>
                <span class="badge <%= isVIP ? "bg-warning text-dark" : "bg-secondary" %> mb-3 px-3 py-2 fs-6">
                            <%= isVIP ? "<i class='bi bi-star-fill me-1'></i> VIP Guest" : "Regular Guest" %>
                        </span>
                <div class="row text-start mt-3">
                    <div class="col-sm-6 mb-2"><strong>ID:</strong> <%= details[0] %></div>
                    <div class="col-sm-6 mb-2"><strong>Phone:</strong> <%= details[3] %></div>
                    <div class="col-sm-6 mb-2"><strong>Email:</strong> <%= details[2] %></div>
                    <% if (isVIP) { %>
                    <div class="col-sm-6 mb-2"><strong class="text-warning">Points:</strong> <%= details[5] %></div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>

        <!-- Full Guest List Display (If 'Show All' Was Clicked) -->
        <%
            List<String> allGuestsList = (List<String>) request.getAttribute("allGuestsList");
            if (allGuestsList != null) {
                if (allGuestsList.isEmpty()) {
        %>
        <div class="alert alert-info text-center"><i class="bi bi-info-circle me-2"></i>No guests currently registered in the system.</div>
        <% } else { %>
        <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle text-center mt-3">
                <thead class="table-success">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Contact Details</th>
                    <th>Guest Type</th>
                    <th>Points</th>
                    <th>Action</th> <!-- New Action Column -->
                </tr>
                </thead>
                <tbody>
                <%
                    for (String line : allGuestsList) {
                        String[] data = line.split(",");
                        if (data.length < 6) continue;
                        boolean isVIP = "VIP".equals(data[4]);
                %>
                <tr>
                    <td class="fw-bold"><%= data[0] %></td>
                    <td><%= data[1] %></td>
                    <td class="text-muted small">
                        <i class="bi bi-envelope me-1"></i><%= data[2] %><br>
                        <i class="bi bi-telephone me-1"></i><%= data[3] %>
                    </td>
                    <td><span class="badge <%= isVIP ? "bg-warning text-dark" : "bg-secondary" %>"><%= data[4] %></span></td>
                    <td class="fw-bold text-muted"><%= isVIP ? data[5] : "-" %></td>

                    <!-- New Delete Button Form -->
                    <td>
                        <form action="DeleteGuestServlet" method="POST" style="margin: 0;">
                            <!-- Send the ID to delete -->
                            <input type="hidden" name="id" value="<%= data[0] %>">
                            <!-- Tell the servlet we are deleting from the list page! -->
                            <input type="hidden" name="source" value="list">

                            <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete Guest" onclick="return confirm('Are you sure you want to delete guest <%= data[0] %>?');">
                                <i class="bi bi-trash-fill"></i>
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

        <!-- STYLED BUTTON MENU -->
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="guestRegistration.jsp" class="btn btn-outline-primary shadow-sm fw-bold"><i class="bi bi-person-plus-fill me-1"></i>Register</a>
            <a href="editGuest.jsp" class="btn btn-outline-warning shadow-sm fw-bold text-dark"><i class="bi bi-pencil-square me-1"></i>Edit</a>
            <a href="removeGuest.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-person-x-fill me-1"></i>Delete</a>
        </div>
    </div>
</div>
</body>
</html>