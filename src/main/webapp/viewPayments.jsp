<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background-color: #f1f3f5; }
        .receipt { background: #fff; border-radius: 8px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); border: 1px solid #eee; position: relative;}
        .receipt::before, .receipt::after { content: ''; position: absolute; width: 20px; height: 20px; background: #f1f3f5; border-radius: 50%; top: 50%; transform: translateY(-50%); }
        .receipt::before { left: -10px; } .receipt::after { right: -10px; }
        .dashed-line { border-top: 2px dashed #ddd; margin: 20px 0; }
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
    <div class="row justify-content-center">
        <div class="col-md-5">

            <h3 class="text-center fw-bold mb-4 text-secondary"><i class="bi bi-receipt me-2"></i>Invoice Lookup</h3>

            <form action="ViewPaymentServlet" method="GET" class="mb-4">
                <div class="input-group shadow-sm">
                    <input type="text" name="searchId" class="form-control form-control-lg border-0" placeholder="Enter Invoice ID (e.g. INV-123)" required>
                    <button type="submit" class="btn btn-dark px-4"><i class="bi bi-search"></i></button>
                </div>
            </form>

            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger shadow-sm"><i class="bi bi-x-circle-fill me-2"></i><%= request.getAttribute("error") %></div>
            <% } %>

            <%
                String paymentData = (String) request.getAttribute("paymentData");
                if (paymentData != null) {
                    String[] details = paymentData.split(",");
                    boolean isPaid = "Paid".equals(details[3]);
            %>
            <!-- Professional Receipt View -->
            <div class="receipt p-4 mt-3">
                <div class="text-center mb-4">
                    <h4 class="fw-bold mb-0">HOTEL BILLING</h4>
                    <small class="text-muted"><%= details[0] %></small>
                </div>

                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted">Guest Name:</span>
                    <span class="fw-bold"><%= details[1] %></span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted">Payment Type:</span>
                    <span><%= details[4] %> (<%= details[5] %>)</span>
                </div>

                <div class="dashed-line"></div>

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="fs-5 fw-bold">TOTAL DUE</span>
                    <span class="fs-4 fw-bold text-dark">$<%= details[2] %></span>
                </div>

                <div class="text-center mt-4">
                    <% if (isPaid) { %>
                    <span class="badge bg-success text-white p-2 px-4 fs-6 rounded-pill"><i class="bi bi-check-circle-fill me-2"></i>PAID IN FULL</span>
                    <% } else { %>
                    <span class="badge bg-warning text-dark p-2 px-4 fs-6 rounded-pill"><i class="bi bi-clock-history me-2"></i>PAYMENT PENDING</span>
                    <% } %>
                </div>
            </div>
            <% } %>

            <div class="text-center mt-4">
                <a href="generateInvoice.jsp" class="text-decoration-none text-secondary">Back to Billing Menu</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>