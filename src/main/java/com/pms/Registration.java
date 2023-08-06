package com.pms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Registration() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	String	fname=request.getParameter("fname");
	String	lname=request.getParameter("lname");
	String	email=request.getParameter("email");
	String	password=request.getParameter("password");
	String	role="user";
	
	User user0=new User("admin","admin","admin@gmail.com","admin","admin");
	
	User user1=new User(fname,lname,email,password,role);
	ConnectDB db=new ConnectDB();
	db.dbConnection();
	AddUser addUser= new AddUser();
	SeedAdmin seedAdmin = new SeedAdmin();
	seedAdmin.seedAdmin(user0);

	String rs=addUser.registerUser(user1);
	
	if(rs!=null) {
		
		response.sendRedirect("login.jsp");
	}else {
		response.sendRedirect("signup.jsp");
	}
	
	
	}

}
