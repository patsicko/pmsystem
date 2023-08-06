package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteUser {
	public String deleteUser(int ID) {

        ConnectDB db = new ConnectDB();
        db.loadDriver();
        String mssg = null;
        Connection cnx = db.dbConnection();
        
      
     
            String sql = "DELETE FROM users WHERE ID = ?";
            try {
                PreparedStatement stm = cnx.prepareStatement(sql);
                stm.setInt(1, ID);
                int rowsAffected = stm.executeUpdate();

                if (rowsAffected > 0) {
                    mssg = "User deleted successfully";
                } else {
                    mssg = "Failed to delete User";
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Failed to delete user: " + e.getMessage());
                mssg = "Failed to delete user";
            }
        


        return mssg;
    }
}
