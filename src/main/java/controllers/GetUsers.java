package controllers;

import mappers.UserMapper;
import model.User;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GetUsers", urlPatterns = "/servlet")
public class GetUsers extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        UserMapper userMapper = new UserMapper();
        try {
            request.setAttribute("users", userMapper.customerReader());
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("users", e);
        }

        String destination = request.getParameter("destination");
        request.getRequestDispatcher(destination).forward(request, response);
    }
}
