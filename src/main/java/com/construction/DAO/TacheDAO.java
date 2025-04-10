package com.construction.DAO;

import com.construction.Model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TacheDAO {

    Tache tache = new Tache();

    public void AjouterTache(Tache tache) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM projet WHERE id_projet = ?";
        String insertQuery = "INSERT INTO tache (id_projet, description, date_debut, date_fin) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection()) {
            PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
            checkStmt.setInt(1, tache.getId_projet());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                PreparedStatement stmt = connection.prepareStatement(insertQuery);
                stmt.setInt(1, tache.getId_projet());
                stmt.setString(2, tache.getDescription());
                stmt.setDate(3, tache.getDate_debut());
                stmt.setDate(4, tache.getDate_fin());

                stmt.executeUpdate();
            } else {
                System.out.println("Error: Project ID " + tache.getId_projet() + " does not exist.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public Tache GetTacheById(int id_tache) throws SQLException {
        String query = "select * from tache where id_tache = ?";
        Tache tache = null;
        try (Connection connection = DBConnection.getConnection()) {

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, id_tache);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setId_projet(rs.getInt("id_projet"));
                tache.setDescription(rs.getString("description"));
                tache.setDate_debut(rs.getDate("date_debut"));
                tache.setDate_fin(rs.getDate("date_fin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    public List<Tache> GetAllTache() throws SQLException{
        List<Tache> tacheList = new ArrayList<>();
        String query = "SELECT * FROM tache";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Tache tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setId_projet(rs.getInt("id_projet"));
                tache.setDescription(rs.getString("description"));
                tache.setDate_debut(rs.getDate("date_debut"));
                tache.setDate_fin(rs.getDate("date_fin"));
                tacheList.add(tache);
            }
            return tacheList;
        }
    }

    public Tache ModifierTache(Tache tache) throws SQLException {
        String sql = "UPDATE tache SET description = ?, date_debut = ?, date_fin = ? WHERE id_tache = ?";
        PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sql);

        stmt.setString(1, tache.getDescription() != null ? tache.getDescription() : "");
        stmt.setDate(2, tache.getDate_debut() != null ? tache.getDate_debut() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setDate(3, tache.getDate_fin() != null ? tache.getDate_fin() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setInt(4, tache.getId_tache());

        int rowsUpdated = stmt.executeUpdate();
        if (rowsUpdated == 0) {
            throw new SQLException("No tache found with ID " + tache.getId_tache());
        }


        return tache;
    }

    public void DeleteTache(int id_tache) throws SQLException{
        String query = "delete from tache where id_tache = ?;";
        try(Connection connection = DBConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(query)){

            stmt.setInt(1, id_tache);
            stmt.executeUpdate();
        }

    }


    }


