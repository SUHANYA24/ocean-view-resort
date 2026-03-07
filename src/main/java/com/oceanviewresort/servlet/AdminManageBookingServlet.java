/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.RoomBookingDAO;
import com.oceanviewresort.model.Admin;
import com.oceanviewresort.model.Room;
import com.oceanviewresort.model.RoomBooking;
import com.oceanviewresort.model.WalkInBooking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/manage-bookings")
public class AdminManageBookingServlet extends HttpServlet{
    private RoomBookingDAO dao;

    @Override
    public void init() {
        dao = new RoomBookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<RoomBooking> bookings = dao.getAllBookings(); // DAO method

        request.setAttribute("availablebookings", bookings);

        request.getRequestDispatcher("/admin/manage-bookings.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String guestName = request.getParameter("guestName");
            String contact = request.getParameter("contact");
            int roomId = Integer.parseInt(request.getParameter("roomId"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Date checkIn = sdf.parse(request.getParameter("checkIn"));
            Date checkOut = sdf.parse(request.getParameter("checkOut"));

            Room room = new Room();
            room.setRoomId(roomId);
            Admin user = (Admin) request.getSession().getAttribute("loggedUser");
            WalkInBooking booking = new WalkInBooking(
                    user,
                    roomId,
                    guestName,
                    contact,
                    room,
                    checkIn,
                    checkOut,
                    LocalDateTime.now()
            );

            dao.addBooking(booking);

            response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage-bookings.jsp?error=true");
        }
    }
}
