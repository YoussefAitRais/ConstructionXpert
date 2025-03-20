package com.construction.Model;

import java.util.Date;

public class Tache {
    private int id_projet;
    private int id_tache;
    private String description;
    private Date date_debut;
    private Date date_fin ;


    public Tache(int id_projet, int id_tache, String description, Date date_debut, Date date_fin) {
        this.id_projet = id_projet;
        this.id_tache = id_tache;
        this.description = description;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
    }

    public Tache(String description, Date date_debut, Date date_fin) {
        this.description = description;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
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

}
