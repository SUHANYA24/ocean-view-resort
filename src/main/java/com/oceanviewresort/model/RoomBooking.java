/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

import java.util.Date;

public class RoomBooking {
    private int roomBookingId;
    private String guestName;
    private String guestContactNumber;
    private Room room;
    private Date checkIn;
    private Date checkOut;
    private Date createAt;

    public RoomBooking() {
    }
    
    public RoomBooking(int roomBookingId, String guestName, String guestContactNumber, Room room, Date checkIn, Date checkOut, Date createAt) {
        this.roomBookingId = roomBookingId;
        this.guestName = guestName;
        this.guestContactNumber = guestContactNumber;
        this.room = room;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.createAt = createAt;
    }

    public RoomBooking(String guestName, String guestContactNumber, Room room, Date checkIn, Date checkOut, Date createAt) {
        this.guestName = guestName;
        this.guestContactNumber = guestContactNumber;
        this.room = room;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.createAt = createAt;
    }

    public int getRoomBookingId() {
        return roomBookingId;
    }

    public void setRoomBookingId(int roomBookingId) {
        this.roomBookingId = roomBookingId;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getGuestContactNumber() {
        return guestContactNumber;
    }

    public void setGuestContactNumber(String guestContactNumber) {
        this.guestContactNumber = guestContactNumber;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public double calculateRoomCharges() {

    long diff = checkOut.getTime() - checkIn.getTime();
    long days = diff / (1000 * 60 * 60 * 24);

    return room.getRoomType().getPricePerNight() * days;
}
}
