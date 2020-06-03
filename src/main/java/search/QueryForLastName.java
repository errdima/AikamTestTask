package search;

import Utils.DBConnection;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QueryForLastName {

    public List<Customer> findCustomers(String lastName) throws SQLException {
        List<Customer> result = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
           if (connection == null) {
                System.out.println("Нет соединения с базой данных!");
                return null;
           } else {
               String sqlQuery = "SELECT firstName, lastName FROM customers WHERE lastName = ?";

               PreparedStatement statement = connection.prepareStatement(sqlQuery);
               statement.setString(1, lastName);

               try (ResultSet resultSet = statement.executeQuery()){
               while (resultSet.next()) {
                   Customer customer = new Customer(
                           resultSet.getString("lastName"),
                           resultSet.getString("firstName"));
                    result.add(customer);
                    }
               }
           }
        }
        return result;
    }
}
