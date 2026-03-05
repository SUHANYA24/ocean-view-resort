/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

import java.util.Date;

/**
 *
 * @author hansa
 */
public class WalkInBooking extends RoomBooking {
    private User guestDetails;
    private User createBy;

    public WalkInBooking() {
    }

    public WalkInBooking(User guestDetails, User createBy, int roomBookingId, String guestName, String guestContactNumber, Room room, Date checkIn, Date checkOut, Date createAt) {
        super(roomBookingId, guestName, guestContactNumber, room, checkIn, checkOut, createAt);
        this.guestDetails = guestDetails;
        this.createBy = createBy;
    }
    

    public User getGuestDetails() {
        return guestDetails;
    }

    public void setGuestDetails(User guestDetails) {
        this.guestDetails = guestDetails;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }
    
    
}
