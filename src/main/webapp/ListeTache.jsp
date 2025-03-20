<%@ page import="java.util.List, com.construction.Model.Tache" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Tâches</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover" style="background-image: url('./image/construction.jpg');">
<div class="container mx-auto bg-white/80 p-6 shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold text-gray-800 text-center mb-10">Liste des Tâches</h2>

    <a href="ajouterTache.jsp" class="bg-transparent border border-green-500 text-green-500 px-4 py-2 rounded block w-max mx-auto hover:bg-green-500 hover:text-white transition-all duration-300">
        Ajouter une Tâche
    </a>

    <div class="grid lg:grid-cols-3 md:grid-cols-2 grid-cols-1 gap-6 mt-10">
        <% List<Tache> taches = (List<Tache>) request.getAttribute("taches");
            if (taches != null && !taches.isEmpty()) {
                for (Tache tache : taches) { %>
        <div class="group">
            <div class="relative flex flex-col items-center justify-center w-[350px] h-auto max-w-full border border-gray-100 bg-white rounded-lg shadow-lg transition-all duration-500 p-5 transform hover:scale-105 hover:shadow-xl">
                <h2 class="text-xl font-extrabold text-blue-800 text-center"><%= tache.getDescription() %></h2>
                <p class="text-sm text-gray-600 mt-2 text-center">Date de début : <%= tache.getDate_debut() %></p>
                <p class="text-sm text-gray-600 text-center">Date de fin : <%= tache.getDate_fin() %></p>

                <div class="flex justify-center gap-4 mt-4">
                    <a href="Tache?action=edit&id_tache=<%= tache.getId_tache() %>" class="py-2 px-4 rounded-md text-white bg-blue-500 hover:bg-blue-600 transition-all duration-300">
                        Modifier
                    </a>
                    <a href="Tache?action=delete&id_tache=<%= tache.getId_tache() %>" class="py-2 px-4 rounded-md text-white bg-red-500 hover:bg-red-600 transition-all duration-300">
                        Supprimer
                    </a>
                </div>
            </div>
        </div>
        <% }
        } else { %>
        <p class="text-gray-700 text-center col-span-full">Aucune tâche disponible.</p>
        <% } %>
    </div>
</div>
</body>
</html>
