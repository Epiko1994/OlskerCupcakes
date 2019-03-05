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

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public ArrayList<Order> getOrders() {
        return orders;
    }

    public void setOrders(ArrayList<Order> orders) {
        this.orders = orders;
    }
}
