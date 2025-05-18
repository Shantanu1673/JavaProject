package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.dao.AdminDao;

import com.model.Admin;
import com.model.NewAnime;
import com.model.NewEpisode;


@WebServlet("/AdminController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512,
maxFileSize = 1024 * 1024 * 1024,
maxRequestSize = 1024 * 1024 * 1024)
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }
     private String extractfilename(Part file) {
    	 String cd= file.getHeader("content-disposition");
    	 System.out.println(cd);
    	 String[] items = cd.split(";");
    	 for(String string : items)
    	 {
    		 if(string.trim().startsWith("filename"))
    		 {
    			 return string.substring(string.indexOf("=")+2,string.length()-1);
    		 }
    	 }
    	 return " ";
     }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String action = request.getParameter("action");
		 if(action.equalsIgnoreCase("Login"))
		 {
			 Admin almodel=new Admin();
			 
			 almodel.setUsername(request.getParameter("username"));
			 almodel.setPassword(request.getParameter("password"));
			 
			 Admin amodel = new AdminDao().AdminLogin(almodel);
			 if(amodel != null)
			 {
				 HttpSession session = request.getSession();
			        session.setAttribute("admin", amodel);
			        response.sendRedirect("Admin/dashboard.jsp");
			 }
			 else
			 {
				 request.setAttribute("msg", "Invalid email or password!");
			        request.getRequestDispatcher("Admin/index.jsp").forward(request, response);
			 }
		 }
		 else if(action.equalsIgnoreCase("addanime"))
		 {
			 String savePath="D:\\eclipse-workspce\\anime\\src\\main\\webapp\\anime-images";
			 File fileSaveDir= new File(savePath);
			 if(!fileSaveDir.exists())
			 {
				 fileSaveDir.mkdir();
			 }
			 
			 Part file= request.getPart("image");
			 String fileName=extractfilename(file);
			 file.write(savePath+File.separator+fileName);
			 
			 NewAnime nm= new NewAnime();
			 nm.setAnimename(request.getParameter("animename"));
			 
			 nm.setImage(fileName);
			 nm.setDescription(request.getParameter("description"));
			 
			 int x= new AdminDao().addAnime(nm);
			 if(x>0)
			 {
				 response.sendRedirect("Admin/dashboard.jsp");
			 }
			 else
			 {
				 response.sendRedirect("Admin/AddAnime.jsp"); 
			 }
			 
		 }
		 else if(action.equalsIgnoreCase("addepisode"))
		 {
			 String savePath="D:\\eclipse-workspce\\anime\\src\\main\\webapp\\anime-video";
			 File fileSaveDir= new File(savePath);
			 if(!fileSaveDir.exists())
			 {
				 fileSaveDir.mkdir();
			 }
			 
			 Part file= request.getPart("video");
			 String videofileName=this.extractfilename(file);
			  if (videofileName.endsWith(".mp4") || videofileName.endsWith(".mkv") || videofileName.endsWith(".avi") || videofileName.endsWith(".mov"))
			  {
	                file.write(savePath + File.separator + videofileName);
	            }
			 
			 NewEpisode nae= new NewEpisode();
			 nae.setAnimeid(Integer.parseInt(request.getParameter("animeid")));
			 
			 nae.setVideo(videofileName);
			 nae.setEpisodeno(Integer.parseInt(request.getParameter("episodeno")));
			 
			 int z= new AdminDao().addepisode(nae);
			 if(z>0)
			 {
				 response.sendRedirect("Admin/dashboard.jsp");
			 }
			 else
			 {
				 response.sendRedirect("Admin/AddEpisode.jsp"); 
			 }
			 
		 }
	}

}
