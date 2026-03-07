/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.RoomBookingDAO;
import com.oceanviewresort.model.RoomBooking;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/staff/bookings")
public class StaffBookingServlet extends HttpServlet {

    private RoomBookingDAO bookingDao;

    @Override
    public void init() {
        bookingDao = new RoomBookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<RoomBooking> bookings = bookingDao.getAllBookings();

            request.setAttribute("bookings", bookings);

            request.getRequestDispatcher("/staff/bookings.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../error.jsp");
        }
    }
}
