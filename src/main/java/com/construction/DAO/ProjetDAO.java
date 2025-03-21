package com.construction.DAO;

import com.construction.Model.Projet;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjetDAO {

    Projet projet = new Projet();

    public void AjouterProjet(Projet projet) throws SQLException {

        String query = "insert into projet ( nom , description , date_debut , date_fin , budget) values  (?,?,?,?,?)";
        try (Connection connection = DBConnection.getConnection()) {

            PreparedStatement stmt = connection.prepareStatement((query));
            stmt.setString(1, projet.getNom());
            stmt.setString(2, projet.getDescription());
            stmt.setDate(3, projet.getDate_debut());
            stmt.setDate(4, projet.getDate_fin());
            stmt.setDouble(5, projet.getBudget());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Projet GetProjetById(int id_projet) throws SQLException {
        String query = "select * from projet where id_projet = ?";
         try (Connection connection = DBConnection.getConnection()) {

                 PreparedStatement stmt = connection.prepareStatement(query);
                 stmt.setInt(1, id_projet);
                 ResultSet rs = stmt.executeQuery();

                 if (rs.next()) {
                     projet = new Projet();
                     projet.setId_projet(rs.getInt("id_projet"));
                     projet.setNom(rs.getString("nom"));
                     projet.setDescription(rs.getString("description"));
                     projet.setDate_debut(rs.getDate("date_debut"));
                     projet.setDate_fin(rs.getDate("date_fin"));
                     projet.setBudget(rs.getDouble("budget"));
                 }
         } catch (SQLException e) {
                 e.printStackTrace();
             }
            return projet;
    }

    public List<Projet> GetAllProjet() throws SQLException{
        List<Projet> projetList = new ArrayList<>();
        String query = "SELECT * FROM projet";
        try (Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Projet projet = new Projet();
                projet.setId_projet(rs.getInt("id_projet"));
                projet.setNom(rs.getString("nom"));
                projet.setDescription(rs.getString("description"));
                projet.setDate_debut(rs.getDate("date_debut"));
                projet.setDate_fin(rs.getDate("date_fin"));
                projet.setBudget(rs.getDouble("budget"));
                projetList.add(projet);
            }
            return projetList;
        }
    }

    public Projet ModifierProjet(Projet projet) throws SQLException {
        String sql = "UPDATE projet SET nom = ?, description = ?, date_debut = ?, date_fin = ?, budget = ? WHERE id_projet = ?";
        PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sql);

        stmt.setString(1, projet.getNom());
        stmt.setString(2, projet.getDescription() != null ? projet.getDescription() : "");
        stmt.setDate(3, projet.getDate_debut() != null ? projet.getDate_debut() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setDate(4, projet.getDate_fin() != null ? projet.getDate_fin() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setDouble(5, projet.getBudget());
        stmt.setInt(6, projet.getId_projet());

        int rowsUpdated = stmt.executeUpdate();
        if (rowsUpdated == 0) {
            throw new SQLException("No project found with ID " + projet.getId_projet());
        }


        return projet;
    }

    public void DeleteProjet(int id_projet) throws SQLException{
        String query = "delete from projet where id_projet = ?;";
        try(Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query)){

            stmt.setInt(1, id_projet);
            stmt.executeUpdate();

        }


    }


}

