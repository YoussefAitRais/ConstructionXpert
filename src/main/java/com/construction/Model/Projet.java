package com.construction.Model;

import java.util.Date;

public class Projet {

    private int id_projet ;
    private String nom;
    private String description;
    private Date date_debut;
    private Date date_fin ;
    private double budget ;


    public Projet(int id, String nom, String description, Date date_debut, Date date_fin, double budget) {
        this.id_projet = id_projet;
        this.nom = nom;
        this.description = description;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
        this.budget = budget;
    }

    public Projet() {

    }

    public int getId_projet() {
        return id_projet;
    }

    public void setId_projet(int idProjet) {
        this.id_projet=idProjet;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public java.sql.Date getDate_debut() {
        return (java.sql.Date) date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public java.sql.Date getDate_fin() {
        return (java.sql.Date) date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }



}