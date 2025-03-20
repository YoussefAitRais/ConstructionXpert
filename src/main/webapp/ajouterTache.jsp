<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Ajouter une Tâche</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex flex-col bg-no-repeat bg-cover items-center justify-center" style="background-image: url('./image/tracteur.jpg');">

<div class="bg-white/90 p-6 shadow-lg rounded-lg w-full max-w-lg">
    <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Ajouter une Tâche</h2>

    <form action="Tache" method="post" class="flex flex-col gap-4">
        <!-- Description -->
        <div>
            <label for="description" class="text-gray-700 font-medium">Description :</label>
            <input type="text" id="description" name="description" required
                   class="w-full px-4 py-2 mt-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all">
        </div>

        <!-- Date Début -->
        <div>
            <label for="date_debut" class="text-gray-700 font-medium">Date de début :</label>
            <input type="date" id="date_debut" name="date_debut" required
                   class="w-full px-4 py-2 mt-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all">
        </div>

        <!-- Date Fin -->
        <div>
            <label for="date_fin" class="text-gray-700 font-medium">Date de fin :</label>
            <input type="date" id="date_fin" name="date_fin" required
                   class="w-full px-4 py-2 mt-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all">
        </div>

        <!-- Submit Button -->
        <button type="submit"
                class="mt-4 bg-green-500 text-white py-2 rounded-lg font-semibold hover:bg-green-600 transition-all duration-300">
            Ajouter la Tâche
        </button>

        <!-- Back to Task List -->
        <a href="ListeTache.jsp"
           class="text-center text-blue-500 hover:text-blue-700 transition-all duration-300">
            Retour à la liste des tâches
        </a>
    </form>
</div>

</body>
</html>
