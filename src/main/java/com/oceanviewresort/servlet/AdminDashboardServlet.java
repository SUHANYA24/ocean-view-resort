/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.RoomBookingDAO;
import com.oceanviewresort.model.RoomBooking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet{
    private RoomBookingDAO dao;

    @Override
    public void init() {
        dao = new RoomBookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.err.println("Hello wolrd");
        List<RoomBooking> bookings = dao.getAllBookings(); // DAO method

        request.setAttribute("availablebookings", bookings);
        System.out.println(bookings.size());        System.out.println("Hellloooo");

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
