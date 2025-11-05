<%@page import="com.daoimpl.UserDaoimpl"%>
<%@page import="com.daoimpl.ProfileImpl"%>
<%@page import="com.pojo.Profilepojo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Page - Online Food Delivery</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="style.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background-color: #f7f7f7;
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .profile-header {
      display: flex;
      align-items: center;
      gap: 20px;
      border-bottom: 2px solid #ddd;
      padding-bottom: 20px;
      margin-bottom: 20px;
    }

    .profile-header img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 3px solid #f56a6a;
      object-fit: cover;
    }

    .profile-header .user-info {
      flex: 1;
    }

    .profile-header .user-info h2 {
      font-size: 24px;
      margin-bottom: 8px;
    }

    .profile-header .user-info p {
      color: #777;
    }

    .tabs {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
      border-bottom: 2px solid #ddd;
      padding-bottom: 10px;
    }

    .tabs button {
      background-color: transparent;
      border: none;
      font-size: 16px;
      color: #333;
      cursor: pointer;
      padding: 10px;
      border-bottom: 2px solid transparent;
      transition: all 0.3s;
    }

    .tabs button.active {
      color: #f56a6a;
      border-bottom: 2px solid #f56a6a;
    }

    .tab-content {
      display: none;
    }

    .tab-content.active {
      display: block;
    }

    .order-history,
    .address-book,
    .settings {
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background-color: #f9f9f9;
    }

    .order-history ul,
    .address-book ul {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .order-history ul li,
    .address-book ul li {
      padding: 10px 0;
      border-bottom: 1px solid #ddd;
    }

    .order-history ul li:last-child,
    .address-book ul li:last-child {
      border-bottom: none;
    }

    .settings label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }

    .settings input[type="text"],
    .settings input[type="email"],
    .settings input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .settings button {
      background-color: #f56a6a;
      color: #fff;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      border-radius: 4px;
      transition: background-color 0.3s;
    }

    .settings button:hover {
      background-color: #e55555;
    }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<%@include file="nav.jsp" %>
