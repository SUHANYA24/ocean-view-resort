package com.oceanviewresort.util;
import com.oceanviewresort.model.*;
import jakarta.servlet.http.HttpServletRequest;

public class UserFactory {

    public static User createUserFromRequest(HttpServletRequest req, String role, String email, String password, int id) {
        if ("GUEST".equals(role)) {
            return new Guest(
                    id,
                    email,
                    password,
                    role,
                    req.getParameter("firstName"),
                    req.getParameter("lastName"),
                    req.getParameter("contactNumber"),
                    req.getParameter("address")
            );
        } else if ("STAFF".equals(role)) {
            return new Staff(
                    id,
                    email,
                    password,
                    role,
                    req.getParameter("empId")
            );
        } else if ("ADMIN".equals(role)) {
            return new Admin(
                    id,
                    email,
                    password,
                    role,
                    req.getParameter("empId"),
                    req.getParameter("adminRole")
            );
        }
        return null;
    }
}
