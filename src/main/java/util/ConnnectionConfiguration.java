package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnnectionConfiguration {

    private static final String URL = "jdbc:mysql://CupcakeUser@157.230.105.104/Cupcake";
    private static final String USERNAME = "CupcakeUser";
    private static final String PASSWORD = "1234";

    private static Connection doubleThomas;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (doubleThomas == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            doubleThomas = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }
        return doubleThomas;
    }
}
