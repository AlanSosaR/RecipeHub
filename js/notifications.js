/**
 * NotificationManager - RecipeHub
 * Maneja las notificaciones de archivos compartidos
 */
class NotificationManager {
    constructor() {
        this.notifications = this.loadNotifications();
        this.init();
    }

    init() {
        this.menu = document.getElementById('notifications-menu');
        this.badge = document.getElementById('notifications-badge');
        this.list = document.getElementById('notifications-list');

        this.updateBadge();

        // Cerrar menú al hacer clic fuera
        document.addEventListener('mousedown', (e) => {
            if (this.menu && !this.menu.classList.contains('hidden')) {
                const btn = document.getElementById('btn-notifications');
                if (!this.menu.contains(e.target) && !btn.contains(e.target)) {
                    this.menu.classList.add('hidden');
                }
            }
        });
    }

    loadNotifications() {
        const saved = localStorage.getItem('recipehub_notifications');
        return saved ? JSON.parse(saved) : [];
    }

    saveNotifications() {
        localStorage.setItem('recipehub_notifications', JSON.stringify(this.notifications));
        this.updateBadge();
    }

    updateBadge() {
        if (!this.badge) return;
        if (this.notifications.length > 0) {
            this.badge.classList.remove('hidden');
        } else {
            this.badge.classList.add('hidden');
        }
    }

    toggleMenu(event) {
        if (event) event.stopPropagation();
        if (!this.menu) return;

        const isHidden = this.menu.classList.contains('hidden');
        if (isHidden) {
            this.renderMenu();
            this.menu.classList.remove('hidden');
        } else {
            this.menu.classList.add('hidden');
        }
    }

    addNotification(recipe, permission) {
        const notification = {
            id: Date.now().toString(),
            recipeId: recipe.id,
            recipeName: recipe.name_es,
            permission: permission, // 'view' o 'add'
            timestamp: new Date().toISOString(),
            sender: 'Wildryn Castellanos' // Mock sender
        };

        this.notifications.unshift(notification);
        this.saveNotifications();
        this.updateBadge();

        window.utils.showToast(`Nueva notificación: ${recipe.name_es}`, 'info');
    }

    renderMenu() {
        if (!this.list) return;

        if (this.notifications.length === 0) {
            this.list.innerHTML = `
                <div class="notifications-empty">
                    <p>No tienes notificaciones nuevas</p>
                </div>
            `;
            return;
        }

        this.list.innerHTML = this.notifications.map(n => `
            <div class="notification-item" onclick="window.notificationManager.handleNotificationClick('${n.id}')">
                <div class="notification-icon-container">
                    <span class="material-symbols-outlined">${n.permission === 'add' ? 'library_add' : 'visibility'}</span>
                </div>
                <div class="notification-content">
                    <strong class="notification-title">${n.sender} compartió una receta</strong>
                    <p class="notification-desc">"${n.recipeName}"</p>
                    <div class="notification-meta">
                        ${n.permission === 'add' ?
                '<button class="btn-notif-action btn-notif-primary">Conservar y abrir</button>' :
                '<button class="btn-notif-action btn-notif-secondary">Solo ver</button>'}
                    </div>
                </div>
            </div>
        `).join('');
    }

    async handleNotificationClick(notificationId) {
        const index = this.notifications.findIndex(n => n.id === notificationId);
        if (index === -1) return;

        const n = this.notifications[index];

        // Si el permiso es 'add', simulamos que se agrega a sus recetas
        if (n.permission === 'add') {
            window.utils.showToast(`Receta "${n.recipeName}" agregada a tu recetario`, 'success');
            // Aquí se podría llamar a una función de db para clonar la receta
            // Por ahora solo simularemos que se procesó
        }

        // Abrir la receta
        window.location.href = `recipe-detail.html?id=${n.recipeId}`;

        // Quitar la notificación
        this.notifications.splice(index, 1);
        this.saveNotifications();
        this.menu.classList.add('hidden');
    }

    // Método para simular la recepción (usado por el ShareModal para el demo)
    simulateNotificationReceived(recipe, permission) {
        this.addNotification(recipe, permission);
    }
}

// Inicializar y exponer globalmente
window.addEventListener('DOMContentLoaded', () => {
    window.notificationManager = new NotificationManager();
});
