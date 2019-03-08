package mappers;

import model.Base;
import util.ConnnectionConfiguration;

import java.sql.*;
import java.util.HashMap;

public class BaseTopMapper {

    public HashMap<String,Integer> baseReader() throws SQLException, ClassNotFoundException {

        HashMap<String,Integer> baseList = new HashMap<>();
        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;

        connection = ConnnectionConfiguration.getConnection();
        statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM base");

        while (resultSet.next()) {
            String name = resultSet.getString("base_name");
            int price = resultSet.getInt("base_price");
            baseList.put(name,price);
        }

        return baseList;
    }

    public HashMap<String,Integer> topReader() throws SQLException, ClassNotFoundException {

        HashMap<String,Integer> topList = new HashMap<>();
        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;

        connection = ConnnectionConfiguration.getConnection();
        statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM topping");

        while (resultSet.next()) {
            String name = resultSet.getString("topping_name");
            int price = resultSet.getInt("topping_price");
            topList.put(name,price);
        }

        return topList;
    }
}
