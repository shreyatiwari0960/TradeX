package com.tradex.controller;

import java.io.IOException;
import java.util.List;

import com.tradex.dao.PortfolioDAO;
import com.tradex.model.PortfolioView;
import com.tradex.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PortfolioServlet")
public class PortfolioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session = request.getSession(false);

        // If there is no session, send user to login
        if (session == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // If user is not logged in
        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Load portfolio from database
        PortfolioDAO portfolioDAO = new PortfolioDAO();

        List<PortfolioView> portfolioList =
                portfolioDAO.getUserPortfolio(user.getUserId());

        // Send portfolio data to JSP
        request.setAttribute("portfolioList", portfolioList);

        // Tell sidebar which page is active
        request.setAttribute("activePage", "portfolio");

        // Open portfolio page
        request.getRequestDispatcher("portfolio.jsp")
               .forward(request, response);
    }
}