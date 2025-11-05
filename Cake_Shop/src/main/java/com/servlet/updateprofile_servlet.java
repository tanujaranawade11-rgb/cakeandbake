package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.daoimpl.ProfileImpl;
import com.pojo.Profilepojo;

/**
 * Servlet implementation class updateprofile_servlet
 */
@WebServlet("/updateprofile_servlet")
@MultipartConfig
public class updateprofile_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateprofile_servlet() {
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
		String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String street = request.getParameter("street");
        String pincode = request.getParameter("pincode");
        String landmark = request.getParameter("landmark");
        Part image=request.getPart("image");
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		String path=request.getRealPath("images")+File.separator+image.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos=new FileOutputStream(path);
		InputStream i=image.getInputStream();
		byte[] b=new byte[i.available()];
		i.read(b);
		fos.write(b);
		fos.close();
		Profilepojo profilepojo=new Profilepojo(name, email, contact, state, city, street, pincode, landmark, image.getSubmittedFileName());
		ProfileImpl profileImpl=new ProfileImpl();
		if(profileImpl.updateProfileByEmail(profilepojo)) {
			session.setAttribute("msg","profile updated successfully!!");
			response.sendRedirect("profile.jsp");
		}
		else {
			session.setAttribute("msg","profile not updated successfully!!");
			response.sendRedirect("profile.jsp");
		}
	}

}
