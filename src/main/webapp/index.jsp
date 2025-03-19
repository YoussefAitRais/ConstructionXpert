<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Construction Company</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<!-- Header Section -->
<header class="bg-blue-900 text-white py-6">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-4xl font-bold">
        </h1>
        <nav>
            <ul class="flex space-x-8 text-lg">
                <li><a href="#about" class="hover:text-yellow-400">Home</a></li>
                <li><a href="Projet" class="hover:text-yellow-400">Projet</a></li>
                <li><a href="#contact" class="hover:text-yellow-400">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- Hero Section -->
<section class="bg-cover bg-center h-96"
         >
    <div class="bg-black bg-opacity-50 h-full flex items-center justify-center text-center text-white">
        <div>
            <h2 class="text-5xl font-bold mb-4">Building Excellence, One Project at a Time</h2>
            <p class="text-xl mb-8">Delivering durable, high-quality construction solutions for your home and business needs.</p>
            <a href="Projet" class="bg-yellow-500 text-black px-6 py-3 rounded-lg text-xl hover:bg-yellow-400">Start Your Project</a>
        </div>
    </div>
</section>

<!-- About Us Section -->
<section id="about" class="py-16 bg-white">
    <div class="container mx-auto text-center">
        <h3 class="text-3xl font-bold mb-4">About Us</h3>
        <p class="text-lg max-w-2xl mx-auto">
            We are a construction company dedicated to building sustainable, high-quality projects. From residential to commercial, we have the expertise and experience to deliver exceptional results every time.
        </p>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="py-16 bg-gray-200">
    <div class="container mx-auto text-center">
        <h3 class="text-3xl font-bold mb-8">Our Services</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="bg-white p-6 shadow-lg rounded-lg">
                <h4 class="text-2xl font-semibold mb-4">Residential Construction</h4>
                <p class="text-lg">We provide full-service construction for residential homes, ensuring comfort, style, and durability in every project.</p>
            </div>
            <div class="bg-white p-6 shadow-lg rounded-lg">
                <h4 class="text-2xl font-semibold mb-4">Commercial Construction</h4>
                <p class="text-lg">From office buildings to retail spaces, we specialize in commercial construction that meets your business needs and expectations.</p>
            </div>
            <div class="bg-white p-6 shadow-lg rounded-lg">
                <h4 class="text-2xl font-semibold mb-4">Renovations & Remodeling</h4>
                <p class="text-lg">Transform your space with our renovation and remodeling services, bringing new life to your existing property.</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section id="contact" class="py-16 bg-blue-900 text-white">
    <div class="container mx-auto text-center">
        <h3 class="text-3xl font-bold mb-4">Contact Us</h3>
        <p class="text-lg mb-8">We would love to hear from you! Reach out to us for a free consultation or any inquiries.</p>
        <form action="/submitForm" method="post" class="max-w-2xl mx-auto">
            <input type="text" name="name" class="w-full p-4 mb-4 rounded-lg" placeholder="Your Name" required>
            <input type="email" name="email" class="w-full p-4 mb-4 rounded-lg" placeholder="Your Email" required>
            <textarea name="message" class="w-full p-4 mb-4 rounded-lg" rows="4" placeholder="Your Message" required></textarea>
            <button type="submit" class="bg-yellow-500 text-black px-8 py-3 rounded-lg text-lg hover:bg-yellow-400">Send Message</button>
        </form>
    </div>
</section>

<!-- Footer Section -->
<footer class="bg-gray-800 text-white py-6">
    <div class="container mx-auto text-center">
        <p>&copy; 2025 <%= request.getAttribute("companyName") != null ? request.getAttribute("companyName") : "BuildPro Construction" %>. All rights reserved.</p>
        <p>Contact us: <%= request.getAttribute("contactEmail") != null ? request.getAttribute("contactEmail") : "info@buildpro.com" %></p>
    </div>
</footer>

</body>
</html>
