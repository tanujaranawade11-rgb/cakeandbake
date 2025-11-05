<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration/Login Form</title>
    <script src="https://kit.fontawesome.com/74366baee4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            max-height: 600px;
            margin: 100px auto;
            background: var(--black);
            padding: 20px;
            border-radius: 10px;
            box-shadow: var(--box-shadow);
        }

        .form-container h2 {
            color: var(--bg-color);
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 35px;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
        }

        .form-container label {
            font-size: 19px;
            margin-bottom: 0.5rem;
            color: var(--bg-color);
        }

        .form-container input {
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: var(--border);
            border-radius: 0.3rem;
        }

        .form-container button {
            background-color: var(--main-color);
            color: var(--bg-color);
            border: none;
            padding: 0.8rem;
            border-radius: 0.3rem;
            cursor: pointer;
            font-size: 1rem;
            width: 30%;
            margin-left: 190px;
            font-size: 19px;
            margin-bottom: 15px;
        }

        .form-container button:hover {
            background-color: var(--nav-color);
            letter-spacing: 0.1rem;

        }

        .form-container p {
            text-align: center;
            color: var(--bg-color);
            font-size: 15px;
        }

        .form-container a {
            color: var(--nav-color);
            text-decoration: none;
            font-weight: bold;
            font-size: 15px;

        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header class="header">
        <a href="" class="logo"><img src="images/logo.png" alt=""></a>
        <nav class="navbar">
            <a href="index.jsp">Home</a>
            <a href="index.jsp">Cakes</a>
            <a href="index.jsp">Customize Cakes</a>
            <a href="index.jsp">About Us</a>
            <a href="index.jsp">Contact Us</a>
        </nav>
        <div class="icons">
            <div class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
            <div class="cart-icon"><i class="fa-solid fa-cart-arrow-down"></i></div>
            <div class="menu-icon"><i class="fa-solid fa-bars"></i></div>
            <!-- <a href="registration.html">
                <div class="login-icon"><i class="fa-solid fa-user"></i></div>
            </a> -->
        </div>
        <div class="search-form">
            <input type="search" name="search" id="search-box" placeholder="search here...">
            <label for="search-box" class="fa-solid fa-magnifying-glass"></label>
        </div>
        <div class="cart-items-container">
            <!-- first item -->

            <div class="cart-item">
                <span class="fas fa-times"></span>
                <img src="brownie.webp" alt="">
                <div class="content">
                    <h1>brownie</h1>
                    <div class="price">rs99/-</div>
                </div>
            </div>

            <!-- second item -->
            <div class="cart-item">
                <span class="fas fa-times"></span>
                <img src="pcake.jpg" alt="">
                <div class="content">
                    <h1>pineapple Cake</h1>
                    <div class="price">rs300/-</div>
                </div>
            </div>

            <!-- third item -->
            <div class="cart-item">
                <span class="fas fa-times"></span>
                <img src="ccake.jpeg" alt="">
                <div class="content">
                    <h1>choclate Cake</h1>
                    <div class="price">rs450/-</div>
                </div>
            </div>

            <!-- fourth item -->
            <div class="cart-item">
                <span class="fas fa-times"></span>
                <img src="cball.jpg" alt="">
                <div class="content">
                    <h3>choclate balls</h3>
                    <div class="price">rs200/-</div>
                </div>
            </div>
            <a href="" class="btn">order now</a>
        </div>
    </header>
    </header>

    <div class="form-container">
    <%@include file="message.jsp" %>
        <h2>Login Here</h2>
        <form action="Login_servlet" method="POST">
            <label for="email"> Email</label>
            <input type="email" id="mno" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>

            <button type="submit">Login</button>
        </form>
        <p>Did not have backery in town account? <a href="register.jsp">Click Here</a></p>
    </div>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
    