package io.loopcamp.jdbctests.day01;

import java.sql.*;

public class p01_JDBC_intro {
    public static void main(String[] args) throws SQLException {


        // to make connection dbUrl, dbname, dbpassword
        String dburl = "jdbc:oracle:thin:@54.227.218.94:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr";

    /*
    1. Connection
    2. Statement - helps us to write and execute the queries
    3. ResultSet -

     */
        // DriverManager() is a class has getConnection(arg1, arg2, arg3) methos which made connection to DB
        Connection conn = DriverManager.getConnection(dburl, dbUser, dbPassword);

        //create statement reference from conn reference to execute the sql queries
        Statement stmt = conn.createStatement();
        //stmt.executeQuery("select * from employees");

        //ResultSet - create result set reference "ResultSet rs" from "stmt" reference to store te result that comes back from SQL queery we executed
        ResultSet rs = stmt.executeQuery("SELECT * from DEPARTMENTS"); //the cursor is in beforefirst row as starting point

        rs.next();// this will move the cursor to the next row

        System.out.println(rs.getString("DEPARTMENT_NAME"));
        int managerIdOnFirstRow = rs.getInt("MANAGER_ID");
        System.out.println(managerIdOnFirstRow);
        System.out.println();
        rs.next();
        System.out.println(rs.getString("Department_NAME"));
        System.out.println(rs.getString(2)); // 0 and 1 in Database is the first one column


        System.out.println();

        //how to get to the next row with the help of loop
        while (rs.next()){
            System.out.println("Department name: " + rs.getString("Department_Name"));
        }
        // Jumping to the next one after last row
        //rs.next();
        // Since, there is no row after last one, it will give exception ->  SQLException: Result set after last row
        //System.out.println("Department Name: " + rs.getString("Department_NAME"));

        // currently still on the after last row.


        System.out.println();
        // jump to the first row
        rs.first();
        // Currently we will get this exception: SQLException: Invalid operation for forward only resultset : first
        System.out.println("Department Name: " + rs.getString("Department_NAME"));

        // lest see why we get an error on different file



    }
}
