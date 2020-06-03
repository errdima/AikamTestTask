package statistic;

public class Purchase {
    private String name;
    private int expenses;

    public Purchase(String name, int expenses) {
        this.name = name;
        this.expenses = expenses;
    }

    public String getName() {
        return name;
    }

    public int getExpenses() {
        return expenses;
    }
}
