package com.tradex.model;

import java.sql.Timestamp;

public class User {

    private int userId;

    private String fullName;

    private String username;

    private String email;

    private String password;

    private String phone;

    private String profilePhoto;

    private Timestamp registrationDate;

    private String status;

    private Timestamp lastLogin;

    // Default Constructor
    public User() {

    }

    // Parameterized Constructor
    public User(int userId, String fullName, String username,
                String email, String password,
                String phone, String profilePhoto,
                Timestamp registrationDate,
                String status,
                Timestamp lastLogin) {

        this.userId = userId;
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.profilePhoto = profilePhoto;
        this.registrationDate = registrationDate;
        this.status = status;
        this.lastLogin = lastLogin;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }

    public Timestamp getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Timestamp registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }
}