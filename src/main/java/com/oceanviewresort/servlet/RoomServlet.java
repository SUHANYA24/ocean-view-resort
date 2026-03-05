/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.RoomDAO;
import com.oceanviewresort.model.Room;
import com.oceanviewresort.model.RoomType;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/room")
public class RoomServlet extends HttpServlet {

    private RoomDAO dao;

    @Override
    public void init() {
        dao = new RoomDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addRoom(request, response);
        } else if ("update".equals(action)) {
            updateRoom(request, response);
        } else if ("delete".equals(action)) {
            deleteRoom(request, response);
        }
    }

    private void addRoom(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        RoomType type = new RoomType();
        type.setRoomTypeId(Integer.parseInt(request.getParameter("roomTypeId")));

        Room room = new Room(
                0,
                request.getParameter("roomNumber"),
                type
        );

        dao.addRoom(room);
        response.sendRedirect("roomList.jsp");
    }

    private void updateRoom(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        RoomType type = new RoomType();
        type.setRoomTypeId(Integer.parseInt(request.getParameter("roomTypeId")));

        Room room = new Room(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("roomNumber"),
                type
        );

        dao.updateRoom(room);
        response.sendRedirect("roomList.jsp");
    }

    private void deleteRoom(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteRoom(id);
        response.sendRedirect("roomList.jsp");
    }
}
