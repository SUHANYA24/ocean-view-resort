/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.RoomDAO;
import com.oceanviewresort.dao.RoomTypeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/manage-rooms")
public class AdminManageRoomsServlet extends HttpServlet {

    private RoomDAO roomDao;
    private RoomTypeDAO typeDao;

    @Override
    public void init(){
        roomDao = new RoomDAO();
        typeDao = new RoomTypeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("rooms", roomDao.getAllRooms());
        request.setAttribute("types", typeDao.getAllRoomTypes());

        request.getRequestDispatcher("/admin/manage-rooms.jsp")
               .forward(request,response);
    }
}
