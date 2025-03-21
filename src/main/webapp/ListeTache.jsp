<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, com.construction.Model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Tâches</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover"
      style="background-image: url('./image/construction.jpg');">
<div class="container mx-auto bg-white/80 p-6 shadow-lg rounded-lg">

    <%
        int id_projet = request.getParameter("id_projet") != null ? Integer.parseInt(request.getParameter("id_projet")) : -1;
        List<Tache> taches = (List<Tache>) request.getAttribute("taches");
    %>

    <h2 class="text-2xl font-bold text-gray-800 text-center mb-10">
        Liste des Tâches du Projet #<%= id_projet %>
    </h2>

    <!-- Bouton pour ajouter une tâche -->
    <a href="ajouterTache.jsp?id_projet=<%= id_projet %>"
       class="bg-transparent border border-green-500 text-green-500 px-4 py-2 rounded block w-max mx-auto
              hover:bg-green-500 hover:text-white transition-all duration-300">
        Ajouter une Tâche
    </a>

    <!-- Liste des Tâches -->
    <div class="grid lg:grid-cols-3 md:grid-cols-2 grid-cols-1 gap-6 mt-10">
        <% if (taches != null && !taches.isEmpty()) {
            for (Tache tache : taches) {
                if (tache.getId_projet() == id_projet) {
        %>
        <div class="group">
            <div class="relative flex flex-col items-center justify-center w-[350px] h-auto max-w-full border border-gray-100 bg-white rounded-lg shadow-lg
                        transition-all duration-500 p-5 transform hover:scale-105 hover:shadow-xl">

                <h2 class="text-xl font-extrabold text-blue-800 text-center">
                    <%= tache.getDescription() %>
                </h2>

                <p class="text-sm text-gray-600 mt-2 text-center">
                    <strong>Date de début :</strong> <%= tache.getDate_debut() %>
                </p>

                <p class="text-sm text-gray-600 text-center">
                    <strong>Date de fin :</strong> <%= tache.getDate_fin() %>
                </p>

                <div class="flex justify-center gap-4 mt-4">
                    <!-- Bouton Modifier -->
                    <a href="Tache?action=edit&id_tache=<%= tache.getId_tache() %>&id_projet=<%= id_projet %>"
                       class="py-2 px-4 rounded-md text-white bg-blue-500 hover:bg-blue-600 transition-all duration-300">
                        Modifier
                    </a>

                    <!-- Bouton Supprimer -->
                    <a href="Tache?action=delete&id_tache=<%= tache.getId_tache() %>&id_projet=<%= id_projet %>"
                       class="py-2 px-4 rounded-md text-white bg-red-500 hover:bg-red-600 transition-all duration-300"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?');">
                        Supprimer
                    </a>
                </div>
            </div>
        </div>
        <%
                }
            }
        } else { %>
        <p class="text-gray-700 text-center col-span-full">
            Aucune tâche disponible pour ce projet.
        </p>
        <% } %>
    </div>

    <div class="text-center mt-6">
        <a href="Projet" class="text-blue-500 hover:text-blue-700 transition-all duration-300">
            Retour à la liste des Projets
        </a>
    </div>

</div>
</body>
</html>
