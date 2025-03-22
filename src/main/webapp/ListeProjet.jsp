<%@ page import="java.util.List, com.construction.Model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom Fade-In Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fadeIn { animation: fadeIn 1s ease-out forwards; }
    </style>
</head>
<body class="bg-black flex justify-center items-center min-h-screen text-white">

<div class="container mx-auto flex flex-col items-center justify-center w-full min-h-screen p-4 sm:p-6 md:p-8 overflow-y-auto">
    <div class="w-full max-w-5xl">
        <h2 class="text-xl sm:text-2xl md:text-3xl font-bold text-center text-yellow-400 mb-5 md:mb-8 animate-fadeIn">Liste des Projets</h2>

        <!-- Bouton Ajouter Projet -->
        <a href="ajouterProjet.jsp"
           class="bg-yellow-400 text-black px-3 sm:px-4 py-1 sm:py-2 rounded-lg block w-max mx-auto text-xs sm:text-sm font-semibold hover:bg-yellow-500 hover:scale-105 transition-all duration-300 mb-6 animate-fadeIn">
            Ajouter un Projet
        </a>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6">
            <%
                List<Projet> projets = (List<Projet>) request.getAttribute("projets");
                if (projets != null && !projets.isEmpty()) {
                    int delay = 0;
                    for (Projet projet : projets) {
            %>
            <div class="group animate-fadeIn" style="animation-delay: <%= delay * 0.2 %>s;">
                <div class="relative flex flex-col items-center w-full max-w-[300px] mx-auto border border-yellow-400 bg-black bg-opacity-90 rounded-xl shadow-lg transition-all duration-500 p-3 sm:p-4 hover:shadow-xl hover:-translate-y-2">
                    <!-- Image du Projet -->
                    <img src="https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                         class="w-full h-40 sm:h-48 rounded-lg object-cover mb-3" alt="Projet Image">

                    <!-- Détails du Projet -->
                    <h2 class="text-base sm:text-lg font-extrabold text-yellow-400 text-center"><%= projet.getNom() %></h2>
                    <p class="text-xs sm:text-sm font-normal mt-1 text-white text-center"><%= projet.getDescription() %></p>
                    <p class="text-sm font-semibold text-yellow-400 mt-1 text-center">Budget (MAD) : <%= projet.getBudget() %></p>

                    <!-- Dates -->
                    <p class="text-xs font-medium text-gray-300 mt-1 text-center">
                        <strong>Date Début :</strong> <%= projet.getDate_debut() != null ? projet.getDate_debut() : "Non spécifiée" %>
                    </p>
                    <p class="text-xs font-medium text-gray-300 text-center">
                        <strong>Date Fin :</strong> <%= projet.getDate_fin() != null ? projet.getDate_fin() : "Non spécifiée" %>
                    </p>

                    <!-- Boutons d'Actions -->
                    <div class="flex flex-col items-center gap-2 mt-3 w-full">
                        <div class="flex justify-center gap-2 w-full">
                            <a href="Projet?action=edit&id_projet=<%= projet.getId_projet() %>"
                               class="py-1 px-2 sm:px-3 rounded-md text-white bg-blue-600 hover:bg-blue-700 transition-all duration-300 text-xs font-semibold flex-1 text-center">
                                Modifier
                            </a>
                            <a href="Projet?action=delete&id_projet=<%= projet.getId_projet() %>"
                               class="py-1 px-2 sm:px-3 rounded-md text-white bg-red-600 hover:bg-red-700 transition-all duration-300 text-xs font-semibold flex-1 text-center"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">
                                Supprimer
                            </a>
                        </div>
                        <a href="Tache?&id_projet=<%= projet.getId_projet() %>"
                           class="py-1 px-2 sm:px-3 rounded-md text-black bg-yellow-400 hover:bg-yellow-500 transition-all duration-300 text-xs font-semibold w-full text-center">
                            Tâches
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
            <p class="text-yellow-400 text-center col-span-full text-sm sm:text-base animate-fadeIn">Aucun projet disponible.</p>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>