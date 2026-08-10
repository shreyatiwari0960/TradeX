package com.tradex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradex.model.Stock;
import com.tradex.utility.DBConnection;

public class StockDAO {

    private Connection con;

    public StockDAO() {

        con = DBConnection.getConnection();

    }

    public List<Stock> getTrendingStocks() {

        List<Stock> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM stocks ORDER BY current_price DESC LIMIT 5";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Stock stock = new Stock();

                stock.setStockId(rs.getInt("stock_id"));
                stock.setCategoryId(rs.getInt("category_id"));
                stock.setCompanyName(rs.getString("company_name"));
                stock.setStockSymbol(rs.getString("stock_symbol"));
                stock.setCurrentPrice(rs.getDouble("current_price"));

                list.add(stock);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;

    }

}