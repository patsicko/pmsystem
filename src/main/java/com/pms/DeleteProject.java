package com.pms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProject {
    public String deleteProject(int projectId) {

        ConnectDB db = new ConnectDB();
        db.loadDriver();
        String mssg = null;
        Connection cnx = db.dbConnection();
        
      
     
            String sql = "DELETE FROM projects WHERE projectId = ?";
            try {
                PreparedStatement stm = cnx.prepareStatement(sql);
                stm.setInt(1, projectId);
                int rowsAffected = stm.executeUpdate();

                if (rowsAffected > 0) {
                    mssg = "Project deleted successfully";
                } else {
                    mssg = "Failed to delete project";
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Failed to delete project: " + e.getMessage());
                mssg = "Failed to delete project";
            }
        


        return mssg;
    }

  }

