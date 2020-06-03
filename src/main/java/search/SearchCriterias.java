package search;

import Utils.FileUtils;
import answers.SearchAnswer;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchCriterias {

    public void execute (String inputFile, String outputFile) throws SQLException {
        List<QueryResult> criteriasList = new ArrayList<>();

        JSONObject jsonObject = new JSONObject(FileUtils.readFile(inputFile));
        JSONArray criterias = jsonObject.getJSONArray("criterias");
        for (Object object : criterias){
            JSONObject criteria = (JSONObject) object;

            if (criteria.keySet().contains("lastName")){
                String lastName = criteria.getString("lastName");
                List<Customer> customers = new QueryForLastName().findCustomers(lastName);
                criteriasList.add(new QueryResult(criteria, customers));
            }

            if (criteria.keySet().contains("productName")){
                String lastName = criteria.getString("productName");
                int count = criteria.getInt("minTimes");
                List<Customer> customers = new QueryForProductName().findCustomers(lastName, count);
                criteriasList.add(new QueryResult(criteria, customers));
            }

            if (criteria.keySet().contains("minExpenses")){
                int min = criteria.getInt("minExpenses");
                int max = criteria.getInt("maxExpenses");
                List<Customer> customers = new QueryForExpenses().findCustomers(min, max);
                criteriasList.add(new QueryResult(criteria, customers));
            }

            if (criteria.keySet().contains("badCustomers")){
                int limit = criteria.getInt("badCustomers");
                List<Customer> customers = new QueryForBadCustomers().findCustomers(limit);
                criteriasList.add(new QueryResult(criteria, customers));
            }
        }
        SearchAnswer.printSearch(criteriasList,outputFile);
    }

}
