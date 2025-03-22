<%@ page import="java.util.List, com.construction.Model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom Fade-In Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fadeIn { animation: fadeIn 0.8s ease-out forwards; }
    </style>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover bg-black text-white" style="background-image: url('./image/pexels.jpg');">

<div class="container mx-auto bg-black bg-opacity-80 p-4 sm:p-6 md:p-8 shadow-lg rounded-lg min-h-screen">

    <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold text-yellow-400 text-center mb-8 md:mb-12 animate-fadeIn">Liste des Projets</h2>

    <!-- Bouton Ajouter Projet -->
    <a href="ajouterProjet.jsp"
       class="bg-yellow-400 text-black px-4 py-2 sm:px-6 sm:py-3 rounded-lg block w-max mx-auto text-sm sm:text-base font-semibold hover:bg-yellow-500 hover:scale-105 transition-all duration-300 animate-fadeIn">
        Ajouter un Projet
    </a>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mt-8 md:mt-12">
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            if (projets != null && !projets.isEmpty()) {
                int delay = 0;
                for (Projet projet : projets) {
        %>
        <div class="group animate-fadeIn" style="animation-delay: <%= delay * 0.2 %>s;">
            <div class="relative flex flex-col items-center w-full max-w-[350px] mx-auto border border-yellow-400 bg-black bg-opacity-90 rounded-lg shadow-lg transition-all duration-500 p-4 sm:p-5 hover:shadow-xl hover:-translate-y-2">

                <!-- Image du Projet -->
                <img src="./image/ingenieur.jpg" class="w-full h-48 sm:h-56 rounded-lg object-cover mb-4" alt="Projet Image">

                <!-- Détails du Projet -->
                <h2 class="text-xl sm:text-2xl font-extrabold text-yellow-400 text-center"><%= projet.getNom() %></h2>
                <p class="text-sm sm:text-base font-normal mt-2 text-white text-center"><%= projet.getDescription() %></p>
                <p class="text-base sm:text-lg font-semibold text-yellow-400 mt-2 text-center">Budget (MAD) : <%= projet.getBudget() %></p>

                <!-- Dates -->
                <p class="text-xs sm:text-sm font-medium text-gray-300 mt-2 text-center">
                    <strong>Date Début :</strong> <%= projet.getDate_debut() != null ? projet.getDate_debut() : "Non spécifiée" %>
                </p>
                <p class="text-xs sm:text-sm font-medium text-gray-300 text-center">
                    <strong>Date Fin :</strong> <%= projet.getDate_fin() != null ? projet.getDate_fin() : "Non spécifiée" %>
                </p>

                <!-- Boutons d'Actions -->
                <div class="flex flex-wrap justify-center gap-2 sm:gap-4 mt-4">
                    <a href="Tache?&id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-3 sm:px-4 rounded-md text-black bg-yellow-400 hover:bg-yellow-500 transition-all duration-300 text-xs sm:text-sm font-semibold">
                        Tâches
                    </a>
                    <a href="Projet?action=edit&id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-3 sm:px-4 rounded-md text-white bg-blue-600 hover:bg-blue-700 transition-all duration-300 text-xs sm:text-sm font-semibold">
                        Modifier
                    </a>
                    <a href="Projet?action=delete&id_projet=<%= projet.getId_projet() %>"
                       class="py-2 px-3 sm:px-4 rounded-md text-white bg-red-600 hover:bg-red-700 transition-all duration-300 text-xs sm:text-sm font-semibold"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                        Supprimer
                    </a>
                </div>
            </div>
        </div>
        <%
                delay++;
            }
        } else {
        %>
        <!-- Message si aucun projet disponible -->
        <p class="text-yellow-400 text-center col-span-full text-base sm:text-lg animate-fadeIn">Aucun projet disponible.</p>
        <% } %>
    </div>

</div>

</body>
</html>