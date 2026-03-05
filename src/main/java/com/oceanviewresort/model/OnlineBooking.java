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
public class OnlineBooking extends RoomBooking {
    private User customer;
    private boolean isMakePayment;

    public OnlineBooking(User customer, boolean isMakePayment, String guestName, String guestContactNumber, Room room, Date checkIn, Date checkOut, Date createAt) {
        super(guestName, guestContactNumber, room, checkIn, checkOut, createAt);
        this.customer = customer;
        this.isMakePayment = isMakePayment;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public boolean isIsMakePayment() {
        return isMakePayment;
    }

    public void setIsMakePayment(boolean isMakePayment) {
        this.isMakePayment = isMakePayment;
    }
    
}
