package com.tradex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tradex.model.Transaction;
import com.tradex.utility.DBConnection;

public class TransactionDAO {

    private Connection con;

    public TransactionDAO() {

        con = DBConnection.getConnection();

    }

    public boolean saveTransaction(Transaction transaction) {

        boolean status = false;

        try {

            String sql = "INSERT INTO transactions(user_id, stock_id, transaction_type, quantity, price_per_share, brokerage, tax, total_amount, transaction_status) VALUES(?,?,?,?,?,?,?,?,?)";

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

            if(rows > 0) {

                status = true;

            }

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;

    }

}