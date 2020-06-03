package answers;

import org.json.JSONObject;
import statistic.StatResult;
import utils.FileUtils;

public class StatAnswer {
    public static void printStatistic(StatResult statResult, String file) {

        JSONObject jsonObject = new JSONObject(statResult);

        String json = jsonObject.toString(1);
        FileUtils.writeJSONFile(json, file);
    }
}
