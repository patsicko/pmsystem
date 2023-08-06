package com.pms;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {

	
	public ResultSet loginUser(LogedUser log1) {
		
		ResultSet rows= null;
		
		ConnectDB db = new ConnectDB();
	    db.loadDriver();
	    Connection cnx= db.dbConnection();
	    
	  String sql="SELECT * FROM users WHERE email=? AND password=?";
	  
	  String EncryptedPassword = encryptPassword(log1.getPassword());
	  
	  try {
		PreparedStatement stm= cnx.prepareStatement(sql);
		stm.setString(1, log1.getEmail());
		stm.setString(2, EncryptedPassword);
		rows= stm.executeQuery();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		System.out.println("Login failed"+e.getMessage());
	}
	    
	    
		return rows;
	}
	
	
	public ResultSet getsers() {
		
		ResultSet row=null;
		ConnectDB db = new ConnectDB();
		db.loadDriver();
		Connection cnx= db.dbConnection();
		
		String sql="SELECT * FROM users";
		try {
			PreparedStatement stm= cnx.prepareStatement(sql);
			row= stm.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return row;
	}
	
	
	  
	  private String encryptPassword(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            byte[] digest = md.digest(password.getBytes());
	            StringBuilder sb = new StringBuilder();
	            for (byte b : digest) {
	                sb.append(String.format("%02x", b & 0xff));
	            }
	            return sb.toString();
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	            return null;
	        }
	    } 
	
}

