<%@page import="com.pojo.Profilepojo"%>
<%@page import="com.daoimpl.ProfileImpl"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="nav.css" rel="stylesheet">
</head>
<body>
<%
String email=(String)session.getAttribute("email");
ProfileImpl profileimpl=new ProfileImpl();
Profilepojo profilepojo = profileimpl.getProfileByEmail(email);
%>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<%@include file="message.jsp" %>
<div id="profile" class="card">
    <div class="card-body">
    <form action="updateprofile_servlet" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" name="name" value="<%=profilepojo.getName() %>" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contact</label>
    <input type="tel" name="contact" value="<%=profilepojo.getContact() %>" required="required" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">State</label>
    <select class="form-control" name="state" id="exampleFormControlSelect1">
    <option><%=profilepojo.getState() %></option>
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
    <input type="text" name="city" value="<%=profilepojo.getCity() %>" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter City">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Street</label>
    <input type="text" name="street" value="<%=profilepojo.getStreet() %>" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter house no,Bulding name,street">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Pincode</label>
    <input type="number" name="pincode" value="<%=profilepojo.getPincode() %>" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter pincode">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Landmark</label>
    <input type="text" name="landmark" value="<%=profilepojo.getLandmark() %>" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Landmark">
  </div>
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" name="image" value="<%=profilepojo.getImage() %>" class="form-control-file" id="exampleFormControlFile1">
  </div>
  <button type="submit" class="btn nav-color text-white btn-block">Submit</button>
</form>
    
    </div>
    </div>
</div>
</div>
</div>
</body>
</html>