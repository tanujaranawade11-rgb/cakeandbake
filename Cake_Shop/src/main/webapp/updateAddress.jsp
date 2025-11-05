<%@page import="com.daoimpl.UserDaoimpl"%>
<%@page import="com.pojo.UserPojo"%>
<%@page import="com.pojo.CakePojo"%>
<%@page import="com.daoimpl.CakeDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Cake</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/74366baee4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">

    <title>Registration Form</title>
    <style>
        :root {
            --main-color: rgb(102, 67, 67);
            --nav-color: rgb(121, 87, 87);
            --bg-color: rgb(255, 240, 209);
            --black: rgb(59, 48, 48);
            --card-color: rgb(66, 36, 8);
            --theme: rgb(230, 201, 185);
            --border: 0.1rem solid var(--card-color);
            --box-shadow: 0 0 20px rgb(0, 0, 0);

        }

        body {
            font-family: overlock;
            background-color: var(--bg-color);
            margin: 0;
            padding: 0;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            margin: 100px auto;
            background: var(--black);
            padding: 20px;
            border-radius: 10px;
            box-shadow: var(--box-shadow);
        }

        .form-container h2 {
            text-align: center;
            color: var(--bg-color);
            margin-bottom: 20px;
            font-size: 35px;
        }

        .form-container label {
            display: block;
            color: var(--bg-color);
            margin: 15px 0 5px;
            font-size: 19px;
        }

        .form-container input {
            width: 90%;
            padding: 10px;
            margin-bottom: 5px;
            border: var(--border);
            border-radius: 5px;
            padding-left: 30px;
        }

        .form-container button {
            margin-left: 190px;
            width: 30%;
            text-align: center;
            font-size: 17px;
            padding: 10px;
            background: var(--main-color);
            color: var(--bg-color);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .form-container button:hover {
            background: var(--nav-color);
            letter-spacing: 0.1rem;

        }

        .form-container .redirect {
            text-align: center;
            margin-top: 10px;
            font-size: 18px;
        }
        .form-container .redirect1 {
            text-align: center;
            margin-top: 10px;
            font-size: 18px;
            color: var(--nav-color);
        }

        .form-container .redirect a {
            color: var(--bg-color);
            text-decoration: none;
        }

        .form-container .redirect a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
int cid=Integer.parseInt(request .getParameter("cid"));
UserDaoimpl userDaoimpl=new UserDaoimpl();
UserPojo userPojo=userDaoimpl.getUserById(cid);
%>



 <div class="form-container">
 <%@include file="message.jsp" %>
        <h2>Edit User</h2>
        <form action="UpdateAddress_servlet?aid=<%= %>" method="POST">
               <label for="exampleFormControlSelect1">State</label>
    <select class="form-control" name="state" id="exampleFormControlSelect1">
    <option></option>
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


               <label for="exampleInputEmail1">City</label>
    <input type="text" name="city" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter City">

             <label for="exampleInputEmail1">Street</label>
    <input type="text" name="street" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter house no,Bulding name,street">


    <label for="exampleInputEmail1">Pincode</label>
    <input type="number" name="pincode" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter pincode">

              <label for="exampleInputEmail1">Landmark</label>
    <input type="text" name="landmark" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Landmark">
          


            <button type="submit">Update</button>
        </form>
        
    </div>


</body>
</html>