<%@page import="com.pojo.Profilepojo"%>
<%@page import="com.daoimpl.ProfileImpl"%>
<%@page import="com.pojo.CustomizePojo"%>
<%@page import="com.daoimpl.CustomizeDaoimpl"%>
<%@page import="com.pojo.OrderPojo"%>
<%@page import="com.daoimpl.OrdersDaoimpl"%>
<%@page import="com.pojo.UserPojo"%>
<%@page import="com.daoimpl.UserDaoimpl"%>
<%@page import="com.pojo.CakePojo"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.CakeDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Cake Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    
    <style>
    	:root {
    --main-color: rgb(102, 67, 67);
    --nav-color: rgb(121, 87, 87);
    --bg-color: rgb(255, 240, 209);
    --black: rgb(59, 48, 48);
    --card-color: rgb(66, 36, 8);
    --theme: rgb(230, 201, 185);
    --border: .1rem solid var(--card-color);
    --box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    border: none;
    outline: none;
    text-decoration: none;
    text-transform: capitalize;
    font-family: overlock, sans-serif;
    transition: all 0.2s ease-in;
}

html {
    font-size: 62.5%;
    overflow-x: hidden;
}

body {
    background-color: var(--bg-color);
}

.sidebar {
    height: 100vh;
    width: 250px;
    position: fixed;
    background: var(--main-color);
    padding-top: 20px;
    transition: 0.3s;
    box-shadow: var(--box-shadow);
}

.sidebar h2 {
    text-align: center;
    color: var(--bg-color);
    font-size: 2.2rem;
}

.sidebar a {
    padding: 15px;
    display: block;
    color: var(--bg-color);
    font-size: 1.6rem;
    transition: 0.3s;
}

.sidebar a:hover {
    background: var(--nav-color);
}

.content {
    margin-left: 250px;
    padding: 20px;
    transition: 0.3s;
}

h1 {
    font-size: 3rem;
    color: var(--black);
}

.card {
    background-color: var(--theme);
    padding: 2rem;
    border-radius: 1rem;
    text-align: center;
    box-shadow: var(--box-shadow);
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: scale(1.05);
}

.card h5 {
    font-size: 2rem;
    color: var(--black);
}

.card p {
    font-size: 1.8rem;
    font-weight: bold;
    color: var(--card-color);
}
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js" defer></script>
   
