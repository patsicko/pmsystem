package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class AddProject {
	 public String addProject(Project project1) {
		  
		  ConnectDB db = new ConnectDB();
         db.loadDriver();
         String mssg=null;
         Connection cnx=db.dbConnection();
        
         CheckProjectExist existProject= new CheckProjectExist();
         
        boolean existingProject= existProject.checkExist(project1);
         
         if(existingProject) {
       	  JOptionPane.showMessageDialog(null, "Project already exist");	  
       	  
         } else {
       	  
       	   String sql = "INSERT INTO projects (projectName, description, user) VALUES (?,?, ?)";
              try {
      			PreparedStatement stm=cnx.prepareStatement(sql);
      			stm.setString(1, project1.getProjectName());
      			stm.setString(2, project1.getDescription());
      			stm.setString(3, project1.getUser());
      			int row=stm.executeUpdate();
      			
      			if(row>0) {
      				mssg="Project created successfully";
      				
      			}else {
      				mssg="Failed to create project";
      			}
      			
      		} catch (SQLException e) {
      			e.printStackTrace();
      			System.out.println("Failed to create project !!"+e.getMessage());
      		}	  
       	  
         }
         
         
         
      
		return mssg;
       

 
 }
}
