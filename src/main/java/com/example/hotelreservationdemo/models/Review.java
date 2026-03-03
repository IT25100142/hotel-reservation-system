package com.example.hotelreservationdemo.models;

// ABSTRACTION: Abstract parent class
public abstract class Review {
    // ENCAPSULATION: Private variables
    private String reviewId;
    private String roomId;
    private int rating; // 1 to 5 stars
    private String comments;

    public Review(String reviewId, String roomId, int rating, String comments) {
        this.reviewId = reviewId;
        this.roomId = roomId;
        this.rating = rating;
        this.comments = comments;
    }

    // POLYMORPHISM: Abstract methods to be overridden by children
    public abstract String getReviewerIdentity();
    public abstract String toFileString();

    // Getters and Setters
    public String getReviewId() { return reviewId; }
    public void setReviewId(String reviewId) { this.reviewId = reviewId; }

    public String getRoomId() { return roomId; }
    public void setRoomId(String roomId) { this.roomId = roomId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }
}