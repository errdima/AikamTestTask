package answers;

import Utils.FileUtils;
import org.json.*;
import search.QueryResult;

import java.util.List;

public class SearchAnswer {
    public static void printSearch(List<QueryResult> list, String file) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("type", "search");
        jsonObject.put("results", list);

        String json = jsonObject.toString(1);
        FileUtils.writeJSONFile(json, file);
    }
}
