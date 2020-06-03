package search;

import Utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QueryForProductName {
    public List<Customer> findCustomers(String productName, int count) throws SQLException {
        List<Customer> result = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) {
                System.out.println("Нет соединения с базой данных!");
                return null;
            } else {
                String sqlQuery = "SELECT customers.lastName, customers.firstName \n" +
                        "FROM  customers, products, purchase \n" +
                        "WHERE products.id = purchase.\"product_ID\"\n" +
                        "AND customers.id = purchase.\"customer_ID\"\n" +
                        "AND products.name = ? \n" +
                        "GROUP BY customers.lastName, customers.firstName \n" +
                        "HAVING COUNT (purchase.\"product_ID\") >= ?;";

                PreparedStatement statement = connection.prepareStatement(sqlQuery);
                statement.setString(1, productName);
                statement.setInt(2, count);

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
