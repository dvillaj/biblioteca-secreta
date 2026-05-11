// Actualizar la hora del servidor
function updateServerTime() {
    const timeElement = document.getElementById('server-time');
    const now = new Date();
    
    const options = {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: false
    };
    
    timeElement.textContent = now.toLocaleString('es-ES', options);
}

// Actualizar hora al cargar la página
updateServerTime();

// Actualizar hora cada segundo
setInterval(updateServerTime, 1000);

// Efecto hover en las tarjetas de características
document.querySelectorAll('.feature-card').forEach(card => {
    card.addEventListener('mouseenter', function() {
        this.style.backgroundColor = '#e8eef8';
    });
    
    card.addEventListener('mouseleave', function() {
        this.style.backgroundColor = '#f8f9fa';
    });
});

// Mensaje en la consola
console.log('%c¡Bienvenido a Biblioteca Secreta!', 'font-size: 20px; font-weight: bold; color: #667eea;');
console.log('%cContenedor Docker funcionando correctamente ✅', 'font-size: 14px; color: #28a745;');
