package statistic;

import answers.ErrorAnswer;
import answers.StatAnswer;
import org.json.JSONObject;
import utils.FileUtils;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Period;
import java.util.List;

public class StatisticOperation {
    public void execute (String inputFile, String outputFile) throws SQLException {

        JSONObject jsonObject = new JSONObject(FileUtils.readFile(inputFile));

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date start = Date.valueOf(jsonObject.getString("startDate"));   //forSQL
        Date end = Date.valueOf(jsonObject.getString("endDate"));       //forSQL
        Period daysPeriod = Period.between(start.toLocalDate(), end.toLocalDate());
        int days = daysPeriod.getDays() + 1;
        if (days <= 0) {
            ErrorAnswer.printError("Неверный диапазон дат", outputFile);
            System.out.println("Завершаем работу");
            System.exit(-1);
        }

        List<CustomerStat> statList = new QueryStat().findCustomersAndPurchases(start, end);

        StatResult statResult = new StatResult(days, statList);

        StatAnswer.printStatistic(statResult, outputFile);
    }
}
