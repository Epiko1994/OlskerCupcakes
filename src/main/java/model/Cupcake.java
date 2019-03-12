package model;

public class Cupcake {

    private String top;
    private String base;
    private int price;
    private int amount;

    public Cupcake(String top, String base, int price, int amount) {
        this.top = top;
        this.base = base;
        this.price = price;
        this.amount = amount;
    }

    public String getTop() {
        return top;
    }

    public String getBase() {
        return base;
    }

    public int getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }

}
