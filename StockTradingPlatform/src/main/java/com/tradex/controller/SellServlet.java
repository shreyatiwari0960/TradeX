package com.tradex.controller;

import java.io.IOException;

import com.tradex.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SellServlet")
public class SellServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        request.setAttribute("activePage", "sell");

        request.getRequestDispatcher("sell.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String symbol = request.getParameter("symbol");
        String quantity = request.getParameter("quantity");

        request.setAttribute("activePage", "sell");

        request.setAttribute("message",
                "Sell order for " + quantity + " share(s) of "
                + symbol + " has been simulated successfully.");

        request.getRequestDispatcher("sell.jsp")
               .forward(request, response);
    }
}