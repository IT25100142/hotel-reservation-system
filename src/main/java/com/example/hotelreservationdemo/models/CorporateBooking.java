package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Booking
public class CorporateBooking extends Booking {

    private String companyName;

    public CorporateBooking(String bookingId, String guestName, String roomId, String checkInDate, String checkOutDate, String companyName) {
        super(bookingId, guestName, roomId, checkInDate, checkOutDate);
        this.companyName = companyName;
    }

    // POLYMORPHISM: Custom implementation for Corporate Bookings
    @Override
    public String getBookingTerms() {
        return "Corporate Booking: Includes priority Wi-Fi and late check-out. 10% Cancellation fee applies.";
    }

    @Override
    public String toFileString() {
        // Format: ID,GuestName,RoomID,CheckIn,CheckOut,Type,ExtraData
        return getBookingId() + "," + getGuestName() + "," + getRoomId() + "," +
                getCheckInDate() + "," + getCheckOutDate() + ",Corporate," + companyName;
    }
}