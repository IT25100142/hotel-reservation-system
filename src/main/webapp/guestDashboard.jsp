<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Guest Account</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body { background-color: #f8f9fa; }
    .hero { background: #198754; color: white; padding: 40px 0; margin-bottom: 40px; border-bottom-left-radius: 50px; border-bottom-right-radius: 50px; }
    .feature-card { border: none; border-radius: 15px; transition: 0.3s; cursor: pointer; text-decoration: none; color: inherit; display: block; }
    .feature-card:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm py-3">
  <div class="container">
    <a class="navbar-brand fw-bold text-success" href="#"><i class="bi bi-buildings-fill me-2"></i>Grand Oasis</a>
    <div class="d-flex align-items-center">
      <span class="text-muted me-3">Hello, <strong>${sessionScope.username}</strong></span>
      <a href="LogoutServlet" class="btn btn-outline-danger btn-sm"><i class="bi bi-box-arrow-right me-1"></i>Sign Out</a>
    </div>
  </div>
</nav>

<div class="hero text-center shadow-sm">
  <div class="container">
    <h1 class="display-5 fw-bold">Welcome to Your Portal</h1>
    <p class="lead opacity-75">Manage your stays and experiences effortlessly.</p>
  </div>
</div>

<div class="container pb-5" style="max-width: 800px;">
  <div class="row g-4">

    <div class="col-md-6">
      <a href="makeReservation.jsp" class="card feature-card shadow-sm h-100 p-4 text-center bg-white">
        <div class="mb-3 text-primary"><i class="bi bi-calendar2-check-fill" style="font-size: 3rem;"></i></div>
        <h4 class="fw-bold">Book a Stay</h4>
        <p class="text-muted">Reserve a luxury room for your next vacation or business trip.</p>
      </a>
    </div>

    <div class="col-md-6">
      <a href="submitReview.jsp" class="card feature-card shadow-sm h-100 p-4 text-center bg-white">
        <div class="mb-3 text-warning"><i class="bi bi-star-fill" style="font-size: 3rem;"></i></div>
        <h4 class="fw-bold">Leave a Review</h4>
        <p class="text-muted">Share your experience with us so we can serve you better.</p>
      </a>
    </div>

  </div>
</div>
</body>
</html>