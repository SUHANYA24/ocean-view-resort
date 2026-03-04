/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.model;

/**
 *
 * @author hansa
 */

enum UserRole{
    ADMIN,STAFF,CUSTOMER
}

public class User {
    private int userId;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String contactNumber;
    private UserRole userRole;

    public User() {
    }
    
    User(int userId,String email,String password,String firstName,String lastName,String contactNumber,UserRole userRole){
        this.userId = userId;
        this.email = email;
        this.userRole=userRole;
        this.password = password;
        this.contactNumber = contactNumber;
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    User(String email,String password,String firstName,String lastName,String contactNumber,UserRole userRole){
        this.email = email;
        this.email = email;
        this.userRole=userRole;
        this.password = password;
        this.contactNumber = contactNumber;
        this.firstName = firstName;
        this.lastName = lastName;
    }
}
