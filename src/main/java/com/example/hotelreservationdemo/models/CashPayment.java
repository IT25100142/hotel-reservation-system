package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Payment
public class CashPayment extends Payment {

    private String currencyType;

    public CashPayment(String paymentId, String guestName, double amount, String status, String currencyType) {
        super(paymentId, guestName, amount, status);
        this.currencyType = currencyType;
    }

    // POLYMORPHISM: Custom implementation for Cash Payments
    @Override
    public String getPaymentMethodDetails() {
        return "Physical Cash accepted at Front Desk in " + currencyType + ".";
    }

    @Override
    public String toFileString() {
        // Format: ID,GuestName,Amount,Status,Type,ExtraData
        return getPaymentId() + "," + getGuestName() + "," + getAmount() + "," +
                getStatus() + ",Cash," + currencyType;
    }
}