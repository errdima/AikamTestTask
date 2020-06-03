package answers;

import org.json.JSONObject;
import utils.FileUtils;

public class ErrorAnswer {

    public static void printError(String error, String file) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("type", "error");
        jsonObject.put("message", error);

        String json = jsonObject.toString(1);
        FileUtils.writeJSONFile(json, file);
    }
}
