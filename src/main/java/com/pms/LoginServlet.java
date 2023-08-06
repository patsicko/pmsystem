package com.pms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
		/*
		 * request.setAttribute("email", email); request.setAttribute("password",
		 * password);
		 * 
		 * // Forward the request to landing.jsp
		 * request.getRequestDispatcher("landing.jsp").forward(request, response);
		 */
		/*
		 * HttpSession session = request.getSession(); session.setAttribute("userEmail",
		 * email); session.setAttribute("password", password);
		 */

	    ConnectDB db = new ConnectDB();
	    db.loadDriver();
	    db.dbConnection();

	    LogedUser user1 = new LogedUser(email, password);
	    Login login = new Login();
	    ResultSet rows = login.loginUser(user1);
	    String role =null;
	    String userEmail = null;

	    try {
	        if (rows.next()) {
	             role = rows.getString("role");
	           userEmail = rows.getString("email");


	    		 
				
				 HttpSession session = request.getSession(); session.setAttribute("userEmail",
				  userEmail); session.setAttribute("userRole", role);
				 
	            
	            GetProjects userProjects = new GetProjects();
	            ResultSet proj = userProjects.getUserProjects(new CurrentUser(userEmail));
	            session.setAttribute("projects", proj);
	            int sessionTimeoutInSeconds = 1800; 
                session.setMaxInactiveInterval(sessionTimeoutInSeconds);

	            
	            if (role.equals("admin")) {
	                response.sendRedirect("adminDashboard.jsp");
	            } else {
	            	
		    		
		    		  request.setAttribute("email", userEmail);
		    		  
		    		  // Forward the request to landing.jsp
		    		  request.getRequestDispatcher("landing.jsp").forward(request, response);
	                response.sendRedirect("landing.jsp");
	            }
	        } else {
	            
	            response.sendRedirect("login.jsp?error=1");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	     
	        response.sendRedirect("login.jsp?error=2");
	    } finally {
	       
	        if (rows != null) {
	            try {
	                rows.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}


}
