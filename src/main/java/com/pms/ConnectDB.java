package com.pms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectDB {

	String jdbcUrl = "jdbc:mysql://localhost:3306/hospital";
	String dbUsername = "root";
	 String dbPassword = "";
    Connection conn = null;
    String dbDriver="com.mysql.cj.jdbc.Driver";
    
       public void loadDriver() {
    	try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
			System.out.println("No driver found !!"+e.getMessage());
		}
    }
    
    public Connection dbConnection() {
    	  try {
			conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("Not Connected !!"+e.getMessage());
		}
    	  return conn;
    }

  
}
