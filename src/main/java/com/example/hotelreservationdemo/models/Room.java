package com.example.hotelreservationdemo.models;

public abstract class Room {
    // 1. ENCAPSULATION: Hiding data using 'private' modifiers
    private String roomId;
    private String roomType;
    private double baseRate;
    private boolean isAvailable;

    // Constructor
    public Room(String roomId, String roomType, double baseRate, boolean isAvailable) {
        this.roomId = roomId;
        this.roomType = roomType;
        this.baseRate = baseRate;
        this.isAvailable = isAvailable;
    }

    // 2. ABSTRACTION / POLYMORPHISM: This method MUST be customized by child classes
    public abstract String getRoomFeatures();

    // Getters and Setters for Encapsulation
    public String getRoomId() { return roomId; }
    public void setRoomId(String roomId) { this.roomId = roomId; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public double getBaseRate() { return baseRate; }
    public void setBaseRate(double baseRate) { this.baseRate = baseRate; }

    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }

    // Converts the object to a String so we can easily save it to the .txt file!
    public String toFileString() {
        return roomId + "," + roomType + "," + baseRate + "," + isAvailable;
    }
}