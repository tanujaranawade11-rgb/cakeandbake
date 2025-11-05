<%@page import="com.daoimpl.CustomizeDaoimpl"%>
<%@page import="com.pojo.CustomizePojo"%>
<%@page import="com.pojo.CartPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.CartDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        .accordion-button {
            background-color: #ff5200;
            color: white;
        }
        .accordion-button:active, .accordion-button:not(.collapsed) {
            background-color: #ff5200;
            color: white;
        }
        .accordion-button:focus {
            box-shadow: none;
            border: 1px solid #043d14;
        }
    </style>
</head>
<body>

<%
    String email = (String) session.getAttribute("email");
    CartDaoimpl cartDao = new CartDaoimpl();
    List<CartPojo> cartItems = cartDao.getCartByEmail(email);
    float totalPrice = cartDao.getTotalCartPriceByEmail(email) * 100; // Convert to paisa
	String cu=request.getParameter("cus");
    CustomizeDaoimpl customizeDaoimpl=new CustomizeDaoimpl();
%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="accordion" id="orderAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="orderSummaryHeading">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#orderSummary" aria-expanded="true" aria-controls="orderSummary">
                            <b style="font-size:20px;">Order Summary</b>
                        </button>
                    </h2>
                    <div id="orderSummary" class="accordion-collapse collapse show" aria-labelledby="orderSummaryHeading">
                        <div class="accordion-body">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Item Name</th>
                                        <th scope="col">Item Image</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%if(cu==null){ for (CartPojo item : cartItems) { %>
                                    <tr>
                                        <td><%= item.getName() %></td>
                                        <td><img src="images/<%= item.getImage() %>" style="min-width:145px; max-height:80px; max-width:150px;"></td>
                                        <td>&#8377; <%= item.getPrice() %></td>
                                        <td>
                                            <div class="text-center">
                                                <%= item.getQuantity() %>
                                            </div>
                                        </td>
                                        <td>&#8377; <%= item.getTprice() %></td>
                                        <td><a href="deleteCart_servlet?cid=<%= item.getCid() %>"><button class="btn btn-danger">Delete</button></a></td>
                                    </tr>
                                    <% }}else{ 
                                  		List<CustomizePojo> lcc=customizeDaoimpl.getAllCustomizeByEmail(email);
                                  		for(CustomizePojo c:lcc){
                                    %>
                                    
                                     <tr>
                                        <td>Customize Cake</td>
                                        <td><img src="images/customize/<%=c.getImage() %>" style="min-width:145px; max-height:80px; max-width:150px;"></td>
                                        <td>&#8377; 1200</td>
                                        <td>
                                            <div class="text-center">
                                                1
                                            </div>
                                        </td>
                                        <td>&#8377; 1200</td>
                                        <td><%=c.getDetail() %></td>
                                    </tr>
                                    
                                    
                                    <%} }%>
                                </tbody>
                            </table>
                            <%if(cu==null){ %>
                            <p style="text-align:right; font-size:20px; color:green;">Total Price: <b id="totalPriceDisplay">&#8377; <%= totalPrice / 100 %></b></p>
                        <%}else{
                        	totalPrice=120000;
                        	%>
                                                    <p style="text-align:right; font-size:20px; color:green;">Total Price: <b id="totalPriceDisplay">&#8377; 1200</b></p>
                        <%} %>
                        </div>
                    </div>
                </div>
                
                <!-- Checkout Button -->
                <button id="checkoutBtn" class="btn accordion-button btn-block mt-5">Checkout</button>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer bg-light text-center py-3">
    <p>&copy; 2025 Dummy Store. All Rights Reserved.</p>
</footer>

<script>
document.getElementById("checkoutBtn").addEventListener("click", function (e) {
    e.preventDefault();

    var totalAmount = <%= totalPrice %>; // Get total price from JSP
    var options = {
        "key": "rzp_test_5uPzGreHV3wiCs", // Replace with your Razorpay Test Key
        "amount": totalAmount, 
        "currency": "INR",
        "name": "Dummy Store",
        "description": "Order Payment",
        "image": "https://yourlogo.com/logo.png", // Optional: Your logo URL
        "handler": function (response) {
            alert("order placed suucessfully \n Payment Successful! Payment ID: " + response.razorpay_payment_id);

            // Redirect to order confirmation page with payment details
            window.location.href = "PlaceOrderServlet?payment_id=" + response.razorpay_payment_id + "&amount=" + (totalAmount / 100);
        },
        "prefill": {
            "email": "<%= email %>"
        },
        "theme": {
            "color": "#ff5200"
        }
    };

    var rzp1 = new Razorpay(options);
    rzp1.open();
});
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
