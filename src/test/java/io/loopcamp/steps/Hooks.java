package io.loopcamp.steps;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.loopcamp.utility.ConfigurationReader;
import io.loopcamp.utility.DB_Utility;
import io.loopcamp.utility.Driver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

public class Hooks {

    @Before("@docuportDb")
    public void setUpDB(){
        String url = ConfigurationReader.getProperty("docuportDbUrl");
        String username = ConfigurationReader.getProperty("docuportDbUsername");
        String password = ConfigurationReader.getProperty("docuportDbPassword");

        DB_Utility.createConnection(url, username, password);
    }

    @After("@docuportDb")
    public void closeDBConn (){
        DB_Utility.destroy();
    }


    @Before("@ui")
    public void setUpUI (){
        Driver.getDriver().get(ConfigurationReader.getProperty("docuportDbUrl"));
    }


    @After("@ui")
    public void screenShot(Scenario scenario){
        if(scenario.isFailed()){
            final byte[] screenshot = ((TakesScreenshot) Driver.getDriver()).getScreenshotAs(OutputType.BYTES);
            scenario.attach(screenshot, "image/png", scenario.getName());
        }
        Driver.closeDriver();
    }

}

