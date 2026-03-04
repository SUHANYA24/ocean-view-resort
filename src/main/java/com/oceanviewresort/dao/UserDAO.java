/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.User;
import java.sql.SQLException;

public class UserDAO {
    private DbConnection connection;
    public UserDAO(){
        try {
            connection = DbConnection.getInstance();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public User registerUser(){
        User user = new User();
        return user;
    }
    
//    public List<User> getAllUsers(){
//        return new List<User>;
//    }
    
    public boolean loginUser(){
        return false;
    }
    
    public User updateUserDetails(){
        User user = new User();
        return user;
    }
    
    public void deleteUser(){
        
    }
}
