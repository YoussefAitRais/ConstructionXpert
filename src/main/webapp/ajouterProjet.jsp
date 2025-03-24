<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Projet</title>
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
        <div class="w-full max-w-xs border border-yellow-400 rounded-xl p-4 sm:p-5 bg-black bg-opacity-90"> <!-- Reduced max width to max-w-xs, added border and rounded-xl -->
            <h2 class="text-base sm:text-lg md:text-xl font-bold text-center text-yellow-400 mb-3 md:mb-4">Ajouter un Projet</h2>
            <form action="Projet" method="POST" class="space-y-2">
                <div>
                    <label class="block text-yellow-400 font-medium text-xs">Nom du projet</label>
                    <input type="text" name="nom" required
                           class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
                </div>
                <div>
                    <label class="block text-yellow-400 font-medium text-xs">Description</label>
                    <textarea name="description" required
                              class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 h-16 sm:h-20 text-xs"></textarea>
                </div>
                <div>
                    <label class="block text-yellow-400 font-medium text-xs">Date de début</label>
                    <input type="date" name="date_debut" required
                           class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
                </div>
                <div>
                    <label class="block text-yellow-400 font-medium text-xs">Date de fin</label>
                    <input type="date" name="date_fin" required
                           class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
                </div>
                <div>
                    <label class="block text-yellow-400 font-medium text-xs">Budget (€)</label>
                    <input type="number" name="budget" step="0.01" required
                           class="w-full px-2 py-1 border border-yellow-400 rounded-lg bg-gray-900 text-white focus:ring-2 focus:ring-yellow-400 focus:outline-none transition-all duration-300 text-xs">
                </div>
                <div class="flex justify-center">
                    <button type="submit"
                            class="bg-yellow-400 text-black px-2 sm:px-3 py-1 rounded-lg font-semibold text-xs hover:bg-yellow-500 hover:scale-105 transition-all duration-300 flex items-center">
                        Ajouter Projet
                        <svg class="w-3 h-3 ml-1 sm:ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                        </svg>
                    </button>
                </div>

            </form>
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