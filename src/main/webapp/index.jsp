<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= request.getAttribute("companyName") != null ? request.getAttribute("companyName") : "BuildPro Construction" %></title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom Animation for Fade In */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fadeIn { animation: fadeIn 1s ease-out forwards; }
    </style>
</head>
<body class="bg-black text-white font-sans">

<!-- Navbar -->
<header class="bg-black py-4 fixed w-full top-0 z-10 shadow-lg transition-all duration-300">
    <div class="container mx-auto px-4 flex justify-between items-center">
        <h1 class="text-3xl font-bold text-yellow-400 hover:text-yellow-300 transition-colors duration-300">
            <%= request.getAttribute("companyName") != null ? request.getAttribute("companyName") : "BuildPro" %>
        </h1>
        <nav class="hidden md:flex space-x-6">
            <a href="#home" class="text-lg hover:text-yellow-400 transition-colors duration-300">Home</a>
            <a href="Projet" class="text-lg bg-yellow-400 text-black px-4 py-2 rounded-lg hover:bg-yellow-500 transition-all duration-300">Projet</a>
            <a href="#services" class="text-lg hover:text-yellow-400 transition-colors duration-300">Services</a>
        </nav>
        <!-- Mobile Menu Button -->
        <button id="menu-btn" class="md:hidden text-yellow-400 focus:outline-none">
            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div>
    <!-- Mobile Menu -->
    <div id="mobile-menu" class="hidden md:hidden bg-black text-center py-4">
        <a href="#home" class="block py-2 hover:text-yellow-400 transition-colors duration-300">Home</a>
        <a href="Projet" class="block py-2 bg-yellow-400 text-black mx-4 rounded-lg hover:bg-yellow-500 transition-all duration-300">Projet</a>
        <a href="#services" class="block py-2 hover:text-yellow-400 transition-colors duration-300">Services</a>
    </div>
</header>

<!-- Hero Section -->
<section id="home" class="bg-cover bg-center h-screen flex items-center justify-center" style="background-image: url('https://images.unsplash.com/photo-1503387762-592deb58ef4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
    <div class="bg-black bg-opacity-70 h-full w-full flex items-center justify-center text-center animate-fadeIn">
        <div>
            <h2 class="text-4xl md:text-6xl font-bold mb-4 text-yellow-400">Building Your Future</h2>
            <p class="text-lg md:text-xl mb-8 max-w-2xl mx-auto">We deliver top-quality construction services for residential and commercial projects.</p>
            <a href="Projet" class="bg-yellow-400 text-black px-6 py-3 rounded-lg text-lg font-semibold hover:bg-yellow-500 hover:scale-105 transition-all duration-300">Start Your Project</a>
        </div>
    </div>
</section>

<!-- JavaScript for Mobile Menu Toggle -->
<script>
    const menuBtn = document.getElementById('menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');

    menuBtn.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });
</script>

</body>
</html>