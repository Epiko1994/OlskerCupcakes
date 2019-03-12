package controllers;

import mappers.BaseTopMapper;
import mappers.LoginMapper;
import mappers.OrderMapper;
import mappers.UserMapper;
import model.Cupcake;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

@SuppressWarnings("unchecked")
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

        LoginMapper loginMapper = new LoginMapper();

        UserMapper userMapper = new UserMapper();
        ArrayList<User> userList = new ArrayList<>();

        try {
            baseList = baseTopMapper.baseReader();
            topList = baseTopMapper.topReader();
            userList = userMapper.customerReader();
        } catch (Exception e) {
            e.printStackTrace(); //TODO: Print something
        }

        HashMap<String, User> userMap = userMapper.UserMap(userList);

        HttpSession session = request.getSession();

        String source = request.getParameter("source");

        if (shopList.isEmpty()) {
            shopList = new ArrayList<>();
        }

        switch (source) {

            case "addtocart": {
                if (request.getParameter("base") == null || request.getParameter("top") == null || request.getParameter("amount") == null) {
                    request.setAttribute("status", "ikke ok");
                    request.setAttribute("message", "Vælg venligst top, bund og antal");
                    request.getRequestDispatcher("/indexController").forward(request, response);
                    break;
                } else {

                    String base = request.getParameter("base");
                    String top = request.getParameter("top");
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    int basePrice = baseList.get(base);
                    int topPrice = topList.get(top);
                    int cupcakePrice = basePrice + topPrice;

                    shopList.add(new Cupcake(top, base, cupcakePrice, amount));

                    session.setAttribute("basket", shopList);
                    request.setAttribute("status", "ok");
                    request.setAttribute("message", amount + " stk " + base + " " + top + " tilføjet til kurv");
                    request.getRequestDispatcher("/indexController").forward(request, response);

                    break;
                }
            }

            case "login": {
                boolean login = false;

                String email = request.getParameter("email");
                String psw = request.getParameter("psw");
                try {
                    login = loginMapper.loginCheck(email, psw);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (login) {
                    //request.setAttribute("userData",userMap.get(email));
                    session.setAttribute("userData", userMap.get(email));
                    session.setAttribute("login", true);
                    request.setAttribute("status", "ok");
                    request.setAttribute("message", "Login gennemført");
                    request.getRequestDispatcher("/indexController").forward(request, response);
                    break;

                } else {
                    session.setAttribute("login", false);
                    request.setAttribute("status", "ikke ok");
                    request.setAttribute("message", "Brugeren kan ikke findes");
                    request.getRequestDispatcher("/indexController").forward(request, response);
                    break;
                }
            }

            //adds user to the database if it doesn't exist.
            case "create": {
                boolean login = false;
                String email = request.getParameter("email");
                String psw = request.getParameter("psw");
                try {
                    login = loginMapper.loginCheck(email, psw);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (login) {
                    //todo send en fejl videre
                    request.setAttribute("status", "ikke ok");
                    request.setAttribute("message", "Denne bruger findes allerede");
                    request.getRequestDispatcher("/indexController").forward(request, response);
                    break;

                } else {
                    User user = UserMapper.createUser(email, psw);
                    userList.add(user);
                    userMap.put(email, user);
                    session.setAttribute("userData", userMap.get(email));
                    session.setAttribute("login", true);
                    request.setAttribute("status", "ok");
                    request.setAttribute("message", "Bruger oprettet");
                    request.getRequestDispatcher("/indexController").forward(request, response);
                    break;
                }
            }
            case "logout": {
                if (!shopList.isEmpty()) {
                    shopList.clear();
                }
                session.invalidate();
                request.setAttribute("status", "ok");
                request.setAttribute("message", "Du er nu logget ud");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            }

            case "shopicon": {
                if (shopList.isEmpty()) {
                    session.setAttribute("basket", null);
                    request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                    break;
                }

                session.setAttribute("basket", shopList);
                request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                break;
            }

            case "order": {
                if (session.getAttribute("basket") != null) {
                    if (session.getAttribute("login") != null) {
                        if ((boolean) session.getAttribute("login")) {
                            OrderMapper orderMapper = new OrderMapper();
                            ArrayList<Cupcake> shopList = (ArrayList<Cupcake>) session.getAttribute("basket");
                            User user = (User) session.getAttribute("userData");
                            try {
                                orderMapper.insertOrder(user, shopList);
                            } catch (SQLException | ClassNotFoundException e) {
                                e.printStackTrace();
                            }
                            shopList.clear();
                            session.setAttribute("basket", shopList);
                            request.setAttribute("status", "ok");
                            request.setAttribute("message", "Bestilling gennemført");
                            userMap = userMapper.UserMap(userList);
                            session.setAttribute("userData", userMap.get(user.getEmail()));
                            request.getRequestDispatcher("/indexController").forward(request, response);
                            break;
                        } else {
                            request.setAttribute("status", "ikke ok");
                            request.setAttribute("message", "Bestilling ikke gennemført - log venligst ind for at bestille");
                            request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                            break;
                        }
                    }
                    request.setAttribute("status", "ikke ok");
                    request.setAttribute("message", "Bestilling ikke gennemført - log venligst ind for at bestille");
                    request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                    break;
                }
                request.setAttribute("status", "ikke ok");
                request.setAttribute("message", "Bestilling ikke gennemført - din kurv er tom!");
                request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                break;
            }

            case "deleteOrder": {
                int deleteNumber = Integer.parseInt(request.getParameter("orderRow"));
                shopList.remove(deleteNumber);
                request.setAttribute("basket", shopList);
                request.setAttribute("status", "ok");
                request.setAttribute("message", "Ordre fjernet");
                request.getRequestDispatcher("shoppingBasket.jsp").forward(request, response);
                break;
            }
            default: {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            }


        }
    }
}