</head>
<body>
<%@include file="modal.jsp" %>
<div class="sidebar">
        <h2 class="text-center text-white">Cake Admin</h2>
        <a href="admin.jsp"><i class="fa fa-dashboard"></i> Dashboard</a>
        <a href="admin.jsp?update=order"><i class="fa fa-user"></i>Orders</a>
        <a href="admin.jsp?update=user"><i class="fa fa-user"></i> All User</a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#categoryModal"><i class="fa fa-folder-plus"></i> Add Category</a>
        <a href="#"  data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa fa-box"></i> Add Cake</a>
        <a href="admin.jsp?update=cake"><i class="fa fa-edit"></i>All Cake</a>
        
    </div>
    <%
    OrdersDaoimpl ordersDaoimpl=new OrdersDaoimpl();
    String email=(String)session.getAttribute("email");
    List<OrderPojo> lo=ordersDaoimpl.getOrdersByEmail(email);
    String u=request.getParameter("update");
    if(u==null){
    %>
    <div class="content">
        <h1>Dashboard</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5>Total Orders</h5>
                    <p><%=ordersDaoimpl.totalOrders() %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5>Total Revenue</h5>
                    <p>₹ <%=ordersDaoimpl.totalRevenue() %></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5>Total Cakes Sold</h5>
                    <p><%=ordersDaoimpl.totalCakeSold() %></p>
                </div>
            </div>
        </div>
    </div>
    <%}
    else if(u.equals("cake")){
    	CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
        List<CakePojo> lc=cakeDaoimpl.getAllCake();
    	
    	%>
    <div class="content">
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Discount</th>
      <th scope="col">DPrice</th>
      <th scope="col">Category</th>
      <th scope="col">image</th>
            <th scope="col"></th>
      
            <th scope="col"></th>
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%for(CakePojo c:lc){ %>
    <tr>
      <th scope="row">1</th>
      <td><%=c.getName() %></td>
      <td>₹ <%=c.getPrice() %></td>
      <td><%=c.getDiscount() %> %</td>
      <td>₹ <%=c.getFprice() %></td>
      <td><%=c.getCategory() %></td>
      <td><img src="images/cake/<%=c.getImage()%>" height="70px" width="70px"></td>
     <td><a href="updateCake.jsp?cid=<%=c.getId()%>"><button class="btn btn-outline-success">Edit</button></a></td>
         <td><a href="DeleteCake_servlet?cid=<%=c.getId()%>"><button class="btn btn-outline-danger">Delete</button></a></td>
    
    </tr>
    <%} %>
    
  </tbody>
</table>
    </div>
    
    <%}else if(u.equals("order")){
    	
    	CustomizeDaoimpl customizeDaoimpl=new CustomizeDaoimpl();
    	
    	List<CustomizePojo> lcup=customizeDaoimpl.getAllCustomizeByEmail(email);
    	ProfileImpl profileImpl=new ProfileImpl();
    	Profilepojo profilepojo=profileImpl.getProfileByEmail(email);
    	
    	%>
    
     <div class="content">
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">price</th>
      <th scope="col">quantity</th>
      <th scope="col">Tprice</th>
      <th scope="col">Date</th>
      <th scope="col">Address</th>
      <th scope="col">Payment_id</th>
      
            
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%for(OrderPojo c:lo){ %>
    <tr>
      <th scope="row"><%=c.getId() %></th>
      <td><%=c.getPname() %></td>
      <td> <%=c.getPrice()%></td>
      <td><%=c.getQuantity()%></td>
      <td><%=c.getTprice() %></td>
      <td><%=c.getDate() %></td>
            <td><%=c.getAddress() %></td>
      
            <td><%=c.getPid() %></td>
      
    
    </tr>
    <%} %>
    
  </tbody>
</table>
    </div>
    
    
    
    <div class="content">
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">price</th>
      <th scope="col">quantity</th>
      <th scope="col">Tprice</th>
   <!--    <th scope="col">Date</th> -->
      <th scope="col">detail</th>
      <th scope="col">Address</th>
      
            
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%for(CustomizePojo c:lcup){ %>
    <tr>
      <th scope="row"><%=c.getId() %></th>
      <td>Customize cake</td>
      <td>1200</td>
      <td>1</td>
      <td>1200</td>
      <td><%=c.getDetail() %></td>
            <%-- <td><%=c.getAddress() %></td> --%>
      
            <td><%=profilepojo.getStreet() %></td>
      
    
    </tr>
    <%} %>
    
  </tbody>
</table>
    </div>
    
    
    
    <%}else{ 
    UserDaoimpl userDaoimpl=new UserDaoimpl();
    List<UserPojo> lup=userDaoimpl.getAllUser();
    %>
    
     <div class="content">
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Conatct No</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
      
            <th scope="col"></th>
      
            <th scope="col"></th>
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%for(UserPojo c:lup){ %>
    <tr>
      <th scope="row"><%=c.getUid() %></th>
      <td><%=c.getFname() %></td>
      <td> <%=c.getLname()%></td>
      <td><%=c.getConatct() %></td>
      <td><%=c.getEmail() %></td>
      <td><%=c.getPassword() %></td>
     <td><a href="updateUser.jsp?cid=<%=c.getUid()%>"><button class="btn btn-outline-success">Edit</button></a></td>
         <td><a href="DeleteUser_servlet?cid=<%=c.getUid()%>"><button class="btn btn-outline-danger">Delete</button></a></td>
    
    </tr>
    <%} %>
    
  </tbody>
</table>
    </div>
    <%} %>
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript">
   
    
    </script>
</body>
</html>
