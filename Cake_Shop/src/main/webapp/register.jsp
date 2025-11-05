<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <h2>Registration Form</h2>
        <form action="User_servlet" method="POST">
            <label for="name">First Name</label>
            <input type="text" id="fname" name="fname" placeholder="Enter your first name" required>

            <label for="name">Last Name</label>
            <input type="text" id="lname" name="lname" placeholder="Enter your last name" required>

            <label for="name">Mobile Number</label>
            <input type="tel" id="mno" name="mno" placeholder="Enter your mobile number" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>


            <button type="submit">Register</button>
        </form>
        <div class="redirect">
            <h5 class="redirect1">Already registered? <a href="login.jsp">Login here</a></h5>
        </div>
    </div>
    <script src="script.js"></script>

</body>

</html>
