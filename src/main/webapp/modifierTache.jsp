<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.construction.Model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Modifier une Tâche</title>
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

<div class="container mx-auto flex flex-col lg:flex-row items-stretch justify-center gap-0 w-full h-screen overflow-hidden">

  <!-- Left Section (Form) -->
  <div class="bg-black bg-opacity-80 w-full lg:w-1/2 p-4 sm:p-6 md:p-8 flex flex-col justify-center items-center animate-fadeIn">
    <div class="w-full max-w-xs border border-yellow-400 rounded-xl p-4 sm:p-5 bg-black bg-opacity-90">
      <%
        Tache tache = (Tache) request.getAttribute("tache");
        Integer id_projet = (Integer) request.getAttribute("id_projet");

        // Handle null case
        int id_tache = (tache != null) ? tache.getId_tache() : -1;
        String description = (tache != null) ? tache.getDescription() : "";
        String dateDebut = (tache != null && tache.getDate_debut() != null) ? tache.getDate_debut().toString() : "";
        String dateFin = (tache != null && tache.getDate_fin() != null) ? tache.getDate_fin().toString() : "";
      %>
      <h2 class="text-base sm:text-lg md:text-xl font-bold text-center text-yellow-400 mb-3 md:mb-4">Modifier la Tâche</h2>
      <form action="Tache" method="POST" class="space-y-2">
        <input type="hidden" name="id_tache" value="<%= id_tache %>">
        <input type="hidden" name="id_projet" value="<%= id_projet != null ? id_projet : "" %>">
        <div>
          <label class="block text-yellow-400 font-medium text-xs">Description</label>
          <input type="text" name="description" required value="<%= description %>"
                 class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
        </div>
        <div>
          <label class="block text-yellow-400 font-medium text-xs">Date de début</label>
          <input type="date" name="date_debut" required value="<%= dateDebut %>"
                 class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
        </div>
        <div>
          <label class="block text-yellow-400 font-medium text-xs">Date de fin</label>
          <input type="date" name="date_fin" required value="<%= dateFin %>"
                 class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
        </div>
        <div class="flex justify-center">
          <button type="submit"
                  class="bg-yellow-400 text-black px-2 sm:px-3 py-1 rounded-lg font-semibold text-xs hover:bg-yellow-500 hover:scale-105 transition-all duration-300 flex items-center">
            Enregistrer les modifications
            <svg class="w-3 h-3 ml-1 sm:ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
            </svg>
          </button>
        </div>
      </form>
      <!-- Lien de retour -->
      <div class="text-center mt-3">
        <a href="Tache?id_projet=<%= id_projet != null ? id_projet : "" %>"
           class="text-yellow-400 hover:text-yellow-500 transition duration-300 text-xs">
          Annuler et retourner à la liste
        </a>
      </div>
    </div>
  </div>

  <!-- Right Section (Image) -->
  <div class="hidden lg:block w-full lg:w-1/2 animate-fadeIn" style="animation-delay: 0.2s;">
    <img src="https://images.pexels.com/photos/159306/construction-site-build-construction-work-159306.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
         alt="Construction Site" class="w-full h-full object-cover">
  </div>

</div>

</body>
</html>