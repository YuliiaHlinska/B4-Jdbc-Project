package io.loopcamp.jdbctests.day01;

import java.sql.*;

public class p03_MetaData {

    public static void main(String[] args) throws SQLException {

        String dburl = "jdbc:oracle:thin:@54.227.218.94:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dburl, dbUser, dbPassword);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery("SELECT * from EMPLOYEES");

        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println("dbMetaData = " + dbMetaData.getUserName());
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverName());



    }
}
