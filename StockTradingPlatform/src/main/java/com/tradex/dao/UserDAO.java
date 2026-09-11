package com.tradex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tradex.model.User;
import com.tradex.utility.DBConnection;

public class UserDAO {

    private Connection con;

    public UserDAO() {
        con = DBConnection.getConnection();
    }

    // =========================================================
    // REGISTER NEW USER
    // =========================================================
    public boolean registerUser(User user) {

        boolean status = false;

        try {

            String sql = "INSERT INTO users(full_name, username, email, password, phone, balance) "
                       + "VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getPhone());

            // Initial virtual trading balance
            ps.setDouble(6, 240000.00);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            ps.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;
    }


    // =========================================================
    // LOGIN
    // =========================================================
    public User loginUser(String email, String password) {

        User user = null;

        try {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setProfilePhoto(rs.getString("profile_photo"));
                user.setStatus(rs.getString("status"));

                // Load virtual wallet balance
                user.setBalance(rs.getDouble("balance"));
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return user;
    }


    // =========================================================
    // CHECK EMAIL EXISTS
    // =========================================================
    public boolean emailExists(String email) {

        try {

            String sql = "SELECT * FROM users WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                rs.close();
                ps.close();

                return true;
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;
    }


    // =========================================================
    // CHECK USERNAME EXISTS
    // =========================================================
    public boolean usernameExists(String username) {

        try {

            String sql = "SELECT * FROM users WHERE username=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                rs.close();
                ps.close();

                return true;
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;
    }

}