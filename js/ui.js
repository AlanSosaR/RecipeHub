// UI Helper functions

window.applyTheme = function (theme) {
    document.documentElement.setAttribute('data-theme', theme);
    const icon = document.getElementById('theme-icon');
    if (icon) {
        icon.textContent = theme === 'dark' ? 'light_mode' : 'dark_mode';
    }
    localStorage.setItem('theme', theme);
}

window.initTheme = function () {
    const saved = localStorage.getItem('theme') ||
        (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    window.applyTheme(saved);
}

window.toggleDarkMode = function () {
    const current = document.documentElement.getAttribute('data-theme') || 'light';
    window.applyTheme(current === 'dark' ? 'light' : 'dark');
}

window.setupMobileMenu = function () {
    const btnMenuMobile = document.getElementById('btnMenuMobile');
    const sidebar = document.querySelector('.sidebar');
    const overlay = document.getElementById('sidebar-overlay');

    if (sidebar) {
        // Toggle mobile
        if (btnMenuMobile) {
            btnMenuMobile.addEventListener('click', (e) => {
                e.stopPropagation();
                sidebar.classList.toggle('active');
            });
        }

        // Close on overlay click
        if (overlay) {
            overlay.addEventListener('click', () => {
                sidebar.classList.remove('active');
            });
        }

        // Close on click outside (mobile)
        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 991) {
                if (!sidebar.contains(e.target) && (!btnMenuMobile || !btnMenuMobile.contains(e.target)) && sidebar.classList.contains('active')) {
                    sidebar.classList.remove('active');
                }
            }
        });
    }
}

window.closeSidebar = function () {
    const sidebar = document.querySelector('.sidebar');
    if (sidebar) sidebar.classList.remove('active');
}

// Global user UI updater
window.updateGlobalUserUI = function () {
    if (!window.authManager || !window.authManager.currentUser) return;
    const user = window.authManager.currentUser;

    // Update greeting
    const sidebarGreeting = document.getElementById('sidebar-user-greeting');
    if (sidebarGreeting) {
        const chefText = window.i18n ? window.i18n.t('chefGreeting') : 'Chef';
        sidebarGreeting.textContent = `${chefText} ${user.first_name || ''}`;
    }

    // Update initials
    const sidebarInitials = document.getElementById('sidebar-user-initials');
    if (sidebarInitials) {
        const initials = (user.first_name?.[0] || 'C') + (user.last_name?.[0] || 'H');
        sidebarInitials.textContent = initials.toUpperCase();
    }
}

// Global slim sidebar toggle (desktop)
window.toggleSlimSidebar = function () {
    const sidebar = document.getElementById('main-sidebar');
    if (!sidebar) return;

    sidebar.classList.toggle('slim');
    const isSlim = sidebar.classList.contains('slim');
    localStorage.setItem('recipehub_sidebar_slim', isSlim);
}

// Global init for sidebar state
window.initSidebarState = function () {
    const sidebar = document.getElementById('main-sidebar');
    if (!sidebar) return;

    const isSlim = localStorage.getItem('recipehub_sidebar_slim') === 'true';
    if (isSlim) sidebar.classList.add('slim');
}