<%
String email12=(String)session.getAttribute("email");
ProfileImpl profileimpl=new ProfileImpl();
Profilepojo lp=profileimpl.getProfileByEmail(email12);
UserDaoimpl userDaoimpl12=new UserDaoimpl();
String username12=userDaoimpl12.getUsernameByEmail(email12);
/* Userimpl userimpl12=new Userimpl();
String username12=userimpl12.getUsernameByEmail(email12);
Profileimpl profileimpl=new Profileimpl();
Profilepojo lp=profileimpl.getProfileByEmail(email12);
String add=request.getParameter("add");
Orderimpl orderimpl=new Orderimpl();
List<OrderPojo> lo=orderimpl.getOrderByEmail(email12);
System.out.println(lp.getCity()); */
%>
  <div class="container" style="margin-top: 100px">
    <!-- Profile Header -->
    <%@include file="message.jsp" %>
    <%
    if(lp.getEmail()==null){
    %>
    <div class="row">
    <div class="col-md-5">
    <div class="text-center">
    <h4> Welcome <b><%=username12 %></b></h4>
    <button onclick="toggle()" style="background-color:#ff5200;color: white;padding: 5px 30px;font-size: 20px;font-weight: 900;border:1px solid white;border-radius:7px; ">Add Profile</button>
    </div>
    </div>
    <div class="col-md-7">
    <h4 id="message">Profile has not been added</h4>
    
    <div id="profile" class="card" style="display: none;">
    <div class="card-body">
    <form action="Addprofile_servlet" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" name="name" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contact</label>
    <input type="tel" name="contact" required="required" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">State</label>
    <select class="form-control" name="state" id="exampleFormControlSelect1">
    <option>select state</option>
       <option value="Andhra Pradesh">Andhra Pradesh</option>
            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
            <option value="Assam">Assam</option>
            <option value="Bihar">Bihar</option>
            <option value="Chhattisgarh">Chhattisgarh</option>
            <option value="Goa">Goa</option>
            <option value="Gujarat">Gujarat</option>
            <option value="Haryana">Haryana</option>
            <option value="Himachal Pradesh">Himachal Pradesh</option>
            <option value="Jharkhand">Jharkhand</option>
            <option value="Karnataka">Karnataka</option>
            <option value="Kerala">Kerala</option>
            <option value="Madhya Pradesh">Madhya Pradesh</option>
            <option value="Maharashtra">Maharashtra</option>
            <option value="Manipur">Manipur</option>
            <option value="Meghalaya">Meghalaya</option>
            <option value="Mizoram">Mizoram</option>
            <option value="Nagaland">Nagaland</option>
            <option value="Odisha">Odisha</option>
            <option value="Punjab">Punjab</option>
            <option value="Rajasthan">Rajasthan</option>
            <option value="Sikkim">Sikkim</option>
            <option value="Tamil Nadu">Tamil Nadu</option>
            <option value="Telangana">Telangana</option>
            <option value="Tripura">Tripura</option>
            <option value="Uttar Pradesh">Uttar Pradesh</option>
            <option value="Uttarakhand">Uttarakhand</option>
            <option value="West Bengal">West Bengal</option>
            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
            <option value="Chandigarh">Chandigarh</option>
            <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
            <option value="Lakshadweep">Lakshadweep</option>
            <option value="Delhi">Delhi</option>
            <option value="Puducherry">Puducherry</option>
       
    </select>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">City</label>
    <input type="text" name="city" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter City">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Street</label>
    <input type="text" name="street" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter house no,Bulding name,street">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Pincode</label>
    <input type="number" name="pincode" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter pincode">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Landmark</label>
    <input type="text" name="landmark" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Landmark">
  </div>
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" name="image" class="form-control-file" id="exampleFormControlFile1">
  </div>
  <button type="submit" class="btn nav-color text-white btn-block">Submit</button>
</form>
    
    </div>
    </div>
    </div>
    </div>
    
    <%}else{ 
    
    %>
    <div class="profile-header">
      <img src="images/<%=lp.getImage() %>" alt="User Profile Picture">
     
      <div class="user-info">
        <h2><%=lp.getName()%></h2>
        <p>Email:<%=lp.getEmail()%></p>
        <p>Phone: +<%=lp.getContact() %></p>
      </div>
      <div>
     <a href="editprofile.jsp"> <button class="btn nav-color px-5 text-white">edit</button></a>
      </div>
    </div>

    <!-- Tabs -->
    <div class="tabs">
      <button class="tab-btn active" onclick="switchTab('order-history')">Order History</button>
      <button class="tab-btn" onclick="switchTab('address-book')">Address Book</button>
      <button class="tab-btn" onclick="switchTab('settings')">Account Settings</button>
    </div>

    <!-- Tab Content -->
    <div id="order-history" class="tab-content active">
      <div class="order-history">
        <h3>Your Recent Orders</h3>
        <table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total-Price</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
  <%-- <%for(OrderPojo o:lo){ %>
    <tr>
      <td><%=o.getId() %></td>
      <td><%=o.getName() %></td>
      <td><%=o.getPrice() %></td>
      <td><%=o.getQuantity() %></td>
      <td><%=o.getTprice() %></td>
      <td><%=o.getDate() %></td>
      <td><%=o.getStatus() %></td>
    </tr>
    <%} %> --%>
   
  </tbody>
</table>
      </div>
    </div>

    <div id="address-book" class="tab-content ">
      <div class="address-book d-flex">
      <div style="width: 60%">
        <h3>Saved Addresses</h3>
        <ul id="address-list">
          <li class="address-item">
            <span><%=lp.getStreet() %>,<%=lp.getCity() %>,<%=lp.getPincode() %><%=lp.getState() %>  
           </span>
            <p>Landmark:-<b><%=lp.getLandmark() %></b></p>
            
           </div>
           <div style="width: 40%">
          <!-- <a href="updateAddress.jsp"><button class="btn btn-danger mx-5" >edit</button></a>
             <button class="btn btn-danger" >Delete</button> -->
           </div>
            <hr>
           
            <div class="address-actions">
              
             
            </div>
          </li>
         <%--  <%
          Addressimpl addressimpl=new Addressimpl();
          List<AddressPojo> la=addressimpl.getAddressByEmail(email12);
          %>
          <%if(!la.isEmpty()){ 
          	for(AddressPojo a:la){	
          						%> --%>
          <%-- <li class="address-item">
            <span><%=a.getAddress() %></span>
            <div class="address-actions">
              
              <a href="deleteAddress_servlet?aid=<%=a.getAid()%>"><button class="btn btn-danger text-white" style="width: 50%">Delete</button></a>
            </div>
          </li> --%>
         <%--  <%} }%>
          --%>
        </ul>
        
      </div>
      <div>
<!--                <a href="addAddress.jsp"> <button class="btn nav-color text-white" style="width: 100%" >Add New Address</button></a>
 -->                </div>

    </div>

    <div id="settings" class="tab-content">
      <div class="settings">
        <h3>Update Account Settings</h3>
        <form>
          <label for="name">Name</label>
          <input type="text" id="name" placeholder="Enter your name">
          <label for="email">Email</label>
          <input type="email" id="email" placeholder="Enter your email">
          <label for="password">Password</label>
          <input type="password" id="password" placeholder="Enter new password">
          <button type="submit">Save Changes</button>
        </form>
      </div>
    </div>
    <%} %>
  </div>

  <script>
  function toggle(){
	  $("#message").hide();
      $("#profile").show();
  }
    function switchTab(tabId) {
    	
    	if(tabId=="order-history"){
    		$("#order-history").show();
    		$("#address-book").hide();
    		$("#settings").hide();
    	}
    	else if(tabId=="settings"){
    		$("#order-history").hide();
    		$("#address-book").hide();
    		$("#settings").show();
    	}
    	else{
    		$("#order-history").hide();
    		$("#address-book").show();
    		$("#settings").hide();
    	}
      // Remove active class from all tabs and contents
      document.querySelectorAll('.tab-btn').forEach((btn) => btn.classList.remove('active'));
      document.querySelectorAll('.tab-content').forEach((content) => content.classList.remove('active'));

      // Add active class to selected tab and content
     /*  document.querySelector(`[onclick="switchTab('${tabId}')"]`).classList.add('active');
      document.getElementById(tabId).classList.add('active'); */
      
    }
  </script>
</body>
</html>
