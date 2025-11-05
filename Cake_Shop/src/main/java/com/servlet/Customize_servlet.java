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
import javax.servlet.http.Part;

import com.daoimpl.CustomizeDaoimpl;
import com.pojo.CustomizePojo;

/**
 * Servlet implementation class Customize_servlet
 */
@WebServlet("/Customize_servlet")
@MultipartConfig
public class Customize_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customize_servlet() {
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
		String name=request.getParameter("name");
		String contact=request.getParameter("mobile");
		String email=request.getParameter("email");
		String detail=request.getParameter("detail");
		Part image=request.getPart("image");
		
		String path=request.getRealPath("images")+File.separator+"customize"+File.separator+image.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos=new FileOutputStream(path);
		InputStream i=image.getInputStream();
		byte[] b=new byte[i.available()];
		i.read(b);
		fos.write(b);
		fos.close();
		
		CustomizeDaoimpl customizeDaoimpl=new CustomizeDaoimpl();
		CustomizePojo customizePojo=new CustomizePojo(name, contact, email, detail, image.getSubmittedFileName());
		if(customizeDaoimpl.addCustomize(customizePojo)) {
			response.sendRedirect("placeorder.jsp?cus=true");
		}
		else {
			response.sendRedirect("customized_form.jsp");
			
		}
	}

}
