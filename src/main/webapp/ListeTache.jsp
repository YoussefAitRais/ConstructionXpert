<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, com.construction.Model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Tâches</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Animation Fade-In */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fadeIn { animation: fadeIn 0.8s ease-out forwards; }
    </style>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover bg-black text-white" style="background-image: url('./image/construction.jpg');">

<div class="container mx-auto bg-black bg-opacity-80 p-4 sm:p-6 md:p-8 shadow-lg rounded-lg min-h-screen">

    <%
        int id_projet = request.getParameter("id_projet") != null ? Integer.parseInt(request.getParameter("id_projet")) : -1;
        List<Tache> taches = (List<Tache>) request.getAttribute("taches");
    %>

    <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold text-yellow-400 text-center mb-8 md:mb-12 animate-fadeIn">
        Liste des Tâches du Projet #<%= id_projet %>
    </h2>

    <!-- Bouton Ajouter Tâche -->
    <a href="ajouterTache.jsp?id_projet=<%= id_projet %>"
       class="bg-yellow-400 text-black px-4 py-2 sm:px-6 sm:py-3 rounded-lg block w-max mx-auto text-sm sm:text-base font-semibold hover:bg-yellow-500 hover:scale-105 transition-all duration-300 animate-fadeIn">
        Ajouter une Tâche
    </a>

    <!-- Liste des Tâches -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mt-8 md:mt-12">
        <%
            if (taches != null && !taches.isEmpty()) {
                int delay = 0;
                for (Tache tache : taches) {
                    if (tache.getId_projet() == id_projet) {
        %>
        <div class="group animate-fadeIn" style="animation-delay: <%= delay * 0.2 %>s;">
            <div class="relative flex flex-col items-center w-full max-w-[350px] mx-auto border border-yellow-400 bg-black bg-opacity-90 rounded-lg shadow-lg transition-all duration-500 p-4 sm:p-5 hover:shadow-xl hover:-translate-y-2">

                <!-- Image Illustration -->
                <img src="./image/pexels.jpg" class="w-full h-48 sm:h-56 rounded-lg object-cover mb-4" alt="Tâche Image">

                <!-- Détails de la Tâche -->
                <h2 class="text-xl sm:text-2xl font-extrabold text-yellow-400 text-center"><%= tache.getDescription() %></h2>

                <!-- Dates -->
                <p class="text-xs sm:text-sm font-medium text-gray-300 mt-2 text-center">
                    <strong>Date Début :</strong> <%= tache.getDate_debut() != null ? tache.getDate_debut() : "Non spécifiée" %>
                </p>
                <p class="text-xs sm:text-sm font-medium text-gray-300 text-center">
                    <strong>Date Fin :</strong> <%= tache.getDate_fin() != null ? tache.getDate_fin() : "Non spécifiée" %>
                </p>

                <!-- Boutons d'Actions -->
                <div class="flex flex-wrap justify-center gap-2 sm:gap-4 mt-4">
                    <a href="Tache?action=edit&id_tache=<%= tache.getId_tache() %>&id_projet=<%= id_projet %>"
                       class="py-2 px-3 sm:px-4 rounded-md text-white bg-blue-600 hover:bg-blue-700 transition-all duration-300 text-xs sm:text-sm font-semibold">
                        Modifier
                    </a>

                    <a href="Tache?action=delete&id_tache=<%= tache.getId_tache() %>&id_projet=<%= id_projet %>"
                       class="py-2 px-3 sm:px-4 rounded-md text-white bg-red-600 hover:bg-red-700 transition-all duration-300 text-xs sm:text-sm font-semibold"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?');">
                        Supprimer
                    </a>
                </div>
            </div>
        </div>
        <%
                    delay++;
                }
            }
        } else {
        %>
        <!-- Message si aucune tâche disponible -->
        <p class="text-yellow-400 text-center col-span-full text-base sm:text-lg animate-fadeIn">Aucune tâche disponible pour ce projet.</p>
        <% } %>
    </div>

    <div class="text-center mt-6">
        <a href="Projet" class="text-yellow-400 hover:text-yellow-500 transition-all duration-300 text-sm sm:text-base">
            Retour à la liste des Projets
        </a>
    </div>

</div>

</body>
</html>
