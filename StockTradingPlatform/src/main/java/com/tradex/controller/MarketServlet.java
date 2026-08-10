package com.tradex.controller;

import java.io.IOException;
import java.util.List;

import com.tradex.dao.StockDAO;
import com.tradex.model.Stock;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MarketServlet")
public class MarketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StockDAO dao = new StockDAO();

        List<Stock> stocks = dao.getTrendingStocks();

        request.setAttribute("stocks", stocks);
        request.setAttribute("activePage", "dashboard");
        request.getRequestDispatcher("dashboard.jsp")
        .forward(request,response);

    }

}