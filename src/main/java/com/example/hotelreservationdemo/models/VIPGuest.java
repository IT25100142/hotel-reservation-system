package com.example.hotelreservationdemo.models;

// INHERITANCE: VIPGuest inherits from User
public class VIPGuest extends User {

    private int loyaltyPoints;

    public VIPGuest(String id, String name, String email, String phone, int loyaltyPoints) {
        super(id, name, email, phone);
        this.loyaltyPoints = loyaltyPoints;
    }

    // POLYMORPHISM: Different implementation from regular Guest
    @Override
    public String getRoleDetails() {
        return "VIP Guest - Access to VIP Lounge and late checkout. Points: " + loyaltyPoints;
    }

    @Override
    public String toFileString() {
        // Format: ID,Name,Email,Phone,Type,ExtraData
        return getId() + "," + getName() + "," + getEmail() + "," + getPhone() + ",VIP," + loyaltyPoints;
    }
}