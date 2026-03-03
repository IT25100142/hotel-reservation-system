package com.example.hotelreservationdemo.models;

// INHERITANCE: Inherits from Review
public class AnonymousReview extends Review {

    private String stayPurpose; // e.g., Business, Leisure

    public AnonymousReview(String reviewId, String roomId, int rating, String comments, String stayPurpose) {
        super(reviewId, roomId, rating, comments);
        this.stayPurpose = stayPurpose;
    }

    // POLYMORPHISM: Hides the guest's name for privacy
    @Override
    public String getReviewerIdentity() {
        return "Anonymous Hotel Guest (" + stayPurpose + " trip)";
    }

    @Override
    public String toFileString() {
        // Format: ReviewID,RoomID,Rating,Comments,Type,ExtraData
        return getReviewId() + "," + getRoomId() + "," + getRating() + "," +
                getComments() + ",Anonymous," + stayPurpose;
    }
}