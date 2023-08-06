package com.pms;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class SeedAdmin {
	
	  public String seedAdmin(User user1) {
		  
		  ConnectDB db = new ConnectDB();
        db.loadDriver();
        String mssg="Created";
        Connection cnx=db.dbConnection();
       
        CheckExist exist= new CheckExist();
        
       boolean existingEmail= exist.checkExist(user1);
        
        if(existingEmail) {
      	  return null;  
      	  
        } else {
      	  
      	   String sql = "INSERT INTO users (fname, lname, email, password,role) VALUES (?,?, ?, ?, ?)";
      	  String EncryptedPassword = encryptPassword(user1.getPassword());
      	   
      	   try {
     			PreparedStatement stm=cnx.prepareStatement(sql);
     			stm.setString(1, user1.getFname());
     			stm.setString(2, user1.getLname());
     			stm.setString(3, user1.getEmail());
     			stm.setString(4, EncryptedPassword);
     			stm.setString(5, user1.getRole());
     			stm.executeUpdate();
     			
     		} catch (SQLException e) {
     			e.printStackTrace();
     			System.out.println("Not inserted !!"+e.getMessage());
     		}	  
      	  
        }
        
        
        
     
		return mssg;
      


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
