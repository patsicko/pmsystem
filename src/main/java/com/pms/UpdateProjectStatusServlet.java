package com.pms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import javax.swing.JOptionPane;

/**
 * Servlet implementation class UpdateProjectStatusServlet
 */
@WebServlet("/UpdateProjectStatusServlet")
public class UpdateProjectStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProjectStatusServlet() {
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
		  int projectId = Integer.parseInt(request.getParameter("projectId"));
	        String newStatus = request.getParameter("status");
	        
	        GetProjects projects = new GetProjects();
	        boolean success = projects.updateProjectStatus(projectId, newStatus);
	        
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        
	        if (success) {
	        
	            out.write("{\"message\": \"Project status updated successfully.\"}");
	           
	            
	            
	        } else {
	            out.write("{\"message\": \"Failed to update project status.\"}");
	        }


	}

}
