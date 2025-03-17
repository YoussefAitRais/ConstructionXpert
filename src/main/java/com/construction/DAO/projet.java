package com.construction.DAO;

import com.construction.Model.Projet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class projet {

    public void AjouterProjet(Projet projet) throws SQLException {

        String query = "insert into projet (id_projet , nom , description , date_debut , date_fin , budget) value (?,?,?,?,?,?)";
       try(Connection connection = DBConnection.getConnection())
       {

           PreparedStatement stmt = connection.prepareStatement((query));
           stmt.setString (1, projet.getNom());
           stmt.setString(2, projet.getDescription());
           stmt.setDate(3,projet.getDate_debut());
           stmt.setDate(3,projet.getDate_fin());
           stmt.setDouble(2, projet.getBudget());
           stmt.executeQuery();
       } catch ( SQLException e)
       {
           throw new RuntimeException(e);
       }


    }



}
