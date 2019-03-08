package mappers;

import util.ConnnectionConfiguration;

import java.sql.*;

public class LoginMapper {

    public boolean loginCheck(String email, String psw) throws SQLException, ClassNotFoundException {

        boolean login;

        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;

        connection = ConnnectionConfiguration.getConnection();
        preparedStatement = connection.prepareStatement("SELECT CASE WHEN EXISTS \n" +
                "(SELECT * FROM user WHERE user.email = ? AND user.password = ?)\n" +
                "THEN TRUE\n" +
                "ELSE FALSE\n" +
                "END\n" +
                "AS 'login'");
        preparedStatement.setString(1,email);
        preparedStatement.setString(2,psw);
        resultSet = preparedStatement.executeQuery();
        login = resultSet.getBoolean("login");

        return login;
    }
}
