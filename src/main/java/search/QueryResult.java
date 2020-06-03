package search;

import org.json.JSONObject;

import java.util.List;

public class QueryResult {
    private JSONObject criteria;
    private List<Customer> results;

    public QueryResult(JSONObject criteria, List<Customer> results) {
        this.criteria = criteria;
        this.results = results;
    }

    public JSONObject getCriteria() {
        return criteria;
    }

    public List<Customer> getResults() {
        return results;
    }
}
