package controllers;

import mappers.UserMapper;
import model.User;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "OrderPageController", urlPatterns = "/OrderPageController")
public class OrderPageController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderid = Integer.parseInt(request.getParameter("orderid"));

        ArrayList<User> users = new ArrayList<>();
        mappers.UserMapper userMapper = new UserMapper();
        try {
            users = userMapper.customerReader();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        for (User user   :
                users) {
            for (Order order1 :
                 user.getOrders()) {
                if (order1.getOrderID() == orderid) {
                    request.setAttribute("order", order1);

                }

            }

        }


        request.getRequestDispatcher("orderPage.jsp").forward(request, response);

    }
}
