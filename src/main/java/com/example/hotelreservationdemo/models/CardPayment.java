package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Payment
public class CardPayment extends Payment {

    private String cardProvider; // e.g., Visa, Mastercard

    public CardPayment(String paymentId, String guestName, double amount, String status, String cardProvider) {
        super(paymentId, guestName, amount, status);
        this.cardProvider = cardProvider;
    }

    // POLYMORPHISM: Custom implementation for Card Payments
    @Override
    public String getPaymentMethodDetails() {
        return "Credit/Debit Card via " + cardProvider + " Gateway.";
    }

    @Override
    public String toFileString() {
        // Format: ID,GuestName,Amount,Status,Type,ExtraData
        return getPaymentId() + "," + getGuestName() + "," + getAmount() + "," +
                getStatus() + ",Card," + cardProvider;
    }
}