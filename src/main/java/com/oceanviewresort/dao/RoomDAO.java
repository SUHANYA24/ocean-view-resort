/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    private DbConnection connection;
    
    public RoomDAO(){
        try {
            connection = DbConnection.getInstance();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
    
//    Get Room
    public Room getRoom(){
        return  new Room();
    }
    
//    Get Rooms
    public List<Room> getRooms(){
        List<Room> rooms = new ArrayList<>();
        return rooms;
    }
    
//    Create room
    public Room createRoom(){
        return new Room();
    }
    
//  Update Room
    public Room updateRoom(Room room){
        return room;
    }
    
//  Delete Room
    public void delelteRoom(Room room){
    
    }
}
