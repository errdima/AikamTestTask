import Utils.FileUtils;
import answers.ErrorAnswer;
import org.json.JSONObject;
import search.SearchCriterias;

import java.io.*;
import java.sql.SQLException;

public class Application {

    public static void main(String[] args) throws IOException, SQLException {
        if (args.length != 3) {
            System.out.println("Неверный формат запуска программы");
        }
        else {
            String query = args[0];
            String inputFile = args[1];
            String outputFile =args[2];

            JSONObject jsonObject = new JSONObject(FileUtils.readFile(inputFile));
            switch (query){
                case "search":
                    if (jsonObject.has("criterias")){
                        new SearchCriterias().execute(inputFile, outputFile);
                    } else
                        ErrorAnswer.printError("Проверьте корректность запроса в input.json", outputFile);
                    break;
                case "stat":
                    if (jsonObject.has("startDate")){
                        // Запускаем Stat
                    } else
                        ErrorAnswer.printError("Проверьте корректность запроса в input.json", outputFile);
                    break;
                default:
                    ErrorAnswer.printError("Неверный запрос", outputFile);
            }
        }
    }
}
