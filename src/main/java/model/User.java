package model;

import java.util.ArrayList;

public class User {

    private int userID;
    private String email;
    private int saldo;
    private boolean isAdmin;
    private ArrayList<Order> orders;

    public User(int userID, String email, int saldo, boolean isAdmin) {
        this.userID = userID;
        this.email = email;
        this.saldo = saldo;
        this.isAdmin = isAdmin;
        this.orders = new ArrayList<>();
    }

    public User() {

    }


    public int getUserID() {
        return userID;
    }

    public String getEmail() {
        return email;
    }

    public int getSaldo() {
        return saldo;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public ArrayList<Order> getOrders() {
        return orders;
    }

}
