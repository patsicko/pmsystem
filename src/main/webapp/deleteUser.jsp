<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.pms.*" %>
    
<%
ConnectDB db = new ConnectDB();

db.dbConnection();

int ID = Integer.parseInt(request.getParameter("id"));

DeleteUser deleteUser = new DeleteUser();

String msg= deleteUser.deleteUser(ID);

JOptionPane.showMessageDialog(null, "User deleted successfuly");	
response.sendRedirect("adminDashboard.jsp");

%>