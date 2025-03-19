<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Projet</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-lg">
    <h2 class="text-2xl font-bold text-center text-gray-800 mb-5">Ajouter un Projet</h2>
    <form action="Projet" method="POST" class="space-y-4">
        <div>
            <label class="block text-gray-600 font-medium">Nom du projet</label>
            <input type="text" name="nom" required class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label class="block text-gray-600 font-medium">Description</label>
            <textarea name="description" required class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-400"></textarea>
        </div>
        <div>
            <label class="block text-gray-600 font-medium">Date de début</label>
            <input type="date" name="date_debut" required class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label class="block text-gray-600 font-medium">Date de fin</label>
            <input type="date" name="date_fin" required class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label class="block text-gray-600 font-medium">Budget (€)</label>
            <input type="number" name="budget" step="0.01" required class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-blue-400">
        </div>
        <div class="flex justify-center">
            <button type="submit" class="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600">Ajouter Projet</button>
        </div>
    </form>
</div>
</body>
</html>
