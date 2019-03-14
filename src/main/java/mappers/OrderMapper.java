package mappers;

import model.Base;
import model.Cupcake;
import model.Topping;
import model.User;
import util.ConnnectionConfiguration;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class OrderMapper {

    public void insertOrder(User user, ArrayList<Cupcake> shoplist) throws SQLException, ClassNotFoundException {

        BaseTopMapper baseTopMapper = new BaseTopMapper();
        HashMap<String, Base> baseMap = baseTopMapper.baseMap();
        HashMap<String, Topping> topMap = baseTopMapper.topMap();

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int total = 0;

        for (Cupcake cupcake : shoplist) {
            total = total + (cupcake.getPrice()*cupcake.getAmount());
        }

        connection = ConnnectionConfiguration.getConnection();
        ps = connection.prepareStatement("INSERT INTO Cupcake.orders\n" +
                "(user_id,total)" +
                "VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, user.getUserID());
        ps.setInt(2, total);
        ps.executeUpdate();
        rs = ps.getGeneratedKeys();
        rs.next();
        int id = rs.getInt(1);

        for (Cupcake cupcake : shoplist) {
            connection = ConnnectionConfiguration.getConnection();
            ps = connection.prepareStatement("INSERT INTO Cupcake.order_lines" +
                    "(order_id, topping_id, base_id, amount)" +
                    "VALUES (?, ?, ?, ?)" +
                    ";");
            ps.setInt(1, id);
            ps.setInt(2, topMap.get(cupcake.getTop()).getId());
            ps.setInt(3, baseMap.get(cupcake.getBase()).getId());
            ps.setInt(4, cupcake.getAmount());
            ps.executeUpdate();
        }

        connection = ConnnectionConfiguration.getConnection();
        ps = connection.prepareStatement("UPDATE user " +
                "SET balance = ? " +
                "WHERE user_id = ?" +
                ";");
        ps.setInt(1,user.getBalance()-total);
        ps.setInt(2, user.getUserID());
        ps.executeUpdate();
    }

    public void removeOrder(int orderId) throws SQLException, ClassNotFoundException {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        connection = ConnnectionConfiguration.getConnection();
        ps = connection.prepareStatement("UPDATE orders " +
                "SET active = ? " +
                "WHERE order_id = ?" +
                ";");
        ps.setInt(1, 0);
        ps.setInt(2, orderId);
        ps.executeUpdate();
    }
}
