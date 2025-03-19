<%@ page import="java.util.List, com.construction.Model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover" style="background-image: url('./image/salle de sport.jpg');"><div class="container mx-auto bg-white p-6 shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold text-gray-800 text-center mb-10">Liste des Projets</h2>
    <a href="ajouterProjet.jsp" class="bg-blue-500 text-white px-4 py-2 rounded block w-max mx-auto">Ajouter un Projet</a>
    <div class="grid lg:grid-cols-3 md:grid-cols-2 grid-cols-1 gap-6 mt-10">
        <% List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            for (Projet projet : projets) { %>
        <div class="group">
            <div class="relative flex items-start justify-center w-[350px] h-[300px] max-w-full border border-gray-100 bg-white rounded-lg shadow-lg hover:h-[400px] transition-all duration-500">
                <div class="absolute top-5 w-80 h-56 rounded-lg bg-neutral-800 group-hover:-top-28 group-hover:scale-75 group-hover:shadow transition-all duration-500">
                    <img src="assets/images/project-placeholder.png" class="absolute rounded-xl top-0 left-0 w-full h-full object-cover" alt="Projet Image">
                </div>
                <div class="px-8 absolute top-64 w-full h-9 text-center overflow-hidden group-hover:top-32 group-hover:h-60 transition-all duration-500">
                    <h2 class="text-2xl font-extrabold text-green-800"><%= projet.getNom() %></h2>
                    <p class="text-base font-normal mt-4 text-neutral-950"><%= projet.getDescription() %></p>
                    <p class="text-lg font-semibold text-gray-700 mt-2">Budget: €<%= projet.getBudget() %></p>
                    <div class="flex justify-center gap-4 mt-4">
                        <a href="Projet?action=edit&id_projet=<%= projet.getId_projet() %>" class="py-2 px-4 rounded-md text-white bg-blue-500 hover:bg-blue-600">Modifier</a>
                        <a href="Projet?action=delete&id_projet=<%= projet.getId_projet() %>" class="py-2 px-4 rounded-md text-white bg-red-500 hover:bg-red-600">Supprimer</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
