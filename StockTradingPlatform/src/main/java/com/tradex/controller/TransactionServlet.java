package com.tradex.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tradex.dao.TransactionDAO;
import com.tradex.model.Transaction;
import com.tradex.model.User;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================
        // CHECK LOGIN
        // =====================================

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("index.jsp");
            return;
        }


        // =====================================
        // GET LOGGED-IN USER
        // =====================================

        User user = (User) session.getAttribute("user");

        int userId = user.getUserId();


        // =====================================
        // GET TRANSACTIONS
        // =====================================

        TransactionDAO dao = new TransactionDAO();

        List<Transaction> transactions =
                dao.getTransactionsByUser(userId);


        // =====================================
        // CALCULATE STATISTICS
        // =====================================

        int totalTransactions = transactions.size();

        int buyOrders = 0;

        int sellOrders = 0;

        double totalTradeValue = 0;


        for (Transaction transaction : transactions) {

            String type =
                    transaction.getTransactionType();

            if (type != null &&
                type.equalsIgnoreCase("BUY")) {

                buyOrders++;

            } else if (type != null &&
                       type.equalsIgnoreCase("SELL")) {

                sellOrders++;
            }

            totalTradeValue +=
                    transaction.getTotalAmount();
        }


        // =====================================
        // SEND DATA TO JSP
        // =====================================

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
                "totalTradeValue",
                totalTradeValue
        );

        request.setAttribute(
                "activePage",
                "transactions"
        );


        // =====================================
        // OPEN TRANSACTIONS PAGE
        // =====================================

        request.getRequestDispatcher(
                "transactions.jsp"
        ).forward(request, response);
    }


    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}