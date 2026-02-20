// js/supabase-client.js
// Las constantes SUPABASE_URL y SUPABASE_ANON_KEY ya están definidas en config.js
// que se carga antes que este script. Solo creamos el cliente aquí.

const { createClient } = window.supabase;
window.supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

console.log('✅ Supabase Client inicializado');
