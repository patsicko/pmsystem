package com.pms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import javax.swing.JOptionPane;

/**
 * Servlet implementation class UpdateProjectServlet
 */
public class UpdateProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjectServlet() {
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
		// TODO Auto-generated method stub
		int projectId = Integer.parseInt(request.getParameter("projectId"));
		String projectName=request.getParameter("projectName");
		String description=request.getParameter("description");
		String user=request.getParameter("user");
		String status=request.getParameter("status");
		
		ConnectDB db = new ConnectDB();
		db.dbConnection();
		UpdateProject proj = new UpdateProject();

		Updated updatedProj = new Updated(projectName,description,user,status,projectId);
		String msg= proj.updateProject(updatedProj);
		
		if(msg!=null) {
			
			 JOptionPane.showMessageDialog(null,msg);
			 response.sendRedirect("adminDashboard.jsp");
			 
		}
		
		

		
	}

}
