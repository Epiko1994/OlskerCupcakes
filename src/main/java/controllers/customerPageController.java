package controllers;

import mappers.UserMapper;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "customerPageController", urlPatterns = "/customerPageController")
public class customerPageController extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    //
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));

        ArrayList<User> users = new ArrayList<>();
        mappers.UserMapper userMapper = new UserMapper();
        try {
            users = userMapper.customerReader();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        User user = new User();

        for (User user1 : users) {
            if (user1.getUserID() == userid) {
                user = user1;
            }
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("customerPage.jsp").forward(request, response);
    }
}
