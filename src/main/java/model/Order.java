package model;

import java.util.ArrayList;

public class Order {

    private int orderID;
    private ArrayList<Cupcake> cupcakes;
    private String dateTime;

    public Order(int orderID, String dateTime) {
        this.orderID = orderID;
        this.cupcakes = new ArrayList<>();
        this.dateTime = dateTime;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public ArrayList<Cupcake> getCupcakes() {
        return cupcakes;
    }

    public void setCupcakes(ArrayList<Cupcake> cupcakes) {
        this.cupcakes = cupcakes;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
}
