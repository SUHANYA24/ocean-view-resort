package com.oceanviewresort.servlet;

import com.oceanviewresort.dao.UserDAO;
import com.oceanviewresort.model.User;
import com.oceanviewresort.util.UserFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (role == null || email == null || password == null ||
            request.getParameter("firstName") == null || request.getParameter("lastName") == null) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Create Guest object
        User user = UserFactory.createUserFromRequest(
                request,
                role,
                email,
                password,
                0 // ID will be auto-generated
        );

        boolean success = userDAO.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp?msg=Account created successfully, please login.");
        } else {
            request.setAttribute("error", "Registration failed. Email might already exist.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
