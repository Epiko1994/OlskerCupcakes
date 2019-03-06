<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <title>Olsker Cupcake Webshop</title>
    <link href="css/cupcake.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Optional JavaScript: jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">

    <img src="img/cupcakeBanner.png" alt="Logo" class="img-fluid"/>

    <div class="navbar">
        <a class="navbar-brand" href="#">
            <img src="img/cupcake.svg" width="30" height="30" class="d-inline-block align-top" alt="logo">
        </a>
        <a class="active" href="index.jsp">Shop</a>
        <a href="servlet">Kunder</a>
        <a href="orders.jsp">Ordrer</a>

        <!-- Login popup -->
        <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

        <div id="id01" class="modal">

            <form class="modal-content animate" action="/action_page.php">

                <div class="container">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close"
                          title="Close Modal">&times;</span>

                    <label for="email"><b>Email</b></label>
                    <input type="text" placeholder="Enter Email" id="email" required>
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" id="psw" required>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                    <button type="submit">Login</button>
                    <button type="button" onclick="document.getElementById('id01').style.display='none'"
                            class="cancelbtn">Cancel
                    </button>
                </div>

            </form>

        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('id01');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>


        <a class="nav-link" href="shoppingBasket.jsp">
            <img src="img/shopping-basket.svg" width="30" height="30" class="d-inline-block align-top"
                 alt="logo">
        </a>

    </div>

    <div class="shopSelection">
        <h1>Velkommen ombord</h1>
        <h4>Øens bedste cupcakes. Vælg og bestil her:</h4>

        <div id="cupcakeselectionbox" class="row">

            <div class="col-sm-3 dropdown_box">
                <select name="bottom" class="form-control">
                    <option selected disabled>Vælg bund</option>
                    <option value="1">Chocolate</option>
                    <option value="2">Vanilla</option>
                    <option value="3">Nutmeg</option>
                    <option value="4">Pistacio</option>
                </select>
            </div>

            <div class="col-sm-3 dropdown_box">
                <select name="top" class="form-control">
                    <option selected disabled>Vælg top</option>
                    <option value="1">Chocolate</option>
                    <option value="2">Blueberry</option>
                    <option value="3">Rasberry</option>
                </select>
            </div>

            <div class="col-sm-3 dropdown_box">
                <select name="number" class="form-control">
                    <option selected disabled>Vælg antal</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>

            <div class="col-sm-3 dropdown_box">
                <input type="submit" name="selectcupcake" value="Læg i kurv" class="btn btn-success form-control"/>
            </div>

        </div>

    </div>
</div>

</body>
</html>