package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.UserDaoimpl;
import com.pojo.UserPojo;

/**
 * Servlet implementation class UpdateUser_servlet
 */
@WebServlet("/UpdateUser_servlet")
public class UpdateUser_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser_servlet() {
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
		int uid=Integer.parseInt(request.getParameter("uid"));
		UserDaoimpl userDaoimpl=new UserDaoimpl();
		HttpSession session=request.getSession();
		if(userDaoimpl.updateUserById(userPojo, uid)) {
			session.setAttribute("msg", "user updated successfully!!");
			response.sendRedirect("admin.jsp?update=user");
		}
		else {
			session.setAttribute("msg", "user not  updated successfully!!");
			response.sendRedirect("updateUser.jsp");
		}
	}

}
