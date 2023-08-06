package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckExist {

	
	boolean checkExist(User user1) {
		
		ResultSet row=null;
		
	ConnectDB db= new ConnectDB();
	db.loadDriver();
	
	Connection cnx = db.dbConnection();
	
	String sql= "SELECT * FROM users WHERE email=?";
	
	try {
		PreparedStatement stm= cnx.prepareStatement(sql);
		
		stm.setString(1, user1.getEmail());
        row = stm.executeQuery();
        
        if(row.next()) {
        	return true;
        }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
		
		return false;
		
		
		
		
	}
	
	
}
