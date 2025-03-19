<%@ page import="java.util.List, com.construction.Model.Projet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">
<div class="container mx-auto bg-white p-6 shadow-lg rounded-lg">
    <h2 class="text-2xl font-bold text-gray-800 mb-4">Liste des Projets</h2>
    <a href="ajouterProjet.jsp" class="bg-blue-500 text-white px-4 py-2 rounded">Ajouter un Projet</a>
    <table class="table-auto w-full mt-4 border-collapse">
        <thead>
        <tr class="bg-gray-200">
            <th>ID</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Budget (€)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            for (Projet projet : projets) {
        %>
        <tr class="border-b">
            <td><%= projet.getId_projet() %></td>
            <td><%= projet.getNom() %></td>
            <td><%= projet.getDescription() %></td>
            <td><%= projet.getBudget() %></td>
            <td>
                <a href="Projet?action=edit&id_projet=<%= projet.getId_projet() %>" class="text-blue-500">Modifier</a> |
                <a href="Projet?action=delete&id_projet=<%= projet.getId_projet() %>" class="text-red-500">Supprimer</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
