/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("update".equals(action)) {
            updateUser(request, response);
        } else if ("delete".equals(action)) {
            deleteUser(request, response);
        } else if ("logout".equals(action)) {
            logoutUser(request, response);
        }
    }

    // =========================
    // REGISTER
    // =========================
    private void registerUser(HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException, ServletException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || role == null) {
            request.setAttribute("error", "All fields required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        User user = null;

        if ("GUEST".equals(role)) {

            user = new Guest(
                    0,
                    email,
                    password,
                    role,
                    request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    request.getParameter("contactNumber"),
                    request.getParameter("address")
            );

        } else if ("STAFF".equals(role)) {

            user = new Staff(
                    0,
                    email,
                    password,
                    role,
                    request.getParameter("empId")
            );

        } else if ("ADMIN".equals(role)) {

            user = new Admin(
                    0,
                    email,
                    password,
                    role,
                    request.getParameter("empId"),
                    request.getParameter("adminRole")
            );
        }

        boolean success = userDAO.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Registration failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // =========================
    // LOGIN
    // =========================
    private void loginUser(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException, ServletException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user);

            if (user.isAdmin()) {
                response.sendRedirect("adminDashboard.jsp");
            } else if (user.isStaff()) {
                response.sendRedirect("staffDashboard.jsp");
            } else {
                response.sendRedirect("guestDashboard.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid Credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // =========================
    // UPDATE
    // =========================
    private void updateUser(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException, ServletException {

        int id = Integer.parseInt(request.getParameter("id"));
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = null;

        if ("GUEST".equals(role)) {

            user = new Guest(
                    id,
                    email,
                    password,
                    role,
                    request.getParameter("firstName"),
                    request.getParameter("lastName"),
                    request.getParameter("contactNumber"),
                    request.getParameter("address")
            );

        } else if ("STAFF".equals(role)) {

            user = new Staff(
                    id,
                    email,
                    password,
                    role,
                    request.getParameter("empId")
            );

        } else if ("ADMIN".equals(role)) {

            user = new Admin(
                    id,
                    email,
                    password,
                    role,
                    request.getParameter("empId"),
                    request.getParameter("adminRole")
            );
        }

        if (userDAO.updateUser(user)) {
            response.sendRedirect("userList.jsp");
        } else {
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }

    // =========================
    // DELETE
    // =========================
    private void deleteUser(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        if (userDAO.deleteUser(id)) {
            response.sendRedirect("userList.jsp");
        } else {
            response.sendRedirect("userList.jsp?error=true");
        }
    }

    // =========================
    // LOGOUT
    // =========================
    private void logoutUser(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect("login.jsp");
    }
}