package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Review
public class VerifiedReview extends Review {

    private String guestName;

    public VerifiedReview(String reviewId, String roomId, int rating, String comments, String guestName) {
        super(reviewId, roomId, rating, comments);
        this.guestName = guestName;
    }

    // POLYMORPHISM: Custom implementation showing the verified guest's name
    @Override
    public String getReviewerIdentity() {
        return "Verified Stay by: " + guestName;
    }

    @Override
    public String toFileString() {
        // Format: ReviewID,RoomID,Rating,Comments,Type,ExtraData
        return getReviewId() + "," + getRoomId() + "," + getRating() + "," +
                getComments() + ",Verified," + guestName;
    }
}