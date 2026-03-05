/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.*;
import java.sql.*;

import java.util.*;

public class RoomBookingDAO {

    private Connection connection;

    public RoomBookingDAO() {
        try {
            connection = DbConnection.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // =========================
    // CHECK AVAILABILITY
    // =========================
    public boolean isRoomAvailable(int roomId, java.util.Date checkIn, java.util.Date checkOut) {

        String sql = "SELECT COUNT(*) FROM room_bookings "
                + "WHERE room_id=? "
                + "AND check_in < ? "
                + "AND check_out > ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, roomId);
            ps.setDate(2, new java.sql.Date(checkOut.getTime()));
            ps.setDate(3, new java.sql.Date(checkIn.getTime()));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) == 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // ADD BOOKING
    // =========================
    public boolean addBooking(RoomBooking booking) {

        String sql = "INSERT INTO room_bookings "
                + "(booking_type, guest_name, guest_contact_number, room_id, "
                + "check_in, check_out, customer_id, is_make_payment, "
                + "guest_user_id, created_by) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            if (booking instanceof OnlineBooking) {

                OnlineBooking ob = (OnlineBooking) booking;

                ps.setString(1, "ONLINE");
                ps.setString(2, ob.getGuestName());
                ps.setString(3, ob.getGuestContactNumber());
                ps.setInt(4, ob.getRoom().getRoomId());
                ps.setDate(5, new java.sql.Date(ob.getCheckIn().getTime()));
                ps.setDate(6, new java.sql.Date(ob.getCheckOut().getTime()));
                ps.setInt(7, ob.getCustomer().getId());
                ps.setBoolean(8, ob.isIsMakePayment());
                ps.setNull(9, Types.INTEGER);
                ps.setNull(10, Types.INTEGER);

            } else if (booking instanceof WalkInBooking) {

                WalkInBooking wb = (WalkInBooking) booking;

                ps.setString(1, "WALKIN");
                ps.setString(2, wb.getGuestName());
                ps.setString(3, wb.getGuestContactNumber());
                ps.setInt(4, wb.getRoom().getRoomId());
                ps.setDate(5, new java.sql.Date(wb.getCheckIn().getTime()));
                ps.setDate(6, new java.sql.Date(wb.getCheckOut().getTime()));
                ps.setNull(7, Types.INTEGER);
                ps.setNull(8, Types.BOOLEAN);
                ps.setInt(9, wb.getGuestDetails().getId());
                ps.setInt(10, wb.getCreateBy().getId());
            }

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // =========================
    // GET ALL BOOKINGS (JOIN)
    // =========================
    public List<RoomBooking> getAllBookings() {

        List<RoomBooking> list = new ArrayList<>();

        String sql = "SELECT * FROM room_bookings";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                String type = rs.getString("booking_type");

                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));

                if ("ONLINE".equals(type)) {

                    User customer = new User();
                    customer.setId(rs.getInt("customer_id"));

                    OnlineBooking ob = new OnlineBooking(
                            customer,
                            rs.getBoolean("is_make_payment"),
                            rs.getString("guest_name"),
                            rs.getString("guest_contact_number"),
                            room,
                            rs.getDate("check_in"),
                            rs.getDate("check_out"),
                            rs.getTimestamp("created_at")
                    );

                    ob.setRoomBookingId(rs.getInt("room_booking_id"));
                    list.add(ob);

                } else if ("WALKIN".equals(type)) {

                    User guestUser = new User();
                    guestUser.setId(rs.getInt("guest_user_id"));

                    User createdBy = new User();
                    createdBy.setId(rs.getInt("created_by"));

                    WalkInBooking wb = new WalkInBooking(
                            guestUser,
                            createdBy,
                            rs.getInt("room_booking_id"),
                            rs.getString("guest_name"),
                            rs.getString("guest_contact_number"),
                            room,
                            rs.getDate("check_in"),
                            rs.getDate("check_out"),
                            rs.getTimestamp("created_at")
                    );

                    list.add(wb);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // DELETE BOOKING
    // =========================
    public boolean deleteBooking(int id) {

        String sql = "DELETE FROM room_bookings WHERE room_booking_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
