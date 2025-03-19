package com.construction.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;

    public static final String URL = "jdbc:mysql://localhost:3306/construction?autoReconnect=true&useSSL=false";
    public static final String USER = "root";
    public static final String PASSWORD = "admin";

    public static Connection getConnection() {

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Charger le driver MySQL
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Connexion réussie à la base de données !");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                System.out.println("Erreur de connexion à la base de données !");
            }

        return connection;
    }



}
