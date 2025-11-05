<%@page import="com.pojo.Profilepojo"%>
<%@page import="com.daoimpl.ProfileImpl"%>
<%@page import="com.pojo.CartPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.CartDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - Food Delivery</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <style>
        body { background-color: #fff0d1; font-family: 'Overlock', sans-serif; }
        .cart-header, .total-section { background-color: #e6c9b9; margin-top: 78px; padding: 8px; border-radius: 5px; box-shadow: 0 0 20px rgb(0, 0, 0); }
        .cart-item { border-bottom: 1px solid #423008; padding: 15px 0; display: flex; align-items: center; justify-content: space-between; }
        .checkout-btn { background-color: rgb(102, 67, 67); color: #fff0d1; border: none; width: 100%; padding: 10px; font-size: 1.2rem; border-radius: 5px; cursor: pointer; transition: 0.3s; }
        .checkout-btn:hover { background-color: rgb(121, 87, 87); }
    </style>
</head>
<body>

<%
    String email = (String) session.getAttribute("email");
    CartDaoimpl cartDaoimpl = new CartDaoimpl();
    List<CartPojo> lc = cartDaoimpl.getCartByEmail(email);
    float tprice = cartDaoimpl.getTotalCartPriceByEmail(email);
    float originalPrice = cartDaoimpl.getTotalOriginalCartPriceByEmail(email);
    float discount = originalPrice - tprice;
    ProfileImpl profileImpl = new ProfileImpl();
    Profilepojo p = profileImpl.getProfileByEmail(email);
%>

<div class="container my-4">
    <%@include file="nav.jsp" %>
    <%@include file="message.jsp" %>

    <div class="cart-header d-flex justify-content-between align-items-center">
        <h3>My Cart</h3>
        <a href="index.jsp" class="btn btn-outline-secondary">Continue Shopping</a>
    </div>

    <div class="cart-items my-3 container">
        <% for (CartPojo c : lc) { %>
        <div class="cart-item row align-items-center">
            <div class="col-md-2 col-3">
                <img src="images/cake/<%=c.getImage() %>" alt="" class="img-fluid rounded">
            </div>
            <div class="col-md-3 col-6">
                <h5><%=c.getName() %></h5>
                <p>₹<%=c.getPrice() %></p>
            </div>
            <div class="col-md-3 col-6">
                <a href="quantityDecrease_servlet?cid=<%=c.getCid()%>"><button class="btn btn-outline-secondary btn-sm">-</button></a>
                <span><%=c.getQuantity() %></span>
                <a href="quantityIncrease_servlet?cid=<%=c.getCid()%>"><button class="btn btn-outline-secondary btn-sm">+</button></a>
            </div>
            <div class="col-md-2 col-6">
                <p>₹<%=c.getTprice() %></p>
            </div>
            <div class="col-md-2 col-6 text-end">
                <a href="deleteCart_servlet?cid=<%=c.getCid()%>"><button class="btn btn-danger btn-sm">Remove</button></a>
            </div>
        </div>
        <% } %>
    </div>

    <div class="total-section mt-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5>Total</h5>
            <h5>₹<%= tprice %></h5>
        </div>

        <% if (p.getEmail() == null) { %>
            <button class="btn checkout-btn mt-3" data-toggle="modal" data-target="#errorModal">Proceed to Checkout</button>
        <% } else { %>
            <form action="placeorder.jsp" method="post">
                <input type="hidden" name="totalPrice" value="<%= tprice %>">
                <input type="hidden" name="originalPrice" value="<%= originalPrice %>">
                <input type="hidden" name="discount" value="<%= discount %>">
                <input type="hidden" name="email" value="<%= email %>">
                <button type="submit" class="btn checkout-btn mt-3">Proceed to Checkout</button>
            </form>
        <% } %>
    </div>
</div>

</body>
</html>
