/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.Room;
import com.oceanviewresort.model.RoomType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    private Connection connection;

    public RoomDAO() {
        try {
            connection = DbConnection.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // =========================
    // INSERT
    // =========================
    public boolean addRoom(Room room) {

        String sql = "INSERT INTO rooms (room_number, room_type_id) VALUES (?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, room.getRoomNumber());
            ps.setInt(2, room.getRoomType().getRoomTypeId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // GET ALL (JOIN)
    // =========================
    public List<Room> getAllRooms() {

        List<Room> list = new ArrayList<>();

        String sql = "SELECT r.*, rt.room_type, rt.price_per_night, rt.image_url "
                + "FROM rooms r "
                + "JOIN room_types rt ON r.room_type_id = rt.room_type_id";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                RoomType type = new RoomType(
                        rs.getInt("room_type_id"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("image_url")
                );

                Room room = new Room(
                        rs.getInt("room_id"),
                        rs.getString("room_number"),
                        type
                );

                list.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // GET BY ID
    // =========================
    public Room getRoomById(int id) {

        String sql = "SELECT r.*, rt.room_type, rt.price_per_night, rt.image_url "
                + "FROM rooms r "
                + "JOIN room_types rt ON r.room_type_id = rt.room_type_id "
                + "WHERE r.room_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                RoomType type = new RoomType(
                        rs.getInt("room_type_id"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("image_url")
                );

                return new Room(
                        rs.getInt("room_id"),
                        rs.getString("room_number"),
                        type
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // UPDATE
    // =========================
    public boolean updateRoom(Room room) {

        String sql = "UPDATE rooms SET room_number=?, room_type_id=? WHERE room_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, room.getRoomNumber());
            ps.setInt(2, room.getRoomType().getRoomTypeId());
            ps.setInt(3, room.getRoomId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // DELETE
    // =========================
    public boolean deleteRoom(int id) {

        String sql = "DELETE FROM rooms WHERE room_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}