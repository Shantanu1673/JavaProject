package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

import com.dao.ViewerDao;
import com.model.Viewer;

/**
 * Servlet implementation class ViewerController
 */
@WebServlet("/ViewerController")
public class ViewerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		 String action = request.getParameter("action");
		 if(action.equalsIgnoreCase("Register"))
		 {
			 Viewer vmodel=new Viewer();
			 vmodel.setUsername(request.getParameter("username"));
			 vmodel.setEmail(request.getParameter("email"));
			 vmodel.setPassword(request.getParameter("password"));
			 
			 int x = new ViewerDao().ViewerRegisteration(vmodel);
			 if(x>0)
			 {
				 response.sendRedirect("Login.jsp");
			 }
			 else
			 {
				 response.sendRedirect("Register.jsp");
			 }
			 
			 
		 }
		 else if(action.equalsIgnoreCase("Login"))
		 {
			 Viewer lmodel=new Viewer();
			 
			 lmodel.setEmail(request.getParameter("email"));
			 lmodel.setPassword(request.getParameter("password"));
			 
			 Viewer model = new ViewerDao().ViewerLogin(lmodel);
			 if(model != null)
			 {
				 HttpSession session = request.getSession();
			        session.setAttribute("viewer", model);
			        response.sendRedirect("Index.jsp");
			 }
			 else
			 {
				 request.setAttribute("msg", "Invalid email or password!");
			        request.getRequestDispatcher("Login.jsp").forward(request, response);
			 }
			 
			 
		 }
	}

}
