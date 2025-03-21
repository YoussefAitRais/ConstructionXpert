<%@ page import="java.util.List, com.construction.Model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover" style="background-image: url('./image/pexels.jpg');">
<div class="container mx-auto bg-white/80 p-6 shadow-lg rounded-lg">

    <h2 class="text-2xl font-bold text-gray-800 text-center mb-10">Liste des Projets</h2>

    <!-- Bouton Ajouter Projet -->
    <a href="ajouterProjet.jsp"
       class="bg-transparent border border-blue-500 text-blue-500 px-4 py-2 rounded block w-max mx-auto hover:bg-blue-500 hover:text-white transition-all duration-300">
        Ajouter un Projet
    </a>

    <div class="grid lg:grid-cols-3 md:grid-cols-2 grid-cols-1 gap-6 mt-10">
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            if (projets != null && !projets.isEmpty()) {
                for (Projet projet : projets) {
        %>
        <div class="group">
            <div class="relative flex flex-col items-center justify-center w-[350px] h-auto max-w-full border border-gray-100 bg-white rounded-lg shadow-lg transition-all duration-500 p-5">

                <!-- Image du Projet -->
                <img src="./image/ingenieur.jpg" class="w-full h-56 rounded-lg object-cover mb-4" alt="Projet Image">

                <!-- Détails du Projet -->
                <h2 class="text-2xl font-extrabold text-green-800 text-center"><%= projet.getNom() %></h2>
                <p class="text-base font-normal mt-2 text-neutral-950 text-center"><%= projet.getDescription() %></p>
                <p class="text-lg font-semibold text-gray-700 mt-2 text-center">Budget (MAD) : <%= projet.getBudget() %></p>

                <!-- Dates -->
                <p class="text-sm font-medium text-gray-600 mt-2 text-center">
                    <strong>Date Début :</strong> <%= projet.getDate_debut() != null ? projet.getDate_debut() : "Non spécifiée" %>
                </p>
                <p class="text-sm font-medium text-gray-600 text-center">
                    <strong>Date Fin :</strong> <%= projet.getDate_fin() != null ? projet.getDate_fin() : "Non spécifiée" %>
                </p>

                <!-- Boutons d'Actions -->
                <div class="flex justify-center gap-4 mt-4">
                    <a href="Tache?id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-4 rounded-md text-white bg-yellow-500 hover:bg-yellow-600 transition-all duration-300">
                        Tâches
                    </a>
                    <a href="Projet?action=edit&id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-4 rounded-md text-white bg-blue-500 hover:bg-blue-600 transition-all duration-300">
                        Modifier
                    </a>
                    <a href="Projet?action=delete&id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-4 rounded-md text-white bg-red-500 hover:bg-red-600 transition-all duration-300"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                        Supprimer
                    </a>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <!-- Message si aucun projet disponible -->
        <p class="text-gray-700 text-center col-span-full">Aucun projet disponible.</p>
        <% } %>
    </div>

</div>
</body>
</html>
