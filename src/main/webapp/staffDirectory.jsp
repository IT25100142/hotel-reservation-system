<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Staff Directory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #ecf0f1; }
        .directory-card { border: none; border-radius: 10px; transition: 0.3s; }
        .directory-card:hover { transform: translateY(-3px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .avatar { width: 50px; height: 50px; background: #34495e; color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px; font-weight: bold; }
    </style>
</head>
<body>
<!-- ========================================== -->
<!-- UNIVERSAL NAVIGATION BUTTONS -->
<!-- ========================================== -->
<div class="position-fixed d-flex" style="top: 20px; left: 20px; z-index: 9999;">
    <button onclick="history.back()" class="btn btn-light shadow me-2 d-flex align-items-center" style="border-radius: 10px; font-weight: bold; border: 1px solid #dee2e6;">
        <i class="bi bi-arrow-left-circle-fill text-secondary me-2 fs-5"></i> Back
    </button>
    <a href="index.jsp" class="btn btn-dark shadow d-flex align-items-center" style="border-radius: 10px; font-weight: bold;">
        <i class="bi bi-house-door-fill text-warning me-2 fs-5"></i> Home
    </a>
</div>
<!-- ========================================== -->
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-dark"><i class="bi bi-journal-richtext me-2 text-primary"></i>Hotel Staff Directory</h2>
        <a href="staffRegistration.jsp" class="btn btn-primary"><i class="bi bi-plus-lg me-1"></i>New Hire</a>
    </div>

    <div class="row g-4">
        <%
            List<String> staffList = (List<String>) request.getAttribute("staffList");
            if (staffList != null && !staffList.isEmpty()) {
                for (String staff : staffList) {
                    String[] data = staff.split(",");
                    if(data.length < 6) continue;
                    String roleBadge = "Manager".equals(data[4]) ? "bg-danger" : "bg-info";
        %>
        <div class="col-md-6 col-lg-4">
            <div class="card directory-card h-100 p-3">
                <div class="d-flex align-items-center mb-3">
                    <div class="avatar me-3"><%= data[1].substring(0, 1).toUpperCase() %></div>
                    <div>
                        <h5 class="mb-0 fw-bold"><%= data[1] %></h5>
                        <small class="text-muted">ID: <%= data[0] %></small>
                    </div>
                </div>
                <div class="mb-3">
                    <span class="badge <%= roleBadge %> mb-2"><%= data[4] %></span><br>
                    <small class="text-muted"><i class="bi bi-telephone-fill me-2"></i><%= data[2] %></small>
                </div>
                <div class="bg-light p-2 rounded small border">
                    <% if ("Manager".equals(data[4])) { %>
                    <strong>Dept:</strong> <%= data[5] %>
                    <% } else { %>
                    <strong>Floor Assigned:</strong> <%= data[5] %>
                    <% } %>
                    <br>
                    <span class="text-success fw-bold">Salary: $<%= data[3] %></span>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center py-5">
            <i class="bi bi-folder-x text-muted" style="font-size: 4rem;"></i>
            <h4 class="text-muted mt-3">No staff records found.</h4>
        </div>
        <% } %>
    </div>

    <div class="text-center mt-5">
        <a href="editStaff.jsp" class="btn btn-outline-secondary px-4"><i class="bi bi-gear me-2"></i>Manage Staff Records</a>
    </div>
</div>
</body>
</html>