package com.pms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import javax.swing.JOptionPane;

@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddProjectServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String projectName= request.getParameter("projectName");
		String description = request.getParameter("description");
		String user = request.getParameter("user");
		
		ConnectDB db = new ConnectDB();
		db.dbConnection();
		 
		 AddProject add = new AddProject();
		 
		 Project project1= new Project(projectName,description,user);
		 
		 String mssg= add.addProject(project1);
		 
		 if(mssg!=null) {
			 JOptionPane.showMessageDialog(null, "Project created successfully");	 
				response.sendRedirect("adminDashboard.jsp");
			}else {
				
				response.sendRedirect("adminDashboard.jsp");
			}
		
		 
		 
	}

}
