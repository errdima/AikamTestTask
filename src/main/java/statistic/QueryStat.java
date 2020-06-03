package statistic;

import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QueryStat {
    public List<CustomerStat> findCustomersAndPurchases(Date start, Date end) throws SQLException {
        List<CustomerStat> result = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) {
                System.out.println("Нет соединения с базой данных!");
                return null;
            } else {
                String sqlQuery = "SELECT customers.id, customers.lastname, " +
                        "customers.firstName, SUM(products.price) AS Sum\n" +
                        "FROM  customers, products, purchase\n" +
                        "WHERE purchase.\"customer_ID\" = customers.id\n" +
                        "AND purchase.\"product_ID\" = products.id\n" +
                        "AND purchase.date BETWEEN ? AND ?" +
                        "GROUP BY customers.id, customers.lastName, customers.firstName\n" +
                        "ORDER BY SUM(products.price) DESC;";

                PreparedStatement statement = connection.prepareStatement(sqlQuery);
                statement.setDate(1, start);
                statement.setDate(2, end);

                try (ResultSet resultSet = statement.executeQuery()){
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        CustomerStat customer = new CustomerStat(
                                resultSet.getString("lastName"),
                                resultSet.getString("firstName"));
                        int totalExpenses = resultSet.getInt("Sum");
                        customer.setTotalExpenses(totalExpenses);
                        customer.setPurchases(getListPurchases(id, start, end));
                        result.add(customer);
                    }
                }
            }
        }
        return result;
    }

    List<Purchase> getListPurchases (int id, Date start, Date end) throws SQLException{
        List<Purchase> result = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) {
                System.out.println("Нет соединения с базой данных!");
                return null;
            } else {
                String sqlQuery = "SELECT products.name, SUM(products.price) AS totalSum\n" +
                        "FROM  customers, products, purchase " +
                        "WHERE purchase.\"customer_ID\" = customers.id" +
                        "  AND purchase.\"product_ID\" = products.id\n" +
                        "  AND customers.id = ?" +
                        "  AND purchase.date BETWEEN ? AND ?" +
                        "GROUP BY products.name " +
                        "ORDER BY SUM(products.price) DESC;";


                PreparedStatement statement = connection.prepareStatement(sqlQuery);
                statement.setInt(1, id);
                statement.setDate(2, start);
                statement.setDate(3, end);

                try (ResultSet resultSet = statement.executeQuery()){
                    while (resultSet.next()) {
                        Purchase purchase = new Purchase(
                                resultSet.getString("name"),
                                resultSet.getInt("totalSum"));

                        result.add(purchase);
                    }
                }
            }
        }
        return result;
    }
}
