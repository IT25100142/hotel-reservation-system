package com.example.hotelreservationdemo.models;

// INHERITANCE: StandardRoom inherits all properties from Room
public class StandardRoom extends Room {

    private boolean hasSingleBed;

    public StandardRoom(String roomId, double baseRate, boolean isAvailable, boolean hasSingleBed) {
        // 'super' calls the constructor of the parent 'Room' class
        super(roomId, "Standard", baseRate, isAvailable);
        this.hasSingleBed = hasSingleBed;
    }

    // POLYMORPHISM: Customizing the abstract method from the parent class
    @Override
    public String getRoomFeatures() {
        return "Standard features. Single Bed: " + (hasSingleBed ? "Yes" : "No");
    }
}