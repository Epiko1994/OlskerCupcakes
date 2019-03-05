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

    public void setTop(String top) {
        this.top = top;
    }

    public String getBase() {
        return base;
    }

    public void setBase(String base) {
        this.base = base;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
