<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Grand Oasis - Guest Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body { background: #e9ecef; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
    .guest-card { background: #ffffff; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); width: 100%; max-width: 450px; overflow: hidden; }
    .brand-header { background: #198754; color: white; padding: 35px 20px; text-align: center; }
    .staff-link { color: #adb5bd; transition: color 0.3s ease; }
    .staff-link:hover { color: #495057; }
  </style>
</head>
<body>
<div class="guest-card">
  <div class="brand-header">
    <i class="bi bi-buildings-fill" style="font-size: 3.5rem;"></i>
    <h2 class="fw-bold mt-2">Grand Oasis Hotel</h2>
    <p class="mb-0 opacity-75">Exclusive Guest Portal</p>
  </div>

  <div class="p-4 p-md-5">
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger text-center small fw-bold"><i class="bi bi-exclamation-triangle-fill me-2"></i><%= request.getParameter("error") %></div>
    <% } %>

    <!-- Tabs -->
    <ul class="nav nav-pills nav-justified mb-4" id="guestTabs" role="tablist">
      <li class="nav-item" role="presentation"><button class="nav-link active fw-bold" data-bs-toggle="tab" data-bs-target="#signin" type="button" role="tab">Sign In</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link fw-bold text-success" data-bs-toggle="tab" data-bs-target="#signup" type="button" role="tab">Create Account</button></li>
    </ul>

    <div class="tab-content">
      <!-- SIGN IN TAB -->
      <div class="tab-pane fade show active" id="signin" role="tabpanel">
        <form action="GuestAuthServlet" method="POST">
          <input type="hidden" name="action" value="login">
          <div class="mb-3">
            <label class="form-label text-muted small fw-bold text-uppercase">Email Address</label>
            <input type="email" name="email" class="form-control form-control-lg bg-light border-0" required>
          </div>
          <div class="mb-4">
            <label class="form-label text-muted small fw-bold text-uppercase">Password</label>
            <input type="password" name="password" class="form-control form-control-lg bg-light border-0" required>
          </div>
          <button type="submit" class="btn btn-success btn-lg w-100 fw-bold shadow-sm">Access My Account <i class="bi bi-arrow-right ms-2"></i></button>
        </form>
      </div>

      <!-- SIGN UP TAB -->
      <div class="tab-pane fade" id="signup" role="tabpanel">
        <form action="GuestAuthServlet" method="POST">
          <input type="hidden" name="action" value="register">
          <div class="mb-3">
            <label class="form-label text-muted small fw-bold text-uppercase">Email Address</label>
            <input type="email" name="email" class="form-control bg-light border-0" required>
          </div>
          <div class="mb-4">
            <label class="form-label text-muted small fw-bold text-uppercase">Create Password</label>
            <input type="password" name="password" class="form-control bg-light border-0" required>
          </div>
          <button type="submit" class="btn btn-outline-success btn-lg w-100 fw-bold shadow-sm">Join Grand Oasis</button>
        </form>
      </div>
    </div>

    <!-- THE STAFF LINK (Now clearly visible at the bottom of the card) -->
    <div class="text-center mt-5 pt-3 border-top">
      <a href="staffLogin.jsp" class="text-decoration-none staff-link small fw-bold">
        <i class="bi bi-shield-lock-fill me-1"></i> Secure Staff Login
      </a>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>