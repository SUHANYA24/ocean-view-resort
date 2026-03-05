/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.google.gson.Gson;
import com.oceanviewresort.dao.RoomDAO;
import com.oceanviewresort.model.Room;
import com.oceanviewresort.model.RoomType;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/room")
public class RoomServlet extends HttpServlet {

    private RoomDAO dao;

    @Override
    public void init() {
        dao = new RoomDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomNumber = request.getParameter("rnum");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
         if (roomNumber != null) {

            Room room = dao.getRoomByNumber(roomNumber);
            if (room == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\":\"Room type not found\"}");
            } else {
                out.print(gson.toJson(room));
            }

        } // GET all room types
        else {

            List<Room> rooms = dao.getAllRooms();
            out.print(gson.toJson(rooms));

        }
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
