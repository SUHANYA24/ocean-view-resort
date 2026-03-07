package com.oceanviewresort.servlet;
import com.oceanviewresort.dao.RoomBookingDAO;
import com.oceanviewresort.dao.RoomDAO;
import com.oceanviewresort.model.RoomBooking;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/staff/dashboard")
public class StaffDashboardServlet extends HttpServlet {

    private RoomBookingDAO bookingDao;

    @Override
    public void init() {
        bookingDao = new RoomBookingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            LocalDate today = LocalDate.now();

            int arrivals = bookingDao.countArrivals(today);
            int departures = bookingDao.countDepartures(today);

            List<RoomBooking> liveGuests = bookingDao.getActiveBookings();

            request.setAttribute("arrivals", arrivals);
            request.setAttribute("departures", departures);
            request.setAttribute("liveGuests", liveGuests);

            request.getRequestDispatcher("/staff/dashboard.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../error.jsp");
        }
    }
}