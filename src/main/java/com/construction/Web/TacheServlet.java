package com.construction.Web;

import com.construction.DAO.TacheDAO;
import com.construction.Model.Tache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;


@WebServlet ("/Tache")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO = new TacheDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id_tache = request.getParameter("id_tache") != null ? Integer.parseInt(request.getParameter("id_tache")) : -1;
        try {
            switch (action != null ? action : "") {
                case "edit":

                    request.setAttribute("tache", tacheDAO.GetTacheById(id_tache));

                    request.getRequestDispatcher("/modifierProjet.jsp").forward(request, response);
                    break;
                case "delete":
                    tacheDAO.DeleteTache(id_tache);
                    response.sendRedirect("Tache");
                    break;
                default:
                    List<Tache> tacheList = tacheDAO.GetAllTache();
                    request.setAttribute("taches", tacheList);
                    request.getRequestDispatcher("/ListeTache.jsp").forward(request, response);
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
                Tache tache = new Tache();
                tache.setDescription(request.getParameter("description"));
                tache.setDate_debut(Date.valueOf(request.getParameter("date_debut")));
                tache.setDate_fin(Date.valueOf(request.getParameter("date_fin")));

                if (request.getParameter("id_tache") != null && !request.getParameter("id_tache").isEmpty()) {
                    tache.setId_projet(Integer.parseInt(request.getParameter("id_tache")));
                    tacheDAO.ModifierTache(tache);
                } else {
                    tacheDAO.AjouterTache(tache);
                }

                response.sendRedirect("Projet");

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(500, "Error saving project.");
            }
        }
    }
