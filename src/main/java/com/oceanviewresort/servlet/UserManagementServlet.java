/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.User;
import com.oceanviewresort.util.UserFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/user/manage")
public class UserManagementServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateUser(request, response);
        } else if ("delete".equals(action)) {
            deleteUser(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserFactory.createUserFromRequest(request, role, email, password, id);

        if (userDAO.updateUser(user)) {
            response.sendRedirect("userList.jsp");
        } else {
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        if (userDAO.deleteUser(id)) {
            response.sendRedirect("userList.jsp");
        } else {
            response.sendRedirect("userList.jsp?error=true");
        }
    }
}
