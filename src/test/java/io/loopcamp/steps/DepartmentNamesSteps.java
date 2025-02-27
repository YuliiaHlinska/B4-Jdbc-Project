package io.loopcamp.steps;

import io.cucumber.java.en.*;
import io.loopcamp.utility.DB_Utility;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class DepartmentNamesSteps {
    List<String> actualDepartments;
    List <String> actualUserId;

    @Given("Establish the database connection")
    public void establish_the_database_connection() {
        System.out.println("************************************");
        System.out.println("Connection established through HOOKS");
        System.out.println("*************************************");

    }
    @When("Execute query to get all columns for {string}")
    public void execute_query_to_get_all_columns_for(String tableName) {

        String sql = "select * from identity." + tableName;
        DB_Utility.runQuery(sql);
        actualDepartments = DB_Utility.getColumnDataAsList("name");
        System.out.println("actualDepartments = " + actualDepartments);

    }
    @Then("verify the below columns are listed in result for")
    public void verify_the_below_columns_are_listed_in_result_for(List<String> expectedDepartmentName) {
        System.out.println("expectedDepartmentName = " + expectedDepartmentName);

        assertEquals(expectedDepartmentName,actualDepartments);
    }



    @When("Execute query to get all IDs from users")
    public void execute_query_to_get_all_i_ds_from_users() {
        String sql = "SELECT * from document.users";
        DB_Utility.runQuery(sql);
        actualUserId = DB_Utility.getColumnDataAsList("id");
        System.out.println("actualUserId = " + actualUserId);

    }
    @Then("verify all users has unique ID")
    public void verify_all_users_has_unique_id() {
        Set<String> removingDup = new LinkedHashSet<>(actualUserId);
        System.out.println("removingDup = " + removingDup);

        assertTrue(actualUserId.size() == removingDup.size());

    }

}
