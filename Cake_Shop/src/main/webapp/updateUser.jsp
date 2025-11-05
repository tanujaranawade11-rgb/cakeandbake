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
        <form action="UpdateUser_servlet?uid=<%=cid %>" method="POST">
            <label for="name">First Name</label>
            <input type="text" id="fname" value="<%=userPojo.getFname() %>" name="fname" placeholder="Enter your first name" required>

            <label for="name">Last Name</label>
            <input type="text" id="lname" name="lname" value="<%=userPojo.getLname() %>" placeholder="Enter your last name" required>

            <label for="name">Mobile Number</label>
            <input type="tel" id="mno" name="mno" value="<%=userPojo.getConatct() %>" placeholder="Enter your mobile number" required>

            <label for="email">Email</label>
            <input type="email" id="email" value="<%=userPojo.getEmail() %>" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" value="<%=userPojo.getPassword() %>" name="password" placeholder="Enter your password" required>


            <button type="submit">Update</button>
        </form>
        
    </div>


</body>
</html>