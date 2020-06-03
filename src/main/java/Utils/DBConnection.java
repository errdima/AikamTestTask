package Utils;

import answers.ErrorAnswer;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class DBConnection {
    public static Connection getConnection() throws SQLException {
        Properties properties = new Properties();
        try {
            properties.load(new FileInputStream("connection.properties"));
        } catch (IOException e) {
            ErrorAnswer.printError("Ошибка чтения файла connection.properties", "output.json");
            return null;
        }
        String url = properties.getProperty("db.url");
        String user = properties.getProperty("db.user");
        String pass = properties.getProperty("db.pass");

        return DriverManager.getConnection(url, user, pass);
    }
}