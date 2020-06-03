package search;

import Utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QueryForBadCustomers {
    public List<Customer> findCustomers(int limit) throws SQLException {
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
                        "GROUP BY customers.lastName, customers.firstName\n" +
                        "ORDER BY COUNT(products.name) LIMIT ?;";

                PreparedStatement statement = connection.prepareStatement(sqlQuery);
                statement.setInt(1, limit);

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
