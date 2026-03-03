<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Master Security Clearance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark mb-5 shadow">
    <div class="container-fluid px-4">
        <span class="navbar-brand fw-bold text-warning"><i class="bi bi-shield-check me-2"></i>Master Admin Console</span>
        <div class="d-flex align-items-center">
            <span class="text-light me-4">Logged in as: <strong>${sessionScope.username}</strong></span>
            <a href="DashboardServlet" class="btn btn-outline-light btn-sm me-2">Go to Main Dashboard</a>
            <a href="LogoutServlet" class="btn btn-danger btn-sm"><i class="bi bi-box-arrow-right me-1"></i>Logout</a>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="mb-4 text-center fw-bold">Pending Access Requests</h2>

    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success text-center fw-bold w-50 mx-auto shadow-sm">User has been granted System Access!</div>
    <% } %>

    <div class="card shadow border-0 rounded-4 p-4 mx-auto" style="max-width: 800px;">
        <table class="table table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>Username</th>
                <th>Requested Role</th>
                <th>Status</th>
                <th class="text-end">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<String[]> pendingUsers = (List<String[]>) request.getAttribute("pendingUsers");
                if (pendingUsers != null && !pendingUsers.isEmpty()) {
                    for (String[] user : pendingUsers) {
            %>
            <tr>
                <td class="fw-bold"><i class="bi bi-person-fill me-2 text-secondary"></i><%= user[0] %></td>
                <td><span class="badge bg-primary"><%= user[2] %></span></td>
                <td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i><%= user[3] %></span></td>
                <td class="text-end">
                    <form action="ApproveUserServlet" method="POST" style="margin:0;">
                        <input type="hidden" name="username" value="<%= user[0] %>">
                        <button type="submit" class="btn btn-success btn-sm fw-bold px-3 shadow-sm"><i class="bi bi-check-lg me-1"></i>Approve Access</button>
                    </form>
                </td>
            </tr>
            <%      }
            } else {
            %>
            <tr><td colspan="4" class="text-center py-4 text-muted"><i class="bi bi-check2-all fs-2 d-block mb-2"></i>No pending approval requests.</td></tr>
            <%  } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>