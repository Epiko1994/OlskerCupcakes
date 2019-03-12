package model;

import java.util.ArrayList;

public class Order {

    private int orderID;
    private ArrayList<Cupcake> cupcakes;
    private String dateTime;
    private int totalprice;


    public Order(int orderID, String dateTime) {
        this.orderID = orderID;
        this.cupcakes = new ArrayList<>();
        this.dateTime = dateTime;
        this.totalprice = 0;
    }

    public int getOrderID() {
        return orderID;
    }

    public ArrayList<Cupcake> getCupcakes() {
        return cupcakes;
    }

    public String getDateTime() {
        return dateTime;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }


}
