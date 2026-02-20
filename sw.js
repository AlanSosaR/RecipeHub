// RecipeHub Service Worker
const CACHE_NAME = 'recipehub-v1';

// App shell — core assets to cache on install
const APP_SHELL = [
    '/',
    '/index.html',
    '/login.html',
    '/recipe-form.html',
    '/recipe-detail.html',
    '/css/styles.css',
    '/css/components.css',
    '/js/config.js',
    '/js/supabase-client.js',
    '/js/auth.js',
    '/js/db.js',
    '/js/utils.js',
    '/js/ocr.js',
    '/js/dashboard.js',
    '/js/recipe-form.js',
    '/js/recipe-detail.js',
    '/assets/icons/icon-192.png',
    '/assets/icons/icon-512.png',
    '/assets/placeholder-recipe.svg'
];

// ── Install: cache app shell ──────────────────────────
self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => cache.addAll(APP_SHELL))
    );
    self.skipWaiting();
});

// ── Activate: remove old caches ───────────────────────
self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(keys =>
            Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k)))
        )
    );
    self.clients.claim();
});

// ── Fetch: network-first for API, cache-first for assets ──
self.addEventListener('fetch', event => {
    const { request } = event;
    const url = new URL(request.url);

    // Skip non-GET and Supabase API calls (always use network for data)
    if (request.method !== 'GET' || url.hostname.includes('supabase.co')) {
        return;
    }

    event.respondWith(
        caches.match(request).then(cached => {
            const network = fetch(request).then(response => {
                // Cache successful responses for static assets
                if (response && response.status === 200 && response.type !== 'opaque') {
                    const clone = response.clone();
                    caches.open(CACHE_NAME).then(cache => cache.put(request, clone));
                }
                return response;
            }).catch(() => cached); // Fall back to cache if offline

            // Return cached immediately if available, otherwise wait for network
            return cached || network;
        })
    );
});
