package mappers;

import model.Base;
import model.Topping;
import util.ConnnectionConfiguration;

import java.sql.*;
import java.util.ArrayList;

public class BaseTopMapper {

    public ArrayList<Base> baseReader() throws SQLException, ClassNotFoundException {

        ArrayList<Base> baseList = new ArrayList<>();
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
            baseList.add(new Base(name,price));
        }

        return baseList;
    }

    public ArrayList<Topping> topReader() throws SQLException, ClassNotFoundException {

        ArrayList<Topping> topList = new ArrayList<>();
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
            topList.add(new Topping(name,price));
        }

        return topList;
    }

}
