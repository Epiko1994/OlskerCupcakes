package controllers;

import model.Cupcake;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShopController", urlPatterns = "/shopservlet")
public class ShopController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String source = request.getParameter("source");

        ArrayList<Cupcake> shopList = new ArrayList<>();

        switch (source){

            case "addtocart": {
                String bottom = request.getParameter("bottom");
                String top = request.getParameter("top");
                int amount = Integer.parseInt(request.getParameter("amount"));
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
