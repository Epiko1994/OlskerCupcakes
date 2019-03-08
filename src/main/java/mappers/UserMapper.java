package mappers;

import model.Cupcake;
import model.Order;
import model.User;
import util.ConnnectionConfiguration;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class UserMapper {


    public ArrayList<User> customerReader() throws SQLException, ClassNotFoundException {
        ArrayList<User> userList = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;


        connection = ConnnectionConfiguration.getConnection();
        statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * from user");

        while (resultSet.next()) {
            int userID = resultSet.getInt("user_id");
            String email = resultSet.getString("email");
            int balance = resultSet.getInt("balance");
            boolean isAdmin = resultSet.getBoolean("admin");
            userList.add(new User(userID, email, balance, isAdmin));
        }

        for (User user : userList) {
            preparedStatement = connection.prepareStatement("SELECT * from orders where user_id = ?;");
            preparedStatement.setInt(1, user.getUserID());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order(resultSet.getInt("order_id"), resultSet.getString("date"));
                user.getOrders().add(order);

            }
            for (Order order : user.getOrders()) {
                preparedStatement = connection.prepareStatement("SELECT order_id, amount, base_name, topping_name, " +
                        "base_price + topping_price as 'price' from order_lines " +
                        "inner join base b on order_lines.base_id = b.base_id " +
                        "inner join topping t on order_lines.topping_id = t.topping_id " +
                        "where order_id = ?");
                preparedStatement.setInt(1, order.getOrderID());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Cupcake cupcake = new Cupcake(resultSet.getString("topping_name"), resultSet.getString("base_name"), resultSet.getInt("price"), resultSet.getInt("amount"));
                    order.getCupcakes().add(cupcake);

                    order.setTotalprice(total(order.getCupcakes()));
                }
            }
        }
        return userList;
    }

    public HashMap<String,User> UserMap(ArrayList<User> userArray){

        HashMap<String,User> userMap = new HashMap<>();

        for (User user : userArray) {
            userMap.put(user.getEmail(),user);
        }

        return userMap;
    }

    private int total(ArrayList<Cupcake> cupcakes){
        int sum = 0;
        for (Cupcake cupcake :
                cupcakes) {
            sum = sum + (cupcake.getPrice()*cupcake.getAmount());
        }

        return sum;
    }
}