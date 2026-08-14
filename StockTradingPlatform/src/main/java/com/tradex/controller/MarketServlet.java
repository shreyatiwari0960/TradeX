package com.tradex.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MarketServlet")
public class MarketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests for the TradeX Market page.
     */
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Forward the request to the Market JSP page
        request.getRequestDispatcher("/market.jsp")
               .forward(request, response);
    }

    /**
     * Handles POST requests.
     * Currently redirects POST requests to the Market page.
     */
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath() + "/MarketServlet"
        );
    }
}