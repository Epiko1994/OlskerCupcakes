package controllers;

import mappers.BaseTopMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet(name = "indexController", urlPatterns = "/indexController")
public class indexController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doIt(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doIt(request, response);
    }

    private void doIt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BaseTopMapper baseTopMapper = new BaseTopMapper();
        HashMap<String, Integer> topHash = new HashMap<>();
        HashMap<String, Integer> baseHash = new HashMap<>();

        try {
            topHash = baseTopMapper.topReader();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            baseHash = baseTopMapper.baseReader();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        request.setAttribute("topHash", topHash);
        request.setAttribute("baseHash", baseHash);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
