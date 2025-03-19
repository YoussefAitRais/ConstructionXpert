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

@WebServlet ("/Projet")
public class ProjetServlet extends HttpServlet {
    ProjetDAO projetDAO = new ProjetDAO();

    @Override
    public void init () throws ServletException {
        super.init();
        Projet projet = new Projet();
    }

    protected void doGet (HttpServletRequest request , HttpServletResponse response)
        throws  ServletException, IOException {
        String action = request.getParameter("action")


        Projet projet = null;
        try {
            if ("edit" equals(action)){
            int id_projet = Integer.parseInt(request.getParameter("id_projet"));
            projet = projetDAO.GetProjetById(id_projet);
            request.setAttribute("projet", projet);
            request.getRequestDispatcher("modifier.jsp").forward(request, response);
            }else if ("delete" equals(action)){
                int id_projet = Integer.parseInt(request.getParameter("id_projet"));
                projetDAO.DeleteProjet(id_projet);
                response.sendRedirect("Projet");
            }else {
                List<Projet> projetList = projetDAO.GetAllProjet();
                request.setAttribute("projet", projet);
                request.getRequestDispatcher("listeProjets.jsp").forward(request, response);
            }

        } catch (SQLException e){
                e.printStackTrace();
            response.sendError(500, "Database error");
    }

}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Projet projet = new Projet();
            projet.setNom(request.getParameter("nom"));
            projet.setDescription(request.getParameter("description"));
            projet.setDate_debut(Date.valueOf(request.getParameter("date_debut")));
            projet.setDate_fin(Date.valueOf(request.getParameter("date_fin")));
            projet.setBudget(Double.parseDouble(request.getParameter("budget")));

            projetDAO.AjouterProjet(projet);
            response.sendRedirect("ProjetForm.jsp");
            response.getWriter().write("Saving success !");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Error saving  project.");
        }
    }
}
