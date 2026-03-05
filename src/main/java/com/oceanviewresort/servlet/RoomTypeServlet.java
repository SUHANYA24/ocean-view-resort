/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.google.gson.Gson;
import com.oceanviewresort.dao.RoomTypeDAO;
import com.oceanviewresort.model.RoomType;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/roomType")
public class RoomTypeServlet extends HttpServlet {

    private RoomTypeDAO dao;

    @Override
    public void init() {
        dao = new RoomTypeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        Gson gson = new Gson();

        // GET single room type
        if (id != null) {

            RoomType roomType = dao.getRoomTypeById(Integer.parseInt(id));
            out.print(gson.toJson(roomType));

        } // GET all room types
        else {

            List<RoomType> roomTypes = dao.getAllRoomTypes();
            out.print(gson.toJson(roomTypes));

        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addRoomType(request, response);
        } else if ("update".equals(action)) {
            updateRoomType(request, response);
        } else if ("delete".equals(action)) {
            deleteRoomType(request, response);
        }
    }

    // ADD
    private void addRoomType(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        RoomType roomType = new RoomType(
                0,
                request.getParameter("roomType"),
                Double.parseDouble(request.getParameter("price")),
                request.getParameter("imageUrl")
        );

        dao.addRoomType(roomType);
        response.sendRedirect("roomTypeList.jsp");
    }

    // UPDATE
    private void updateRoomType(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        RoomType roomType = new RoomType(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("roomType"),
                Double.parseDouble(request.getParameter("price")),
                request.getParameter("imageUrl")
        );

        dao.updateRoomType(roomType);
        response.sendRedirect("roomTypeList.jsp");
    }

    // DELETE
    private void deleteRoomType(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteRoomType(id);
        response.sendRedirect("roomTypeList.jsp");
    }
}
