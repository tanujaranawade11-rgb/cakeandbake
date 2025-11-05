package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daoimpl.UserDaoimpl;
import com.pojo.UserPojo;

/**
 * Servlet implementation class User_servlet
 */
@WebServlet("/User_servlet")
public class User_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_servlet() {
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
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String contact=request.getParameter("mno");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	UserPojo userPojo=new UserPojo(fname, lname, contact, email, password);
	UserDaoimpl userDaoimpl=new UserDaoimpl();
	if(userDaoimpl.register(userPojo)) {
		response.sendRedirect("login.jsp");
	}
	else {
		response.sendRedirect("register.jsp");
	}
	
	
	
	}

}
