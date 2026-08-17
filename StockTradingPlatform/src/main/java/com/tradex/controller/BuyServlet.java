package com.tradex.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User must be logged in
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("index.jsp");
            return;
        }

        // Mark Buy page as active
        request.setAttribute("activePage", "buy");

        // Open Buy page
        request.getRequestDispatcher("buy.jsp")
               .forward(request, response);
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User must be logged in
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("index.jsp");
            return;
        }

        String symbol = request.getParameter("symbol");
        String quantityString = request.getParameter("quantity");
        String orderType = request.getParameter("orderType");


        int quantity = 1;

        try {

            if (quantityString != null) {
                quantity = Integer.parseInt(quantityString);
            }

        } catch (NumberFormatException e) {

            quantity = 1;
        }


        // Prevent invalid quantity
        if (quantity < 1) {
            quantity = 1;
        }


        /*
         * For now this is a virtual trading platform.
         * The actual database transaction can be connected later.
         */

        request.setAttribute("activePage", "buy");

        request.setAttribute("message",
                "Buy order placed successfully for "
                + quantity
                + " share(s) of "
                + symbol
                + ".");

        request.setAttribute("orderType", orderType);

        request.getRequestDispatcher("buy.jsp")
               .forward(request, response);
    }
}