/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.google.gson.Gson;
import com.oceanviewresort.dao.RoomBookingDAO;
import com.oceanviewresort.model.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/booking")
public class RoomBookingServlet extends HttpServlet {

    private RoomBookingDAO dao;

    @Override
    public void init() {
        dao = new RoomBookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomTypeIdStr = request.getParameter("roomTypeId");
        String checkInStr = request.getParameter("checkIn");
        String checkOutStr = request.getParameter("checkOut");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();

        try {
            int roomTypeId = Integer.parseInt(roomTypeIdStr);
            // Convert to java.sql.Date first
java.sql.Date sqlCheckIn = java.sql.Date.valueOf(checkInStr);
java.sql.Date sqlCheckOut = java.sql.Date.valueOf(checkOutStr);

// Convert to java.util.Date
java.util.Date checkIn = new java.util.Date(sqlCheckIn.getTime());
java.util.Date checkOut = new java.util.Date(sqlCheckOut.getTime());

            List<Room> availableRooms = dao.getAvailableRooms(roomTypeId, checkIn, checkOut);
            out.print(gson.toJson(availableRooms));

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"error\":\"Invalid parameters or server error\"}");
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addBooking(request, response);
        } else if ("delete".equals(action)) {
            deleteBooking(request, response);
        }
    }

    private void addBooking(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        try {

            String guestName = request.getParameter("guestName");
            String contact = request.getParameter("contact");
            int roomId = Integer.parseInt(request.getParameter("roomId"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkIn = sdf.parse(request.getParameter("checkIn"));
            Date checkOut = sdf.parse(request.getParameter("checkOut"));

            Room room = new Room();
            room.setRoomId(roomId);

            RoomBooking booking =
                    new RoomBooking(guestName, contact, room, checkIn, checkOut, new Date());

            if (dao.addBooking(booking)) {
                response.sendRedirect("bookingList.jsp");
            } else {
                response.sendRedirect("booking.jsp?error=notavailable");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=true");
        }
    }

    private void deleteBooking(HttpServletRequest request,
                               HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteBooking(id);
        response.sendRedirect("bookingList.jsp");
    }
    
    
}