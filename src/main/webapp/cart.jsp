<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.food.model.Cart, com.food.model.CartItem, com.food.model.User" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>Cart</title>

            <!--    Favicons-->
            <link rel="icon" type="image/png " sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
            <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
            <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicons/favicon.ico">
            <link rel="manifest" href="assets/images/favicons/manifest.json">
            <meta name="msapplication-TileImage" content="assets/images/favicons/mstile-150x150.png">

            <!-- Font Awesome -->
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">


            <!-- Bootstrap Scripts -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
                integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
                crossorigin="anonymous">

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
                integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
                crossorigin="anonymous"></script>

            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css"
                rel="stylesheet">


            <!--    Stylesheets-->
            <link
                href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap"
                rel="stylesheet">

            <link href="assets/css/cart.css" type="text/css" rel="stylesheet">
            <link href="assets/css/theme.css" rel="stylesheet" />


        </head>

        <body>

            <main class="main" id="top">
                <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"
                    data-navbar-on-scroll="data-navbar-on-scroll">
                    <div class="container"><a class="navbar-brand d-inline-flex" href="#"><img class="d-inline-block"
                                src="assets/images/gallery/logo.svg" alt="logo" /><span
                                class="text-1000 fs-3 fw-bold ms-2 text-gradient">GastroGrid</span></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon">
                            </span></button>
                        <form class="d-flex mt-4 mt-lg-0 ms-lg-auto ms-xl-0">
                            <a href="#"><button class="btn btn-white text-warning" type="button"><i
                                        class="fa-solid fa-house me-2"></i>Home</button></a>
                            <a href="cart.jsp"><button class="btn btn-white text-warning" type="button"><i
                                        class="fa-solid fa-cart-shopping me-2"></i>Cart</button></a>
                            <% 
                            	if (session !=null) { 
                            		User user=(User) session.getAttribute("user"); 
                            		if(user !=null){ 
                            %>
                                <div class="dropdown">
                                    <button class="btn btn-white text-warning text-uppercase" type="button"
                                        data-toggle="dropdown">
                                        <i class="fas fa-user me-2"></i>
                                        <%= user.getUsername() %>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Edit Profile</a></li>
                                        <li><a class="dropdown-item" href="#">View Orders</a></li>
                                        <li><a class="dropdown-item"
                                                href="<%= request.getContextPath() %>/logout">Logout</a></li>
                                    </ul>
                                </div>
                                <% }
                            		else{ 
                            	%>
                                    <a href="login.jsp"><button class="btn btn-white text-warning" type="button"> 
                                    	<i class="fas fa-user me-2"></i>Login</button></a>
                                 <% } 
                            		} else { 
                            	%>
                                        <a href="login.jsp"><button class="btn btn-white text-warning" type="button"> 
                                        	<i class="fas fa-user me-2"></i>Login</button></a>
                                 <% 
                                 	} 
                                 %>
                        </form>
                    </div>
                </nav>
            </main>

            <!-- Cart Section -->
            <section>
                <div class="container-fluid mt-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <b> My Cart Detail </b>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive-lg">
                                            <table class="table v-set">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">No</th>
                                                        <th scope="col">Product</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Subtotal</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% 
                                                    	Cart cart=(Cart) session.getAttribute("cart"); 
                                                    	double totalAmount=0; 
                                                    	if(cart!=null && !cart.getItems().isEmpty()){ 
                                                    		int index=1; 
                                                    		for(CartItem item : cart.getItems().values()){ 
                                                    			double subtotal=item.getQuantity() * item.getPrice(); 
                                                    			totalAmount += subtotal; 
                                                   	%>

                                                        <tr>
                                                            <th scope="row">
                                                                <%= index++ %>
                                                            </th>
                                                            <td>
                                                                <img src="assets/images/gallery/menus/<%= item.getImagePath() %>"
                                                                    class="box-image-set-2">
                                                            </td>
                                                            <td>
                                                                <%= item.getName() %>
                                                            </td>

                                                            <td>
                                                                <%= item.getPrice() %>
                                                            </td>
                                                            <td>
                                                                <%= subtotal %>
                                                            </td>
                                                            <td>
                                                                <form action="cart" method="post">
                                                                    <input type="hidden" name="itemId"
                                                                        value="<%= item.getItemId() %>">
                                                                    <input type="number" name="quantity"
                                                                        value="<%= item.getQuantity() %>" min="1">
                                                            </td>
                                                            <td>
                                                                <input type="hidden" name="itemId"
                                                                    value="<%= item.getItemId() %>">

                                                                <button type="submit" name="action" value="update"
                                                                    class="btn btn-sm btn-success"
                                                                    style="background-color:#14A44D">
                                                                    <span><i class="fas fa-sync"></i></span>
                                                                    <span>Update</span>
                                                                </button>

                                                                <button type="submit" name="action" value="remove"
                                                                    class="btn btn-sm btn-danger">
                                                                    <span><i class="far fa-trash-alt"></i></span>
                                                                    <span>Remove</span>
                                                                </button>
                                                                </form>
                                                            </td>
                                                        </tr>

                                                        <% } }else{ %>
                                                        
                                                            <tr>
                                                                <td colspan="7">
                                                                    <div>
                                                                        <b>Your cart is Empty</b>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                        <% } %>

                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <td colspan="7"><b> Total Amount: <%= totalAmount %> </b> </td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                            
                                            <% if(session.getAttribute("cart") !=null) { %>
                                            
                                                <!-- Add more Item Buttons and Checkout -->
                                                <div class="d-flex justify-content-between mt-3">
                                                    <a href="menu?restaurantID=<%= session.getAttribute(" restaurantId")%>">
                                                        <button class="btn btn-sm btn-success"
                                                            style="background-color:#14A44D">
                                                            <span>Add More Items</span>
                                                        </button>
                                                    </a>

                                                    <form action="checkout.jsp" method="post">
                                                        <button type="submit" value="Proceed to Checkout"
                                                            class="btn btn-sm btn-primary">
                                                            <span>Proceed to Checkout</span>
                                                        </button>
                                                    </form>
                                                </div>
                                                <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="py-0 pt-7 bg-1000">

                <div class="container">
                    <div class="row justify-content-lg-between">
                        <h5 class="lh-lg fw-bold text-white">OUR TOP CITIES</h5>
                        <div class="col-6 col-md-4 col-lg-auto mb-3">
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Mumbai</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Delhi</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Banglore</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Gao</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Nasik</a></li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-auto mb-3">
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Amravati</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Rajstan</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Navi Mumbai</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Punjab</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Hydrabad</a></li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-auto mb-3">
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Pune</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Satara</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Kolhapur</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Baramati</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Sangli</a></li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-auto mb-3">
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Chennai</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Laknaow</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">West Gao</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Lahor</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Nagpur</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-auto mb-3">
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Sambhaji Nagar</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Solapur</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Akola</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Thane</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Ratnagiri</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr class="text-900" />
                    <div class="row">
                        <div class="col-6 col-md-4 col-lg-4 col-xxl-2 mb-3">
                            <h5 class="lh-lg fw-bold text-white">COMPANY</h5>
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">About Us</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Team</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Careers</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">blog</a></li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-4 col-xxl-2 col-lg-3 mb-3">
                            <h5 class="lh-lg fw-bold text-white">CONTACT</h5>
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Help &amp;
                                        Support</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Partner with us
                                    </a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Ride with us</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-6 col-md-4 col-lg-4 col-xxl-2 mb-3">
                            <h5 class="lh-lg fw-bold text-white">LEGAL</h5>
                            <ul class="list-unstyled mb-md-4 mb-lg-0">
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Terms &amp;
                                        Conditions</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Refund &amp;
                                        Cancellation</a></li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Privacy Policy</a>
                                </li>
                                <li class="lh-lg"><a class="text-200 text-decoration-none" href="#!">Cookie Policy</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-12 col-md-8 col-lg-6 col-xxl-4">
                            <h3 class="text-500 my-4">Receive exclusive offers and <br />discounts in your mailbox</h3>
                            <form action="https://sheetdb.io/api/v1/k0ynnxw0yqul2" method="POST" id="sheetdb-form">
                                <div class="row input-group-icon mb-5">
                                    <div class="col-auto"><i class="fas fa-envelope input-box-icon text-500 ms-3"></i>
                                        <input class="form-control input-box bg-800 border-0" type="email"
                                            placeholder="Enter Email" aria-label="email" name="data[Email]" />
                                    </div>
                                    <div class="col-auto">
                                        <button class="btn btn-primary" type="submit">Subscribe</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="row flex-center">
                            <div class="text-center my-3">
                                <a href="#"><i class="fa-brands fa-facebook fa-lg"
                                        style="color: #74C0FC; padding:8px;"></i></a>
                                <a href="#"><i class="fa-brands fa-twitter fa-lg"
                                        style="color: #74C0FC; padding:8px;"></i></a>
                                <a href="https://www.instagram.com/_akshaybarge_/" target="_blank"><i
                                        class="social-icon fab fa-instagram fa-lg"
                                        style="color: #74C0FC; padding:8px;"></i></a>
                                <a href="https://www.linkedin.com/in/akshaybarge315/"><i
                                        class="social-icon fab fa-linkedin-in fa-lg"
                                        style="color: #74C0FC; padding:8px;"></i></a>
                            </div>
                        </div>
                    </div>
                    <hr class="border border-800" />
                    <div class="row flex-center pb-3">
                        <div class="col-md-6 order-0">
                            <p class="text-200 text-center text-md-center">All rights Reserved &copy; GastroGrid, 2024
                            </p>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->

            <script src="assets/js/emailSubscription.js"></script>

            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>