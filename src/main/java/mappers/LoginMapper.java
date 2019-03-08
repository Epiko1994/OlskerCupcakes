package mappers;

import util.ConnnectionConfiguration;

import java.sql.*;

public class LoginMapper {

    public boolean loginCheck(String email, String psw) throws SQLException, ClassNotFoundException {

        boolean login = false;

        Connection connection = null;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;

        connection = ConnnectionConfiguration.getConnection();
        preparedStatement = connection.prepareStatement
                ("SELECT CASE WHEN EXISTS(SELECT * FROM user WHERE user.email = ? AND user.password = ?) THEN TRUE ELSE FALSE END AS login");
        preparedStatement.setString(1,email);
        preparedStatement.setString(2,psw);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            login = resultSet.getBoolean("login");
        }

        return login;
    }
}
