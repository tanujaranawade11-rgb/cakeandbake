package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoimpl.CakeDaoimpl;

/**
 * Servlet implementation class DeleteCake_servlet
 */
@WebServlet("/DeleteCake_servlet")
public class DeleteCake_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCake_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
		HttpSession session=request.getSession();
		if(cakeDaoimpl.deleteCakeByID(cid)) {
			session.setAttribute("msg", "cake deleted successfully!!");
			response.sendRedirect("admin.jsp?update=true");
		}
		else {
			session.setAttribute("msg", "cake  not deleted successfully!!");

			response.sendRedirect("admin.jsp?update=true");
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
