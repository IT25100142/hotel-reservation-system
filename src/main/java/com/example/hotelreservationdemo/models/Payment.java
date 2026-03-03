package com.example.hotelreservationdemo.models;

// ABSTRACTION: Abstract parent class
public abstract class Payment {
    // ENCAPSULATION: Private variables
    private String paymentId;
    private String guestName;
    private double amount;
    private String status; // "Pending" or "Paid"

    public Payment(String paymentId, String guestName, double amount, String status) {
        this.paymentId = paymentId;
        this.guestName = guestName;
        this.amount = amount;
        this.status = status;
    }

    // POLYMORPHISM: Abstract methods to be overridden by children
    public abstract String getPaymentMethodDetails();
    public abstract String toFileString();

    // Getters and Setters
    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}