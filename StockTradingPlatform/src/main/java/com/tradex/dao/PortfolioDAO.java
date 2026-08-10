package com.tradex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradex.model.Portfolio;
import com.tradex.model.PortfolioView;
import com.tradex.utility.DBConnection;

public class PortfolioDAO {

    private Connection con;

    public PortfolioDAO() {

        con = DBConnection.getConnection();

    }

    // ==========================
    // Add Stock to Portfolio
    // ==========================

    public boolean addStockToPortfolio(Portfolio portfolio) {

        boolean status = false;

        try {

            String sql = "INSERT INTO portfolio(user_id, stock_id, quantity, average_buy_price) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, portfolio.getUserId());
            ps.setInt(2, portfolio.getStockId());
            ps.setInt(3, portfolio.getQuantity());
            ps.setDouble(4, portfolio.getAverageBuyPrice());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                status = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;

    }

    // ==========================
    // Fetch User Portfolio
    // ==========================

    public List<PortfolioView> getUserPortfolio(int userId) {

        List<PortfolioView> portfolioList = new ArrayList<>();

        try {

            String sql =
                    "SELECT p.portfolio_id, " +
                    "p.stock_id, " +
                    "p.quantity, " +
                    "p.average_buy_price, " +
                    "s.company_name, " +
                    "s.stock_symbol, " +
                    "s.current_price " +
                    "FROM portfolio p " +
                    "JOIN stocks s ON p.stock_id = s.stock_id " +
                    "WHERE p.user_id=? " +
                    "ORDER BY p.portfolio_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                PortfolioView portfolio = new PortfolioView();

                portfolio.setPortfolioId(rs.getInt("portfolio_id"));
                portfolio.setStockId(rs.getInt("stock_id"));
                portfolio.setCompanyName(rs.getString("company_name"));
                portfolio.setStockSymbol(rs.getString("stock_symbol"));
                portfolio.setQuantity(rs.getInt("quantity"));
                portfolio.setAverageBuyPrice(rs.getDouble("average_buy_price"));
                portfolio.setCurrentPrice(rs.getDouble("current_price"));

                portfolioList.add(portfolio);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return portfolioList;

    }

}