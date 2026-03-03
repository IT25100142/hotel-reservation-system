package com.example.hotelreservationdemo.models;

// INHERITANCE: DeluxeRoom inherits from Room
public class DeluxeRoom extends Room {

    private boolean hasBalcony;

    public DeluxeRoom(String roomId, double baseRate, boolean isAvailable, boolean hasBalcony) {
        super(roomId, "Deluxe", baseRate, isAvailable);
        this.hasBalcony = hasBalcony;
    }

    // POLYMORPHISM: Custom implementation for Deluxe rooms
    @Override
    public String getRoomFeatures() {
        return "Premium Amenities. Includes Balcony: " + (hasBalcony ? "Yes" : "No");
    }

    @Override
    public String toFileString() {
        return super.toFileString() + "," + hasBalcony;
    }
}