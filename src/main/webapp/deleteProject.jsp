<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.pms.*" %>
    
<%
ConnectDB db = new ConnectDB();

db.dbConnection();

int projectId = Integer.parseInt(request.getParameter("projectId"));


DeleteProject deleteProject = new DeleteProject();

String msg= deleteProject.deleteProject(projectId);

JOptionPane.showMessageDialog(null, "Project deleted successfuly");	
response.sendRedirect("adminDashboard.jsp");



%>