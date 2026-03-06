/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author hansa
 */
public class WalkInBooking extends RoomBooking {
    private User createBy;

    public WalkInBooking() {
    }

    public WalkInBooking(User createBy, int roomBookingId, String guestName, String guestContactNumber, Room room, Date checkIn, Date checkOut, LocalDateTime createAt) {
        super(roomBookingId, guestName, guestContactNumber, room, checkIn, checkOut, createAt);
        this.createBy = createBy;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }
    
    
}
