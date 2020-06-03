import answers.ErrorAnswer;
import org.json.JSONObject;
import search.SearchCriterias;
import statistic.StatisticOperation;
import utils.FileUtils;

import java.sql.SQLException;

public class Application {

    public static void main(String[] args) {
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
                        try {
                            new SearchCriterias().execute(inputFile, outputFile);
                        } catch (SQLException e) {
                            ErrorAnswer.printError("Возникла SQLException", outputFile);
                        }
                    } else
                        ErrorAnswer.printError("Проверьте корректность запроса в input.json", outputFile);
                    break;
                case "stat":
                    if (jsonObject.has("startDate")){
                        try {
                            new StatisticOperation().execute(inputFile, outputFile);
                        } catch (SQLException e) {
                            ErrorAnswer.printError("Возникла SQLException", outputFile);
                        }
                    } else
                        ErrorAnswer.printError("Проверьте корректность запроса в input.json", outputFile);
                    break;
                default:
                    ErrorAnswer.printError("Неверный запрос", outputFile);
            }
        }
    }
}
