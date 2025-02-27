package io.loopcamp.jdbctests.day02;

import io.loopcamp.utility.DB_Utility;
import org.junit.Test;

import java.util.List;
import java.util.Map;

public class p01_DBUtilPractice {


    @Test
    public void task1(){
        //make connection to Hr DB
        DB_Utility.createConnection();

        //Get the first name, last name , salary from enpl
        DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES");

        //get all the data from DB as a MAp for 1st row
        Map<String, String> row1Map = DB_Utility.getRowMap(1);
        System.out.println("row1Map = " + row1Map);

        System.out.println("DB_Utility.getRowMap(2) = " + DB_Utility.getRowMap(2));
        System.out.println("DB_Utility.getRowMap(3) = " + DB_Utility.getRowMap(3));
        System.out.println("DB_Utility.getRowMap(4) = " + DB_Utility.getRowMap(4));
        System.out.println();

        // gel all the column counts
        System.out.println("DB_Utility.getColumnCount() = " + DB_Utility.getColumnCount());

        /// get all the data from DB as List of Map
        System.out.println();
        List<Map<String,String>> allData =  DB_Utility.getAllRowAsListOfMap();
        System.out.println(allData);

        System.out.println();
        for (Map<String,String> eachMap : allData) {
            System.out.println(eachMap);
        }

        System.out.println();
        allData.forEach((eachMap) -> {
            System.out.println(eachMap);
        });


        // get me the data for specific row and cell
        System.out.println();
        System.out.println(DB_Utility.getCellValue(1, 3));
        System.out.println(DB_Utility.getCellValue(1, "SALARY"));


        // get all the data for 1st column
        System.out.println();
        System.out.println(DB_Utility.getColumnDataAsList(1));
        System.out.println(DB_Utility.getColumnDataAsList("FIRST_NAME"));


        // get all the column names
        System.out.println();
        System.out.println(DB_Utility.getAllColumnNamesAsList());

        // get all the data for 2nd row
        System.out.println();
        System.out.println(DB_Utility.getRowDataAsList(2));


        // Disconnect from DB
        DB_Utility.destroy();


        // Once we disconnected, we cannot read the read unless we reconnect and executeQuery
        DB_Utility.createConnection();
        DB_Utility.runQuery("SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES");
        System.out.println();
       System.out.println(DB_Utility.getRowDataAsList(3));


    }


}
