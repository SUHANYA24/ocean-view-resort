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
import java.time.LocalDateTime;
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

            // 1️⃣ Get Parameters
            String bookingType = request.getParameter("bookingType");
            String guestName = request.getParameter("guestName");
            String contact = request.getParameter("contact");
            String roomIdStr = request.getParameter("roomId");
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");

            // 2️⃣ Basic Validation
            if (bookingType == null || guestName == null || contact == null
                    || roomIdStr == null || checkInStr == null || checkOutStr == null
                    || guestName.trim().isEmpty() || contact.trim().isEmpty()) {

                response.sendRedirect("booking.jsp?error=missing_fields");
                return;
            }

            // 3️⃣ Convert roomId safely
            int roomId;
            try {
                roomId = Integer.parseInt(roomIdStr);
            } catch (NumberFormatException e) {
                response.sendRedirect("booking.jsp?error=invalid_room");
                return;
            }

            // 4️⃣ Convert Dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkIn;
            Date checkOut;

            try {
                checkIn = sdf.parse(checkInStr);
                checkOut = sdf.parse(checkOutStr);
            } catch (Exception e) {
                response.sendRedirect("booking.jsp?error=invalid_date");
                return;
            }

            // 5️⃣ Date Validation
            if (!checkOut.after(checkIn)) {
                response.sendRedirect("booking.jsp?error=invalid_date_range");
                return;
            }

            // 6️⃣ Create Room Object
            Room room = new Room();
            room.setRoomId(roomId);

            // 7️⃣ Get Logged User
            Object loggedUser = request.getSession().getAttribute("loggedUser");

            if (loggedUser == null) {
                response.sendRedirect("login.jsp?error=login_required");
                return;
            }

            RoomBooking booking = null;

            // 8️⃣ Booking Type Logic
            if ("ONLINE".equalsIgnoreCase(bookingType)) {

                if (!(loggedUser instanceof Guest)) {
                    response.sendRedirect("booking.jsp?error=invalid_user");
                    return;
                }

                Guest guest = (Guest) loggedUser;

                booking = new OnlineBooking(
                        guest,
                        true,
                        guestName,
                        contact,
                        room,
                        checkIn,
                        checkOut,
                        LocalDateTime.now()
                );

            } else if ("WALKIN".equalsIgnoreCase(bookingType)) {

                if (!(loggedUser instanceof Staff)) {
                    response.sendRedirect("booking.jsp?error=invalid_user");
                    return;
                }

                Staff staff = (Staff) loggedUser;

                booking = new WalkInBooking(
                        staff,
                        roomId,
                        guestName,
                        contact,
                        room,
                        checkIn,
                        checkOut,
                        LocalDateTime.now()
                );
            } else {
                response.sendRedirect("booking.jsp?error=invalid_type");
                return;
            }

            // 9️⃣ Check Room Availability (Important)
//            if (!dao.isRoomAvailable(roomId, checkIn, checkOut)) {
//                response.sendRedirect("booking.jsp?error=room_not_available");
//                return;
//            }

            // 🔟 Save Booking
            boolean success = dao.addBooking(booking);

            if (success) {
                response.sendRedirect("bookingList.jsp?success=true");
            } else {
                response.sendRedirect("booking.jsp?error=save_failed");
            }

        } catch (Exception e) {

            // Log error
            e.printStackTrace();

            response.sendRedirect("booking.jsp?error=server_error");
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
