package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Booking
public class PersonalBooking extends Booking {

    private int numberOfGuests;

    public PersonalBooking(String bookingId, String guestName, String roomId, String checkInDate, String checkOutDate, int numberOfGuests) {
        super(bookingId, guestName, roomId, checkInDate, checkOutDate);
        this.numberOfGuests = numberOfGuests;
    }

    // POLYMORPHISM: Custom implementation for Personal Bookings
    @Override
    public String getBookingTerms() {
        return "Standard Personal Booking: Cancellations allowed up to 24 hours before check-in.";
    }

    @Override
    public String toFileString() {
        // Format: ID,GuestName,RoomID,CheckIn,CheckOut,Type,ExtraData
        return getBookingId() + "," + getGuestName() + "," + getRoomId() + "," +
                getCheckInDate() + "," + getCheckOutDate() + ",Personal," + numberOfGuests;
    }
}