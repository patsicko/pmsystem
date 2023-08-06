package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class UpdateProject {
	 public String updateProject(Updated updatedProj) {
		  
		  ConnectDB db = new ConnectDB();
        db.loadDriver();
        String mssg=null;
        Connection cnx=db.dbConnection();
   
        
       
      	  
        String sql = "UPDATE projects SET projectName=?, description=?, user=?, status=? WHERE projectId=?";
             try {
     			PreparedStatement stm=cnx.prepareStatement(sql);
     		   stm.setString(1, updatedProj.getProjectName());
               stm.setString(2, updatedProj.getDescription());
               stm.setString(3, updatedProj.getUser());
               stm.setString(4, updatedProj.getStatus());
               stm.setInt(5, updatedProj.getProjectId());
     			int row=stm.executeUpdate();
     			
     			if(row>0) {
     				mssg="Project created successfully";
     				
     				
     			}else {
     				mssg="Failed to update project";
     			}
     			
     		} catch (SQLException e) {
     			e.printStackTrace();
     			System.out.println("Failed to create project !!"+e.getMessage());
     		}	  
      	  
        
        
	  
        
     
		return mssg;
      
}
}
