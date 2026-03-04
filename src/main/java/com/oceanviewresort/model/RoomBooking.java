/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

import java.util.Date;

public class RoomBooking {
    private int roomBookingId;
    private Room room;
    private Date checkIn;
    private Date checkOut;
    private Date createAt;

    public RoomBooking() {}

    public RoomBooking(int roomBookingId, Room room, Date checkIn, Date checkOut, Date createAt) {
        this.roomBookingId = roomBookingId;
        this.room = room;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.createAt = createAt;
    }

    public RoomBooking(Room room, Date checkIn, Date checkOut, Date createAt) {
        this.room = room;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.createAt = createAt;
    }
    
    public double calculateRoomPrice(){
        return 2 *room.getRoomType().getPricePerNight();
    }
}
