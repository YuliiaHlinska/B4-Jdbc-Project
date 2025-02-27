package io.loopcamp.jdbctests.day01;

import java.sql.*;

public class p02_flexible_Navigation {
    public static void main(String[] args) throws SQLException {



        String dburl = "jdbc:oracle:thin:@54.227.218.94:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dburl, dbUser, dbPassword);

        //ResultSet.TYPE_SCROLL_INSENSITIVE;
        //ResultSet.CONCUR_READ_ONLY;
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("SELECT * from EMPLOYEES");

        rs.next();
        System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));
       // System.out.println(rs.getString("Phone_Number"));

        while(rs.next()){
            System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));
        }
        //our cursor is at the end of the table (outside last row)

        System.out.println("___________________________");
        rs.first();
        System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));

        rs.absolute(10);
        System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));

        rs.last();
        System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));

        rs.previous();
        System.out.println(rs.getString("First_name") +" : " + rs.getString("Phone_Number"));

        rs.absolute(15);
        rs.previous();
        System.out.println(rs.getString("First_Name") + ": \t\t" + rs.getString("Phone_number"));

        System.out.println("+++++++++++++++++++++++++++++++");
        rs.first();
        while (rs.next()) {
            System.out.println(rs.getString("First_Name") + ": \t\t" + rs.getString("Phone_number"));
        }

        System.out.println("=================================");
        rs.beforeFirst();
        while (rs.next()) {
            System.out.println(rs.getString("First_Name") + ": \t\t" + rs.getString("Phone_number"));
        }



        System.out.println();
        //rs.afterLast();
        //System.out.println(rs.getString("First_Name") + ": \t\t" + rs.getString("Phone_number"));










    }
}
