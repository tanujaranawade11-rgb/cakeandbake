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
 * Servlet implementation class DeleteUser_servlet
 */
@WebServlet("/DeleteUser_servlet")
public class DeleteUser_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("cid"));
		UserDaoimpl userDaoimpl=new UserDaoimpl();
		HttpSession session=request.getSession();
		if(userDaoimpl.deleteUserById(uid)) {
			session.setAttribute("msg", "user deleted successfully!!");
			response.sendRedirect("admin.jsp?update=user");
		}
		else {
			session.setAttribute("msg", "user deleted successfully!!");
			response.sendRedirect("admin.jsp?update=user");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
