package mappers;

import model.User;
import util.ConnnectionConfiguration;

import java.sql.*;
import java.util.ArrayList;

public class UserMapper {

    public static ArrayList<User> customerReader() throws SQLException, ClassNotFoundException {
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

            }
        }

        return userList;
    }
}