package com.oceanviewresort.dao;

import com.oceanviewresort.connection.DbConnection;
import com.oceanviewresort.model.*;
import com.oceanviewresort.util.PasswordUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection connection;

    public UserDAO() {
        try {
            connection = DbConnection.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // REGISTER
    public boolean registerUser(User user) {

        if (user == null || user.getEmail() == null
                || user.getPassword() == null || user.getRole() == null) {
            return false;
        }

        String sql = "INSERT INTO users(email,password,role,first_name,last_name,contact_number,address,emp_id,admin_role) "
                + "VALUES (?,?,?,?,?,?,?,?,?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, PasswordUtil.hashPassword(user.getPassword()));
            ps.setString(3, user.getRole());

            if (user instanceof Guest) {
                Guest g = (Guest) user;
                ps.setString(4, g.getFirstName());
                ps.setString(5, g.getLastName());
                ps.setString(6, g.getContactNumber());
                ps.setString(7, g.getAddress());
                ps.setNull(8, Types.VARCHAR);
                ps.setNull(9, Types.VARCHAR);

            } else if (user instanceof Admin) {
                Admin a = (Admin) user;
                ps.setNull(4, Types.VARCHAR);
                ps.setNull(5, Types.VARCHAR);
                ps.setNull(6, Types.VARCHAR);
                ps.setNull(7, Types.VARCHAR);
                ps.setString(8, a.getEmpId());
                ps.setString(9, a.getAdminRole());

            } else if (user instanceof Staff) {
                Staff s = (Staff) user;
                ps.setNull(4, Types.VARCHAR);
                ps.setNull(5, Types.VARCHAR);
                ps.setNull(6, Types.VARCHAR);
                ps.setNull(7, Types.VARCHAR);
                ps.setString(8, s.getEmpId());
                ps.setNull(9, Types.VARCHAR);
            }

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // ===============================
    // LOGIN (ROLE-BASED OBJECT)
    // ===============================
    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String storedPassword = rs.getString("password");

                if (storedPassword.equals(
                        PasswordUtil.hashPassword(password))) {

                    String role = rs.getString("role");

                    if ("ADMIN".equals(role)) {
                        return new Admin(
                                rs.getInt("user_id"),
                                rs.getString("email"),
                                null,
                                role,
                                rs.getString("emp_id"),
                                rs.getString("admin_role")
                        );

                    } else if ("STAFF".equals(role)) {
                        return new Staff(
                                rs.getInt("user_id"),
                                rs.getString("email"),
                                null,
                                role,
                                rs.getString("emp_id")
                        );

                    } else if ("GUEST".equals(role)) {
                        return new Guest(
                                rs.getInt("user_id"),
                                rs.getString("email"),
                                null,
                                role,
                                rs.getString("first_name"),
                                rs.getString("last_name"),
                                rs.getString("contact_number"),
                                rs.getString("address")
                        );
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

// UPDATE USER (ROLE BASED)
    public boolean updateUser(User user) {

        if (user == null || user.getId() <= 0) {
            System.out.println("Invalid user data.");
            return false;
        }

        String sql = "UPDATE users SET email=?, password=?, role=?, "
                + "first_name=?, last_name=?, contact_number=?, address=?, "
                + "emp_id=?, admin_role=? WHERE user_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, PasswordUtil.hashPassword(user.getPassword()));
            ps.setString(3, user.getRole());

            if (user instanceof Guest) {
                Guest g = (Guest) user;

                ps.setString(4, g.getFirstName());
                ps.setString(5, g.getLastName());
                ps.setString(6, g.getContactNumber());
                ps.setString(7, g.getAddress());
                ps.setNull(8, Types.VARCHAR);
                ps.setNull(9, Types.VARCHAR);

            } else if (user instanceof Admin) {
                Admin a = (Admin) user;

                ps.setNull(4, Types.VARCHAR);
                ps.setNull(5, Types.VARCHAR);
                ps.setNull(6, Types.VARCHAR);
                ps.setNull(7, Types.VARCHAR);
                ps.setString(8, a.getEmpId());
                ps.setString(9, a.getAdminRole());

            } else if (user instanceof Staff) {
                Staff s = (Staff) user;

                ps.setNull(4, Types.VARCHAR);
                ps.setNull(5, Types.VARCHAR);
                ps.setNull(6, Types.VARCHAR);
                ps.setNull(7, Types.VARCHAR);
                ps.setString(8, s.getEmpId());
                ps.setNull(9, Types.VARCHAR);
            }

            ps.setInt(10, user.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

// DELETE USER
    public boolean deleteUser(int userId) {

        if (userId <= 0) {
            System.out.println("Invalid User ID");
            return false;
        }

        String sql = "DELETE FROM users WHERE user_id=?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<User> getAllUsers() {

    List<User> list = new ArrayList<>();
    String sql = "SELECT * FROM users ORDER BY role";

    try (PreparedStatement ps = connection.prepareStatement(sql)) {

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            String role = rs.getString("role");
            User u = null;

            if ("ADMIN".equals(role)) {

                u = new Admin(
                        rs.getInt("user_id"),
                        rs.getString("email"),
                        null,
                        role,
                        rs.getString("emp_id"),
                        rs.getString("admin_role")
                );

            } else if ("STAFF".equals(role)) {

                u = new Staff(
                        rs.getInt("user_id"),
                        rs.getString("email"),
                        null,
                        role,
                        rs.getString("emp_id")
                );

            } else if ("GUEST".equals(role)) {

                u = new Guest(
                        rs.getInt("user_id"),
                        rs.getString("email"),
                        null,
                        role,
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("contact_number"),
                        rs.getString("address")
                );
            }

            if (u != null) {
                list.add(u);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    public int countByRole(String role) {

        int count = 0;
        String sql = "SELECT COUNT(*) FROM users WHERE role=?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            
            ps.setString(1, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
}
