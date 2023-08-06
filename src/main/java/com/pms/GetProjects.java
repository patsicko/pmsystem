package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetProjects {

	public ResultSet getProjects() {
		
		ResultSet row=null;
		ConnectDB db = new ConnectDB();
		db.loadDriver();
		Connection cnx= db.dbConnection();
		
		String sql="SELECT * FROM projects";
		try {
			PreparedStatement stm= cnx.prepareStatement(sql);
			row= stm.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return row;
	}
	
	
	
	
public ResultSet getUserProjects(CurrentUser cuser1) {
		
	
	
		ResultSet result=null;
		ConnectDB db = new ConnectDB();
		db.loadDriver();
		Connection cnx= db.dbConnection();
		
		String sql="SELECT * FROM projects WHERE user=?";
		try {
			PreparedStatement stm= cnx.prepareStatement(sql);
			stm.setString(1, cuser1.getCurrentEmail());
			result= stm.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return result;
	}



public boolean updateProjectStatus(int projectId, String newStatus) {
    boolean success = false;
    
	ConnectDB db = new ConnectDB();
	db.loadDriver();
	Connection cnx= db.dbConnection();
	String sql = "UPDATE projects SET status = ? WHERE projectId = ?";
	

    try  {
        
        PreparedStatement statement = cnx.prepareStatement(sql);
        statement.setString(1, newStatus);
        statement.setInt(2, projectId);

        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
            success = true;
        }
    } catch (SQLException e) {
       
        e.printStackTrace();
    }

    return success;
	
	
}	
}
