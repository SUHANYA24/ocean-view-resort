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
    private UserRole userRole;
    
    User(int userId,String email,String password,UserRole userRole){
        this.userId = userId;
        this.email = email;
        this.userRole=userRole;
        this.password = password;
    }
    
    User(String email,String hashedPassword,UserRole userRole){
        this.email = email;
        this.userRole=userRole;
        this.password = hashedPassword;
    }
}
