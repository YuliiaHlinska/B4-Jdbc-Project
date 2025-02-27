package io.loopcamp.jdbctests.day01;

import io.loopcamp.utility.DB_Utility;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class p03_MetaData {
    public static void main(String[] args) throws SQLException {

        String dbUrl = "jdbc:oracle:thin:@44.201.130.124:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr";

        Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");



        // ---------------------------------------------------------------------------------------------------------------

        /**
         DataBase Meta Data - interface
         - will gve us the information about the database itself
         - we use 'conn' reference to make DatabaseMetaData dbMetaData reference
         */

        DatabaseMetaData dbMetaData = conn.getMetaData();
        System.out.println("DB username: " + dbMetaData.getUserName());
        System.out.println("DB product name: " + dbMetaData.getDatabaseProductName());
        System.out.println("DB product version: " + dbMetaData.getDatabaseProductVersion());
        System.out.println("DB Driver name: " + dbMetaData.getDriverName());
        System.out.println("DB Driver version: " + dbMetaData.getDriverVersion());


        // ---------------------------------------------------------------------------------------------------------------
        /**
         ResultSet Meta Data
         - will give us the information about the upper section of the table meaning "Column Names" or "Column count"
         - we use "rs" reference to make ResultSetMetaData rsmd reference
         */


        System.out.println();
        ResultSetMetaData rsmd = rs.getMetaData();
        System.out.println("Column Count: " + rsmd.getColumnCount());

        //System.out.println("Column Name: " + rsmd.getColumnName(0)); // the getColumnName(); method does not accept index 0
        System.out.println("Column Name: " + rsmd.getColumnName(1));
        System.out.println("Column Name: " + rsmd.getColumnName(11));
        System.out.println("Column Name: " + rsmd.getColumnName(rsmd.getColumnCount()));

        //System.out.println(rsmd.getColumnType(1));
        //System.out.println(rsmd.getTableName(1).toString());


        System.out.println();
        // how can you get all the column names dynamically
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.println("Column " + i + ": " + rsmd.getColumnName(i));
        }


        // Now we know how we can get all the row and how we can get all the column
        // KEY - column name
        // VALUE - row data


        // Info about the rows              --- > ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEES");
        // Info about the column names      --- > ResultSetMetaData rsmd = rs.getMetaData();


        System.out.println("----------------------------------");
        rs.first();
        System.out.println(rsmd.getColumnName(1));                  // get me the the Column Name at index 1
        System.out.println(rs.getString(1));                        // get me the value for the Column at index 1
        System.out.println(rs.getString("EMPLOYEE_ID"));            // get me the value for the Column which has name "EMPLOYEE_ID"
        System.out.println(rs.getString(rsmd.getColumnName(1)));    // get me the value for the Column Name which at index of 1


        System.out.println();
        Map <String, String> firstPersonInfo = new LinkedHashMap();
        //firstPersonInfo.put("EMPLOYEE_ID", "100");
        firstPersonInfo.put(rsmd.getColumnName(1), rs.getString(1));
        firstPersonInfo.put(rsmd.getColumnName(2), rs.getString(2));
        firstPersonInfo.put(rsmd.getColumnName(3), rs.getString(3));
        System.out.println(firstPersonInfo);

        rs.next();
        Map <String, String> secondPersonInfo = new LinkedHashMap();
        secondPersonInfo.put(rsmd.getColumnName(1), rs.getString(1));
        secondPersonInfo.put(rsmd.getColumnName(2), rs.getString(2));
        secondPersonInfo.put(rsmd.getColumnName(3), rs.getString(3));
        System.out.println(secondPersonInfo);

        System.out.println();
        List<Map<String, String>> allPeople = new ArrayList();
        allPeople.add(firstPersonInfo);
        allPeople.add(secondPersonInfo);
        System.out.println(allPeople);


        System.out.println("============================================");
        List<Map<String, String>> allPeopleInfo = new ArrayList();


        rs.beforeFirst();
        while (rs.next()) {
            Map<String, String> eachPersonInfo = new LinkedHashMap();

            for (int i = 1; i <= rsmd.getColumnCount(); i++) {

                eachPersonInfo.put( rsmd.getColumnName(i), rs.getString(i));
            }

            //System.out.println(eachPersonInfo);
            allPeopleInfo.add(eachPersonInfo);
        }

        System.out.println(allPeopleInfo);


        System.out.println("============================================");

        // Can you get me all the first names
        for ( Map <String, String> eachPerson : allPeopleInfo) {
            System.out.println(eachPerson.get("FIRST_NAME")); // Since we stored it in all upper case in data structure, Case sensitivity matters to read from it.
        }


        System.out.println("============================================");
        // get me the full name
        for ( Map <String, String> eachPerson : allPeopleInfo) {
            System.out.println(eachPerson.get("FIRST_NAME") + " " + eachPerson.get("LAST_NAME"));
        }


        System.out.println("============================================");
        // get me the full name
        List <String> allFullNames = new ArrayList();
        for ( Map <String, String> eachPerson : allPeopleInfo) {
            allFullNames.add(eachPerson.get("FIRST_NAME") + " " + eachPerson.get("LAST_NAME"));
        }
        System.out.println(allFullNames);


        System.out.println("============================================");
        rs = stmt.executeQuery("SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE SALARY = 2100");
        rs = stmt.executeQuery("SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES");
        rs.next();
        System.out.println(rs.getString("FIRST_NAME"));


        System.out.println("============================================");
        // Some methods from DB_Utility class
        DB_Utility.createConnection();
        rs = DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE SALARY = 2100");
        rs = DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES");
        rs.last();
        System.out.println(rs.getRow());
        System.out.println(DB_Utility.getColumnCount());

        System.out.println(DB_Utility.getRowMap(1));
        //DB_Utility.resetCursor();
        DB_Utility.destroy();




    }
}


