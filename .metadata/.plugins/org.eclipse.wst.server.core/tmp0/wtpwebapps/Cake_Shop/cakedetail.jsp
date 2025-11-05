<%@page import="com.pojo.CakePojo"%>
<%@page import="com.daoimpl.CakeDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Cake Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js" defer></script>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    
    <!-- <style>
    :root {
    --main-color: rgb(102, 67, 67);
    --nav-color: rgb(121, 87, 87);
    --bg-color: rgb(255, 240, 209);
    --black: rgb(59, 48, 48);
    --card-color: rgb(66, 36, 8);
    --theme: rgb(230, 201, 185);
    --border: .1rem solid var(var(--card-color));
    --box-shadow: (0 0 20px rgb(0, 0, 0));
}
    
        body {
            font-family: overlock;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
        }
        *{
    margin: 0;
    padding: 0;
    box-sizing: inherit;
    border: none;
    outline: none;
    text-decoration: none;
    text-transform: capitalize;
    /* font-family: Verdana, Geneva, Tahoma, sans-serif; */
    font-family: overlock;
    transition: all 0.2s ease-in;
    /* scroll-behavior: smooth; */
    scroll-padding-top: 16vh;
}
body{
    background-color: var(--bg-color);
}

        
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background: #ff6b6b;
            padding-top: 20px;
            transition: 0.3s;
        }
        .sidebar a {
            padding: 15px;
            display: block;
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #ff4f4f;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            transition: 0.3s;
        }
        .product-image {
            max-width: 100%;
            border-radius: 10px;
        }
        .card {
            transition: transform 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.05);
        }
        
    </style> -->
    
    <style type="text/css">
    .myrow{
    margin-top: 100px;
    
    }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>




    <%
    int cid=Integer.parseInt(request.getParameter("cid"));
    CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
    CakePojo cakePojo=cakeDaoimpl.getCakeById(cid);
    %>
    <div class="container">
        
        <div class="row  myrow">
            <div class="col-md-5">
                <img src="images/cake/<%=cakePojo.getImage() %>" alt="Cake Image" class="product-image" height="380px"><br>
                <a href="AddCart_servlet?pid=<%=cakePojo.getId()%>"><button class="btn btn-warning" style="width: 84%;height: 40px;font-size: 20px;font-weight: 900;color:white;">Add To Cart</button></a><br>
            	<button class="btn btn-warning" style="width: 84%;height: 40px;font-size: 20px;font-weight: 900;color:white; margin-top:5px;">Buy Now</button>
            </div>
            <div class="col-md-7 ">
                <h2><%=cakePojo.getName() %></h2>
                
                <p><strong>rs</strong><%=cakePojo.getPrice() %></p>
                <p><strong>Description:</strong><%=cakePojo.getDescription() %></p>
                
            <div>
        </div>
    </div>
    
        <script src="script.js"></script>
    
</body>
</html>
    