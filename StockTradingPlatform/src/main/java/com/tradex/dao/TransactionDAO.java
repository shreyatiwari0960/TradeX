package com.tradex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradex.model.Transaction;
import com.tradex.utility.DBConnection;

public class TransactionDAO {

    private Connection con;

    public TransactionDAO() {
        con = DBConnection.getConnection();
    }

    // ================================
    // SAVE TRANSACTION
    // ================================

    public boolean saveTransaction(Transaction transaction) {

        boolean status = false;

        try {

            String sql =
                "INSERT INTO transactions " +
                "(user_id, stock_id, transaction_type, quantity, " +
                "price_per_share, brokerage, tax, total_amount, transaction_status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, transaction.getUserId());
            ps.setInt(2, transaction.getStockId());
            ps.setString(3, transaction.getTransactionType());
            ps.setInt(4, transaction.getQuantity());
            ps.setDouble(5, transaction.getPricePerShare());
            ps.setDouble(6, transaction.getBrokerage());
            ps.setDouble(7, transaction.getTax());
            ps.setDouble(8, transaction.getTotalAmount());
            ps.setString(9, transaction.getTransactionStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================================
    // GET USER TRANSACTIONS
    // ================================

    public List<Transaction> getTransactionsByUser(int userId) {

        List<Transaction> transactions = new ArrayList<>();

        try {

            String sql =
                "SELECT transaction_id, user_id, stock_id, " +
                "transaction_type, quantity, price_per_share, " +
                "brokerage, tax, total_amount, transaction_status " +
                "FROM transactions " +
                "WHERE user_id = ? " +
                "ORDER BY transaction_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Transaction transaction = new Transaction();

                transaction.setTransactionId(
                    rs.getInt("transaction_id")
                );

                transaction.setUserId(
                    rs.getInt("user_id")
                );

                transaction.setStockId(
                    rs.getInt("stock_id")
                );

                transaction.setTransactionType(
                    rs.getString("transaction_type")
                );

                transaction.setQuantity(
                    rs.getInt("quantity")
                );

                transaction.setPricePerShare(
                    rs.getDouble("price_per_share")
                );

                transaction.setBrokerage(
                    rs.getDouble("brokerage")
                );

                transaction.setTax(
                    rs.getDouble("tax")
                );

                transaction.setTotalAmount(
                    rs.getDouble("total_amount")
                );

                transaction.setTransactionStatus(
                    rs.getString("transaction_status")
                );

                transactions.add(transaction);
            }

            rs.close();
            ps.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return transactions;
    }
}