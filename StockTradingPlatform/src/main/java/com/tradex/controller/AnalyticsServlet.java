package com.tradex.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tradex.dao.TransactionDAO;
import com.tradex.model.Transaction;
import com.tradex.model.User;

@WebServlet("/AnalyticsServlet")
public class AnalyticsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // =========================================
        // CHECK LOGIN
        // =========================================

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("index.jsp");
            return;
        }


        // =========================================
        // GET LOGGED-IN USER
        // =========================================

        User user = (User) session.getAttribute("user");

        int userId = user.getUserId();


        // =========================================
        // GET TRANSACTIONS
        // =========================================

        TransactionDAO dao = new TransactionDAO();

        List<Transaction> transactions =
                dao.getTransactionsByUser(userId);


        // =========================================
        // ANALYTICS VARIABLES
        // =========================================

        int totalTransactions = transactions.size();

        int buyOrders = 0;

        int sellOrders = 0;

        int successfulTransactions = 0;

        double totalTradeValue = 0.0;

        double buyValue = 0.0;

        double sellValue = 0.0;


        // =========================================
        // STOCK TRADE COUNTER
        // =========================================

        Map<Integer, Integer> stockTradeCount =
                new HashMap<>();


        // =========================================
        // CALCULATE ANALYTICS
        // =========================================

        for (Transaction transaction : transactions) {

            double amount =
                    transaction.getTotalAmount();

            totalTradeValue += amount;


            String type =
                    transaction.getTransactionType();


            if (type != null &&
                type.equalsIgnoreCase("BUY")) {

                buyOrders++;

                buyValue += amount;

            }


            if (type != null &&
                type.equalsIgnoreCase("SELL")) {

                sellOrders++;

                sellValue += amount;

            }


            String status =
                    transaction.getTransactionStatus();


            if (status != null &&
                (status.equalsIgnoreCase("SUCCESS") ||
                 status.equalsIgnoreCase("COMPLETED"))) {

                successfulTransactions++;

            }


            // Count stock activity

            int stockId =
                    transaction.getStockId();

            int count =
                    stockTradeCount.getOrDefault(
                            stockId,
                            0
                    );

            stockTradeCount.put(
                    stockId,
                    count + 1
            );
        }


        // =========================================
        // AVERAGE TRADE VALUE
        // =========================================

        double averageTradeValue = 0.0;

        if (totalTransactions > 0) {

            averageTradeValue =
                    totalTradeValue /
                    totalTransactions;
        }


        // =========================================
        // NET TRADING FLOW
        // =========================================

        double netTradingFlow =
                sellValue - buyValue;


        // =========================================
        // BUY / SELL PERCENTAGE
        // =========================================

        double buyPercentage = 0.0;

        double sellPercentage = 0.0;

        if (totalTransactions > 0) {

            buyPercentage =
                    (buyOrders * 100.0) /
                    totalTransactions;

            sellPercentage =
                    (sellOrders * 100.0) /
                    totalTransactions;
        }


        // =========================================
        // MOST TRADED STOCK
        // =========================================

        int mostTradedStockId = 0;

        int highestTradeCount = 0;

        for (Map.Entry<Integer, Integer> entry
                : stockTradeCount.entrySet()) {

            if (entry.getValue() > highestTradeCount) {

                highestTradeCount =
                        entry.getValue();

                mostTradedStockId =
                        entry.getKey();
            }
        }


        // =========================================
        // SEND DATA TO JSP
        // =========================================

        request.setAttribute(
                "transactions",
                transactions
        );

        request.setAttribute(
                "totalTransactions",
                totalTransactions
        );

        request.setAttribute(
                "buyOrders",
                buyOrders
        );

        request.setAttribute(
                "sellOrders",
                sellOrders
        );

        request.setAttribute(
                "successfulTransactions",
                successfulTransactions
        );

        request.setAttribute(
                "totalTradeValue",
                totalTradeValue
        );

        request.setAttribute(
                "buyValue",
                buyValue
        );

        request.setAttribute(
                "sellValue",
                sellValue
        );

        request.setAttribute(
                "averageTradeValue",
                averageTradeValue
        );

        request.setAttribute(
                "netTradingFlow",
                netTradingFlow
        );

        request.setAttribute(
                "buyPercentage",
                buyPercentage
        );

        request.setAttribute(
                "sellPercentage",
                sellPercentage
        );

        request.setAttribute(
                "mostTradedStockId",
                mostTradedStockId
        );

        request.setAttribute(
                "highestTradeCount",
                highestTradeCount
        );

        request.setAttribute(
                "activePage",
                "analytics"
        );


        // =========================================
        // OPEN ANALYTICS PAGE
        // =========================================

        request.getRequestDispatcher(
                "analytics.jsp"
        ).forward(request, response);
    }


    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}