package com.construction.DAO;

import com.construction.Model.Projet;
import com.construction.Model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TacheDAO {

    Tache tache = new Tache();

    public void AjouterTache() throws SQLException {

        String query  = "insert into tache ( id_projet , id_tache , description , date_debut , date_fin) values (?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement((query));

            stmt.setInt(1, tache.getId_projet());
            stmt.setInt(2, tache.getId_tache());
            stmt.setString(3, tache.getDescription());
            stmt.setDate(4, tache.getDate_debut());
            stmt.setDate(5, tache.getDate_fin());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Tache GetTacheById(int id_tache) throws SQLException {
        String query = "select * from tache where id_tache = ?";
        try (Connection connection = DBConnection.getConnection()) {

            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, id_tache);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
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
                tache.setId_projet(rs.getInt("id_projet"));
                tache.setId_tache(rs.getInt("id_tache"));

                tache.setDescription(rs.getString("description"));
                tache.setDate_debut(rs.getDate("date_debut"));
                tache.setDate_fin(rs.getDate("date_fin"));
                tacheList.add(tache);
            }
            return tacheList;
        }
    }

    public Tache ModifierTache(Tache tache) throws SQLException {
        String sql = "UPDATE tache SET description = ?, date_debut = ?, date_fin = ?, budget = ? WHERE id_projet = ?";
        PreparedStatement stmt = DBConnection.getConnection().prepareStatement(sql);

        stmt.setString(1, tache.getDescription() != null ? tache.getDescription() : "");
        stmt.setDate(2, tache.getDate_debut() != null ? tache.getDate_debut() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setDate(3, tache.getDate_fin() != null ? tache.getDate_fin() : new java.sql.Date(System.currentTimeMillis()));
        stmt.setInt(4, tache.getId_projet());

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


