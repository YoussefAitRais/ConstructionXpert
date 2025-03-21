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

@WebServlet("/Tache")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO = new TacheDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id_tache = request.getParameter("id_tache") != null ? Integer.parseInt(request.getParameter("id_tache")) : -1;
        int id_projet = request.getParameter("id_projet") != null ? Integer.parseInt(request.getParameter("id_projet")) : -1;

        try {
            switch (action != null ? action : "") {
                case "add":
                    request.setAttribute("id_projet", id_projet);
                    request.getRequestDispatcher("/ajouterTache.jsp").forward(request, response);
                    break;
                case "edit":
                    if (id_tache > 0) {
                        Tache tache = tacheDAO.GetTacheById(id_tache);
                        request.setAttribute("tache", tache);
                        request.setAttribute("id_projet", id_projet);
                        request.getRequestDispatcher("/modifierTache.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("Tache?id_projet=" + id_projet);
                    }
                    break;
                case "delete":
                    if (id_tache > 0) {
                        tacheDAO.DeleteTache(id_tache);
                    }
                    response.sendRedirect("Tache?id_projet=" + id_projet);
                    break;
                default:
                    List<Tache> tacheList = tacheDAO.GetAllTache();
                    request.setAttribute("taches", tacheList);
                    request.setAttribute("id_projet", id_projet);
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
            int id_projet = Integer.parseInt(request.getParameter("id_projet"));
            int id_tache = request.getParameter("id_tache") != null && !request.getParameter("id_tache").isEmpty()
                    ? Integer.parseInt(request.getParameter("id_tache"))
                    : -1;

            Tache tache = new Tache();
            tache.setId_projet(id_projet);
            tache.setDescription(request.getParameter("description"));
            tache.setDate_debut(Date.valueOf(request.getParameter("date_debut")));
            tache.setDate_fin(Date.valueOf(request.getParameter("date_fin")));

            if (id_tache > 0) {
                tache.setId_tache(id_tache);

                tacheDAO.ModifierTache(tache);
            } else {
                tacheDAO.AjouterTache(tache);
            }

            response.sendRedirect("Tache?id_projet=" + id_projet);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Error saving task.");
        }
    }

}
