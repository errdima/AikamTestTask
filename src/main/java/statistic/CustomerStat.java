package statistic;

import java.util.List;

public class CustomerStat {
    private String name;
    private List<Purchase> purchases;
    private int totalExpenses;

    public CustomerStat(String lastName, String firstName) {
        this.name = lastName + " " + firstName;
    }

    public void setPurchases(List<Purchase> purchases) {
        this.purchases = purchases;
    }

    public void setTotalExpenses(int totalExpenses) {
        this.totalExpenses = totalExpenses;
    }

    public String getName() {
        return name;
    }

    public List<Purchase> getPurchases() {
        return purchases;
    }

    public int getTotalExpenses() {
        return totalExpenses;
    }
}
