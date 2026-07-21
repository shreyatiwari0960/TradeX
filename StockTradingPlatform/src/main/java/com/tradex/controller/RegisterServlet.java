package com.tradex.controller;

import java.io.IOException;

import com.tradex.dao.UserDAO;
import com.tradex.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");

        String username = request.getParameter("username");

        String email = request.getParameter("email");

        String phone = request.getParameter("phone");

        String password = request.getParameter("password");

        User user = new User();

        user.setFullName(fullName);

        user.setUsername(username);

        user.setEmail(email);

        user.setPhone(phone);

        user.setPassword(password);

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);

        if(status) {

            response.sendRedirect("index.jsp?success=1");

        }

        else {

            response.sendRedirect("index.jsp?error=1");

        }

    }

}