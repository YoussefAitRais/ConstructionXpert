<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.construction.Model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Modifier une Tâche</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="w-full min-h-screen flex items-center justify-center bg-no-repeat bg-cover"
      style="background-image: url('./image/construction.jpg');">
<div class="bg-white/80 p-8 rounded-lg shadow-lg w-96">

  <%
    Tache tache = (Tache) request.getAttribute("tache");
    int id_projet = request.getParameter("id_projet") != null ? Integer.parseInt(request.getParameter("id_projet")) : -1;
  %>

  <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Modifier la Tâche</h2>

  <form action="Tache" method="post" class="space-y-4">
    <input type="hidden" name="id_tache" value="<%= tache.getId_tache() %>">
    <input type="hidden" name="id_projet" value="<%= id_projet %>">
    <input type="hidden" name="action" value="edit">

    <div>
      <label class="block text-gray-700">Description</label>
      <input type="text" name="description" required
             value="<%= tache.getDescription() %>"
             class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <div>
      <label class="block text-gray-700">Date de début</label>
      <input type="date" name="date_debut" required
             value="<%= tache.getDate_debut() %>"
             class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <div>
      <label class="block text-gray-700">Date de fin</label>
      <input type="date" name="date_fin" required
             value="<%= tache.getDate_fin() %>"
             class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
    </div>

    <button type="submit"
            class="w-full bg-blue-500 text-white py-2 rounded-md hover:bg-blue-600 transition duration-300">
      Enregistrer les modifications
    </button>
  </form>

  <!-- Lien de retour -->
  <div class="text-center mt-4">
    <a href="Tache?id_projet=<%= id_projet %>"
       class="text-gray-600 hover:text-gray-800 transition duration-300">
      Annuler et retourner à la liste
    </a>
  </div>
</div>
</body>
</html>
