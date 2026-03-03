package com.example.hotelreservationdemo.models;

// INHERITANCE: Guest inherits from User
public class Guest extends User {

    public Guest(String id, String name, String email, String phone) {
        super(id, name, email, phone);
    }

    // POLYMORPHISM: Overriding parent methods
    @Override
    public String getRoleDetails() {
        return "Regular Guest - Standard access to hotel amenities.";
    }

    @Override
    public String toFileString() {
        // Format: ID,Name,Email,Phone,Type,ExtraData
        return getId() + "," + getName() + "," + getEmail() + "," + getPhone() + ",Regular,None";
    }
}