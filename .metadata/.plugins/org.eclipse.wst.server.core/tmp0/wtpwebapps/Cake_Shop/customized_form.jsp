<%@page import="com.pojo.Profilepojo"%>
<%@page import="com.daoimpl.ProfileImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customized Cake Order</title>
    <style>
        /* Your provided CSS */
        :root {
            --main-color: rgb(102, 67, 67);
            --nav-color: rgb(121, 87, 87);
            --bg-color: rgb(255, 240, 209);
            --black: rgb(59, 48, 48);
            --card-color: rgb(66, 36, 8);
            --theme: rgb(230, 201, 185);
            --border: .1rem solid var(--card-color);
            --box-shadow: (0 0 20px rgb(0, 0, 0));
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: inherit;
            border: none;
            outline: none;
            text-decoration: none;
            text-transform: capitalize;
            font-family: overlock;
            transition: all 0.2s ease-in;
            scroll-padding-top: 16vh;
        }

        html {
            font-size: 62.5%;
            overflow-x: hidden;
        }

        body {
            background-color: var(--bg-color);
        }

        section {
            padding: 2rem 3%;
        }

        .title {
            text-align: center;
            color: var(--card-color);
            text-transform: uppercase;
            padding: 2rem 0;
            font-size: 4rem;
            text-decoration: underline;
        }

        .title span {
            color: var(--nav-color);
        }

        .form-container {
            background-color: var(--theme);
            max-width: 50rem;
            margin: 2rem auto;
            padding: 2rem;
            border: var(--border);
            border-radius: 1rem;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-container h3 {
            color: var(--card-color);
            font-size: 3rem;
            margin-bottom: 2rem;
        }

        .form-container .input-box {
            margin-bottom: 2rem;
        }

        .form-container .input-box label {
            display: block;
            font-size: 1.6rem;
            color: var(--black);
            margin-bottom: 0.5rem;
        }

        .form-container .input-box input,
        .form-container .input-box textarea {
            width: 100%;
            padding: 1rem;
            font-size: 1.6rem;
            color: var(--black);
            background-color: var(--bg-color);
            border: var(--border);
            border-radius: 0.5rem;
        }

        .form-container .input-box textarea {
            height: 10rem;
            resize: none;
        }

        .form-container .btn {
            display: inline-block;
            background-color: var(--main-color);
            color: var(--bg-color);
            font-size: 1.8rem;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
            cursor: pointer;
            text-align: center;
            text-transform: uppercase;
            font-weight: bold;
        }

        .form-container .btn:hover {
            letter-spacing: 0.1rem;
            background-color: var(--nav-color);
        }
    </style>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
ProfileImpl profileImpl=new ProfileImpl();
Profilepojo profilepojo=profileImpl.getProfileByEmail(email);
%>
    <section>
        <h2 class="title">Order Your <span>Customized Cake</span></h2>
        <div class="form-container">
            <form id="cakeForm" action="Customize_servlet" method="post" enctype="multipart/form-data">
                <h3>Fill in the Details</h3>
                <div class="input-box">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%=profilepojo.getName() %>" placeholder="Enter your name" required>
                </div>
                <div class="input-box">
                    <label for="mobile">Mobile</label>
                    <input type="tel" id="mobile" value="<%=profilepojo.getContact() %>" name="mobile" placeholder="Enter your mobile number" pattern="[0-9]{10}" required>
                </div>
                <div class="input-box">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%=profilepojo.getEmail() %>" placeholder="Enter your email" required>
                </div>
                <div class="input-box">
                    <label for="details">Cake Details</label>
                    <textarea id="details" name="detail" placeholder="Write details about the cake (flavor, size, etc.)" required></textarea>
                </div>
                <div class="input-box">
                    <label for="cakeImage">Sample Image</label>
                    <input type="file" id="cakeImage" name="image" accept="image/*" required>
                </div>
                <button class="btn" type="submit">Place Order</button>
            </form>
        </div>
    </section>

    <!-- <script>
        document.addEventListener('DOMContentLoaded', () => {
            const isLoggedIn = true; // Replace with actual login check
            const form = document.getElementById('cakeForm');
            if (!isLoggedIn) {
                form.innerHTML = '<h3>Please log in to place an order</h3>';
            } else {
                form.addEventListener('submit', (e) => {
                    e.preventDefault();
                    alert('Order placed successfully!');
                });
            }
        });
    </script> -->
</body>
</html>
    