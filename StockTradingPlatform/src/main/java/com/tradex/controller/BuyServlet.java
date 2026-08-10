package com.tradex.controller;

import java.io.IOException;

import com.tradex.dao.PortfolioDAO;
import com.tradex.dao.TransactionDAO;
import com.tradex.model.Portfolio;
import com.tradex.model.Transaction;
import com.tradex.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int userId = user.getUserId();

        int stockId = Integer.parseInt(request.getParameter("stockId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        double brokerage = price * quantity * 0.002;
        double tax = price * quantity * 0.001;
        double total = (price * quantity) + brokerage + tax;

        Portfolio portfolio = new Portfolio();
        portfolio.setUserId(userId);
        portfolio.setStockId(stockId);
        portfolio.setQuantity(quantity);
        portfolio.setAverageBuyPrice(price);

        PortfolioDAO portfolioDAO = new PortfolioDAO();
        portfolioDAO.addStockToPortfolio(portfolio);

        Transaction transaction = new Transaction();
        transaction.setUserId(userId);
        transaction.setStockId(stockId);
        transaction.setTransactionType("BUY");
        transaction.setQuantity(quantity);
        transaction.setPricePerShare(price);
        transaction.setBrokerage(brokerage);
        transaction.setTax(tax);
        transaction.setTotalAmount(total);
        transaction.setTransactionStatus("SUCCESS");

        TransactionDAO transactionDAO = new TransactionDAO();
        transactionDAO.saveTransaction(transaction);

        response.sendRedirect("MarketServlet");
    }
}