package statistic;

import java.util.List;

public class StatResult {
    private final String type = "stat";

    private int totalDays;
    private List<CustomerStat> customers;
    private int totalExpenses;
    private int avgExpenses;

    public StatResult(int totalDays, List<CustomerStat> customers) {
        this.totalDays = totalDays;
        this.customers = customers;

        totalExpenses = customers.stream()
                .map(CustomerStat::getTotalExpenses)
                .reduce(0, Integer::sum);
        avgExpenses = totalExpenses/customers.size();
    }

    public String getType() {
        return type;
    }

    public int getTotalDays() {
        return totalDays;
    }

    public List<CustomerStat> getCustomers() {
        return customers;
    }

    public int getTotalExpenses() {
        return totalExpenses;
    }

    public int getAvgExpenses() {
        return avgExpenses;
    }
}
