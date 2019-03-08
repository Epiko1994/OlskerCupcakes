package controllers;

import mappers.BaseTopMapper;
import model.Cupcake;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "ShopController", urlPatterns = "/shopcontroller")
public class ShopController extends HttpServlet {

    private ArrayList<Cupcake> shopList = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doIt(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doIt(request, response);
    }

    private void doIt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BaseTopMapper baseTopMapper = new BaseTopMapper();
        HashMap<String, Integer> baseList = new HashMap<>();
        HashMap<String, Integer> topList = new HashMap<>();


        try {
            baseList = baseTopMapper.baseReader();
            topList = baseTopMapper.topReader();
        } catch (Exception e) {
            e.printStackTrace(); //TODO: Print something
        }

        String source = request.getParameter("source");

        if (shopList.isEmpty()) {
            shopList = new ArrayList<>();
        }

        switch (source){

            case "addtocart": {
                String base = request.getParameter("base");
                String top = request.getParameter("top");
                int amount = Integer.parseInt(request.getParameter("amount"));
                int basePrice = baseList.get(base);
                int topPrice = topList.get(top);
                int cupcakePrice = basePrice+topPrice;

                shopList.add(new Cupcake(top,base,cupcakePrice,amount));

                request.setAttribute("basket",shopList);
                request.getRequestDispatcher("index.jsp").forward(request, response);

                break;
            }

            case "login": {
                String email = request.getParameter("email");
                String psw = request.getParameter("psw");
            }

            case "shopicon": {
                if (shopList.isEmpty()) {
                    request.setAttribute("basket", null);
                    request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                    break;
                }

                request.setAttribute("basket", shopList);
                request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);

                break;
            }

            //case "": {

        }
    }
}
