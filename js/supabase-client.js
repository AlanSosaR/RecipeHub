// js/supabase-client.js
// Inicializa el cliente de Supabase usando la librería cargada via CDN (window.supabase)
// NO usar import/export aquí: los scripts se cargan como clásicos, no como módulos ES.

const SUPABASE_URL = 'https://fsgfrqrerddmopojjcsw.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_ny8r880V6IRSMABnHVfzJw_0in8E-2z';

// La librería CDN expone supabase.createClient en window
const { createClient } = window.supabase;
window.supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

console.log('✅ Supabase Client inicializado');
