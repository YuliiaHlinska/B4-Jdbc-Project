package io.loopcamp.jdbctests.day02;

import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import org.junit.Assert;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class p02_DocuportDBPractice {
    //String docuportUrl ="jdbc:postgresql://35.222.62.70:5432/postgres";
    String docuportUrl = ConfigurationReader.getProperty("docuportDbUrl");
    //String docuportUsername ="tstadmin";
    String docuportUsername =ConfigurationReader.getProperty("docuportDbUsername");
    //String docuportPassword ="pamBam-Gagmon-85tmrw";
    String docuportPassword =ConfigurationReader.getProperty("docuportDbPassword");

    @DisplayName("Docuport DB vs UI test")
    @Test
    public void task1 () {

        // created connection with DOCUPORT DB
        //DB_Utility.createConnection(docuportUrl, docuportUsername, docuportPassword);
        DB_Utility.createConnection(ConfigurationReader.getProperty("docuportDbUrl"), docuportUsername, docuportPassword);

        // Advisor count from UI
        int uiAdvisorCount = 7;


        // Run the query
        DB_Utility.runQuery("SELECT * FROM document.users WHERE role_name = 'advisor'");


        // Advisor count from DB
        int dbAdvisorCount = DB_Utility.getRowCount();
        //System.out.println(uiAdvisorCount);


        // Validate the UI Advisor count is matching DB Advisor count
        Assert.assertEquals("Not matching", uiAdvisorCount, dbAdvisorCount);


        DB_Utility.destroy();

    }
}
