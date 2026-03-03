<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Payment Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body style="background-color: #f9fbfc;">
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
            <div class="card shadow-lg border-0 rounded-4 p-4">

                <div class="text-center mb-4">
                    <i class="bi bi-wallet2 text-success" style="font-size: 3rem;"></i>
                    <h3 class="fw-bold mt-2">Process Payment</h3>
                    <p class="text-muted small">Update an invoice status to confirm payment receipt.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-success border-0 shadow-sm"><i class="bi bi-check-circle me-2"></i>Invoice status successfully updated!</div>
                <% } else if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger border-0 shadow-sm"><i class="bi bi-x-circle me-2"></i>Error: Invoice ID not found.</div>
                <% } %>

                <form action="UpdatePaymentServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Invoice ID</label>
                        <input type="text" name="invoiceId" class="form-control form-control-lg bg-light" placeholder="INV-12345" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">New Status</label>
                        <select name="newStatus" class="form-select form-select-lg border-success">
                            <option value="Paid">Mark as Paid</option>
                            <option value="Pending">Revert to Pending</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success btn-lg w-100 fw-bold shadow">
                        <i class="bi bi-arrow-repeat me-2"></i>Update Status
                    </button>
                </form>

                <div class="text-center mt-4">
                    <a href="generateInvoice.jsp" class="btn btn-link text-decoration-none text-muted">Cancel</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>