package com.construction.Web;

import com.construction.DAO.ProjetDAO;
import com.construction.Model.Projet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Projet")
public class ProjetServlet extends HttpServlet {
    private ProjetDAO projetDAO = new ProjetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id_projet = request.getParameter("id_projet") != null ? Integer.parseInt(request.getParameter("id_projet")) : -1;

        try {
            switch (action != null ? action : "") {
                case "edit":
                    request.setAttribute("projet", projetDAO.GetProjetById(id_projet));
                    request.getRequestDispatcher("/modifierProjet.jsp").forward(request, response);
                    break;
                case "delete":
                    projetDAO.DeleteProjet(id_projet);
                    response.sendRedirect("Projet");
                    break;
                default:
                    List<Projet> projetList = projetDAO.GetAllProjet();
                    request.setAttribute("projets", projetList);
                    request.getRequestDispatcher("/ListeProjet.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Database error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Projet projet = new Projet();
            projet.setNom(request.getParameter("nom"));
            projet.setDescription(request.getParameter("description"));
            projet.setDate_debut(Date.valueOf(request.getParameter("date_debut")));
            projet.setDate_fin(Date.valueOf(request.getParameter("date_fin")));
            projet.setBudget(Double.parseDouble(request.getParameter("budget")));

            if (request.getParameter("id_projet") != null && !request.getParameter("id_projet").isEmpty()) {
                // Update project
                projet.setId_projet(Integer.parseInt(request.getParameter("id_projet")));
                projetDAO.ModifierProjet(projet);
            } else {
                // Create new project
                projetDAO.AjouterProjet(projet);
            }

            response.sendRedirect("Projet");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Error saving project.");
        }
    }
}
