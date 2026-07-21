package com.tradex.utility;

import com.tradex.dao.UserDAO;
import com.tradex.model.User;

public class TestUserDAO {

    public static void main(String[] args) {

        User user = new User();

        user.setFullName("MS Dhoni");
        user.setUsername("dhoni07");
        user.setEmail("dhoni07@gmail.com");
        user.setPassword("123456");
        user.setPhone("9999999992");

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if(status) {

            System.out.println("==============================");
            System.out.println("User Registered Successfully");
            System.out.println("==============================");

        } else {

            System.out.println("==============================");
            System.out.println("Registration Failed");
            System.out.println("==============================");

        }

    }

}