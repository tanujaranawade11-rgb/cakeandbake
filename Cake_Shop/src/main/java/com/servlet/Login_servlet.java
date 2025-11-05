package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.UserDaoimpl;

/**
 * Servlet implementation class Login_servlet
 */
@WebServlet("/Login_servlet")
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,}$"; // At least 6 characters, one digit, one lower & one upper case

		HttpSession session = request.getSession();

		if (!email.matches(emailRegex)) {
		    session.setAttribute("msg", "Invalid email format!");
		    response.sendRedirect("login.jsp");
		} else if (!password.matches(passwordRegex)) {
		    session.setAttribute("msg", "Password must contain at least 6 characters, including a digit, a lowercase and an uppercase letter.");
		    response.sendRedirect("login.jsp");
		} else {
		    UserDaoimpl userDaoimpl = new UserDaoimpl();
		    if (userDaoimpl.login(email, password)) {
		        session.setAttribute("email", email);
		        session.setAttribute("msg", "Login successfully!");
		        response.sendRedirect("index.jsp");
		    } else {
		        session.setAttribute("msg", "Invalid credentials!");
		        response.sendRedirect("login.jsp");
		    }
		}

	}

}
