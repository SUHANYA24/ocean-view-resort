package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.RoomType;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomTypeDAO {

    Connection connection;

    public RoomTypeDAO() {
        try {
            connection = DbConnection.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // =========================
    // INSERT
    // =========================
    public boolean addRoomType(RoomType roomType) {

        String sql = "INSERT INTO room_types (room_type, price_per_night, image_url) VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, roomType.getRoomType());
            ps.setDouble(2, roomType.getPricePerNight());
            ps.setString(3, roomType.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // GET BY ID
    // =========================
    public RoomType getRoomTypeById(String name) {

        String sql = "SELECT * FROM room_types WHERE room_type=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new RoomType(
                        rs.getInt("room_type_id"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("image_url")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // =========================
    // GET ALL
    // =========================
    public List<RoomType> getAllRoomTypes() {

        List<RoomType> list = new ArrayList<>();
        String sql = "SELECT * FROM room_types";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new RoomType(
                        rs.getInt("room_type_id"),
                        rs.getString("room_type"),
                        rs.getDouble("price_per_night"),
                        rs.getString("image_url")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // UPDATE
    // =========================
    public boolean updateRoomType(RoomType roomType) {

        String sql = "UPDATE room_types SET room_type=?, price_per_night=?, image_url=? WHERE room_type_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, roomType.getRoomType());
            ps.setDouble(2, roomType.getPricePerNight());
            ps.setString(3, roomType.getImageUrl());
            ps.setInt(4, roomType.getRoomTypeId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // DELETE
    // =========================
    public boolean deleteRoomType(int id) {

        String sql = "DELETE FROM room_types WHERE room_type_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}