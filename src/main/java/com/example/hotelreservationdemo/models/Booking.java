package com.example.hotelreservationdemo.models;

// ABSTRACTION: Abstract parent class
public abstract class Booking {
    // ENCAPSULATION: Private variables
    private String bookingId;
    private String guestName;
    private String roomId;
    private String checkInDate;
    private String checkOutDate;

    public Booking(String bookingId, String guestName, String roomId, String checkInDate, String checkOutDate) {
        this.bookingId = bookingId;
        this.guestName = guestName;
        this.roomId = roomId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
    }

    // POLYMORPHISM: Abstract methods to be overridden by children
    public abstract String getBookingTerms();
    public abstract String toFileString();

    // Getters and Setters
    public String getBookingId() { return bookingId; }
    public void setBookingId(String bookingId) { this.bookingId = bookingId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getRoomId() { return roomId; }
    public void setRoomId(String roomId) { this.roomId = roomId; }

    public String getCheckInDate() { return checkInDate; }
    public void setCheckInDate(String checkInDate) { this.checkInDate = checkInDate; }

    public String getCheckOutDate() { return checkOutDate; }
    public void setCheckOutDate(String checkOutDate) { this.checkOutDate = checkOutDate; }
}