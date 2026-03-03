<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Generate Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body { background: #f8f9fa; }
        .invoice-card { border-radius: 12px; border-top: 5px solid #0dcaf0; }
        .icon-circle { width: 60px; height: 60px; background: #e0f7fa; color: #00acc1; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; margin: 0 auto 15px auto; }
    </style>
    <script>
        function togglePaymentFields() {
            const type = document.getElementById("paymentType").value;
            const cardDiv = document.getElementById("cardFields");
            const cashDiv = document.getElementById("cashFields");

            if (type === "Card") {
                cardDiv.style.display = "block"; cashDiv.style.display = "none";
            } else {
                cardDiv.style.display = "none"; cashDiv.style.display = "block";
            }
        }
    </script>
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
        <div class="col-md-7">
            <div class="card invoice-card shadow-sm p-5 bg-white">
                <div class="text-center">
                    <div class="icon-circle"><i class="bi bi-receipt-cutoff"></i></div>
                    <h2 class="fw-bold text-dark">Generate Guest Invoice</h2>
                    <p class="text-muted">Create a new billing statement for a guest stay.</p>
                </div>

                <% if ("true".equals(request.getParameter("success"))) { %>
                <div class="alert alert-info border-0 shadow-sm mt-3">
                    <i class="bi bi-info-circle-fill me-2"></i>Invoice successfully generated! <br>
                    Invoice ID: <strong><%= request.getParameter("invoiceId") %></strong>
                </div>
                <% } %>

                <form action="GenerateInvoiceServlet" method="POST" class="mt-4">
                    <div class="mb-3">
                        <label class="form-label fw-bold text-secondary">Guest Name</label>
                        <input type="text" name="guestName" class="form-control" placeholder="John Doe" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-secondary">Total Amount Due ($)</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light fw-bold">$</span>
                            <input type="number" step="0.01" name="amount" class="form-control" placeholder="0.00" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold text-secondary">Intended Payment Method</label>
                        <select id="paymentType" name="paymentType" class="form-select" onchange="togglePaymentFields()" required>
                            <option value="Card">Credit/Debit Card</option>
                            <option value="Cash">Physical Cash</option>
                        </select>
                    </div>

                    <div id="cardFields" class="p-3 bg-light border rounded mb-4">
                        <label class="form-label fw-bold text-info"><i class="bi bi-credit-card-2-front me-2"></i>Card Provider</label>
                        <select name="cardProvider" class="form-select">
                            <option value="Visa">Visa</option>
                            <option value="Mastercard">Mastercard</option>
                            <option value="Amex">American Express</option>
                        </select>
                    </div>

                    <div id="cashFields" class="p-3 bg-light border rounded mb-4" style="display: none;">
                        <label class="form-label fw-bold text-success"><i class="bi bi-cash-stack me-2"></i>Currency Type</label>
                        <select name="currencyType" class="form-select">
                            <option value="USD">USD ($)</option>
                            <option value="EUR">EUR (€)</option>
                            <option value="LKR">LKR (Rs)</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-info text-white btn-lg w-100 fw-bold shadow-sm">
                        <i class="bi bi-file-earmark-plus me-2"></i>Create Invoice
                    </button>
                </form>

                <div class="text-center mt-4">
                    <a href="viewPayments.jsp" class="text-decoration-none text-secondary me-3"><i class="bi bi-search me-1"></i>Find Invoice</a>
                    <a href="updatePayment.jsp" class="text-decoration-none text-success"><i class="bi bi-check2-circle me-1"></i>Mark as Paid</a>
                </div>
            </div>
        </div>
        <div class="d-flex flex-wrap justify-content-center gap-2 mt-4 pt-4 border-top">
            <a href="viewPayments.jsp" class="btn btn-outline-info shadow-sm fw-bold text-dark"><i class="bi bi-search me-1"></i>Find Invoice</a>
            <a href="updatePayment.jsp" class="btn btn-outline-success shadow-sm fw-bold"><i class="bi bi-check2-circle me-1"></i>Mark as Paid</a>
            <a href="removePayment.jsp" class="btn btn-outline-danger shadow-sm fw-bold"><i class="bi bi-trash me-1"></i>Delete Invoice</a>
        </div>
    </div>
</div>
</body>
</html>