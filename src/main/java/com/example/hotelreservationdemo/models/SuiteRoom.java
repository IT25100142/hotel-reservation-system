package com.example.hotelreservationdemo.models;

// INHERITANCE: SuiteRoom inherits from Room
public class SuiteRoom extends Room {

    private boolean hasKitchen;

    public SuiteRoom(String roomId, double baseRate, boolean isAvailable, boolean hasKitchen) {
        super(roomId, "Suite", baseRate, isAvailable);
        this.hasKitchen = hasKitchen;
    }

    // POLYMORPHISM: Custom implementation
    @Override
    public String getRoomFeatures() {
        return "Luxury Amenities. Includes Kitchen: " + (hasKitchen ? "Yes" : "No");
    }

    @Override
    public String toFileString() {
        return super.toFileString() + "," + hasKitchen;
    }
}