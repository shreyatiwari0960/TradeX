package com.tradex.utility;

import java.sql.Connection;

public class TestConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if(con != null) {
            System.out.println("==============================");
            System.out.println("TradeX Database Connected");
            System.out.println("==============================");
        }
        else {
            System.out.println("==============================");
            System.out.println("Connection Failed");
            System.out.println("==============================");
        }

    }

}