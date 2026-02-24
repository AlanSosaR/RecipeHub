import { supabase } from './supabase-client.js';
import { auth } from './auth.js';
import { toggleDarkMode } from './ui.js';
import { showToast } from './app.js';

export async function initProfile() {
    const backBtn = document.getElementById('btn-profile-back');
    if (backBtn) backBtn.addEventListener('click', () => window.navigateTo('dashboard'));

    const user = await auth.getUser();
    if (!user) { window.navigateTo('login'); return; }

    // Cargar datos actuales
    const { data: profile } = await supabase
        .from('users')
        .select('*')
        .eq('auth_user_id', user.id)
        .single();

    if (profile) {
        updateProfileUI(profile, user.email);
    }

    // Estadísticas
    updateStats();

    // Bindings
    setupProfileListeners(user, profile);
}

function updateProfileUI(profile, email) {
    const unnamedTxt = window.i18n ? window.i18n.t('profileUnnamed') : 'Usuario sin nombre';
    document.getElementById('profile-full-name').textContent = `${profile.first_name || ''} ${profile.last_name || ''}`.trim() || unnamedTxt;
    document.getElementById('profile-email').textContent = email;
    if (profile.collection_name) {
        document.getElementById('profile-collection').textContent = `🍽️ ${profile.collection_name}`;
    }
    const avatarImg = document.getElementById('profile-avatar-img');
    const placeholder = avatarImg.nextElementSibling;
    if (profile.avatar_url) {
        avatarImg.src = profile.avatar_url;
        avatarImg.style.display = 'block';
        placeholder.style.display = 'none';
    } else {
        avatarImg.style.display = 'none';
        placeholder.style.display = 'flex';
    }
}

async function updateStats() {
    const { count: recipeCount } = await supabase.from('recipes').select('*', { count: 'exact', head: true }).eq('is_active', true);
    document.getElementById('stat-recipes').textContent = recipeCount || 0;

    const { count: favCount } = await supabase.from('recipes').select('*', { count: 'exact', head: true }).eq('is_favorite', true).eq('is_active', true);
    document.getElementById('stat-favorites').textContent = favCount || 0;

    const { data: cookedData } = await supabase.from('recipes').select('times_cooked');
    const totalCooked = cookedData ? cookedData.reduce((acc, curr) => acc + (curr.times_cooked || 0), 0) : 0;
    document.getElementById('stat-cooked').textContent = totalCooked;
}

function setupProfileListeners(user, profile) {
    // Logout
    const logoutBtn = document.getElementById('btn-logout-profile');
    if (logoutBtn) logoutBtn.onclick = () => auth.signOut();

    // Change Avatar
    const changeAvatarBtn = document.getElementById('btn-change-avatar');
    const avatarInput = document.getElementById('avatar-file-input');
    if (changeAvatarBtn && avatarInput) {
        changeAvatarBtn.onclick = () => avatarInput.click();
        avatarInput.onchange = async (e) => {
            const file = e.target.files[0];
            if (file) {
                const url = await uploadAvatar(file, user.id);
                if (url) {
                    await supabase.from('users').update({ avatar_url: url }).eq('auth_user_id', user.id);
                    document.getElementById('profile-avatar-img').src = url;
                    document.getElementById('profile-avatar-img').style.display = 'block';
                    document.getElementById('profile-avatar-img').nextElementSibling.style.display = 'none';
                    const photoMsg = window.i18n ? window.i18n.t('profilePhotoUpdated') : '¡Foto actualizada!';
                    showToast(photoMsg);
                }
            }
        };
    }

    // Edit Name / Profile
    const editNameBtn = document.getElementById('btn-edit-name');
    const editProfileBtn = document.getElementById('btn-profile-edit');
    const handleEdit = async () => {
        const firstLabel = window.i18n ? window.i18n.t('profileEditFirstName') : 'Nombre:';
        const lastLabel = window.i18n ? window.i18n.t('profileEditLastName') : 'Apellido:';
        const collLabel = window.i18n ? window.i18n.t('profileEditCollection') : 'Nombre de tu colección:';

        const newFirst = prompt(firstLabel, profile.first_name || '');
        const newLast = prompt(lastLabel, profile.last_name || '');
        const newColl = prompt(collLabel, profile.collection_name || 'Mi colección personal');

        if (newFirst !== null && newLast !== null) {
            const { error } = await supabase.from('users')
                .update({
                    first_name: newFirst,
                    last_name: newLast,
                    collection_name: newColl,
                    updated_at: new Date().toISOString()
                })
                .eq('auth_user_id', user.id);

            if (!error) {
                profile.first_name = newFirst;
                profile.last_name = newLast;
                profile.collection_name = newColl;
                updateProfileUI(profile, user.email);
                const updateMsg = window.i18n ? window.i18n.t('profileUpdated') : 'Perfil actualizado';
                showToast(updateMsg);
            }
        }
    };
    if (editNameBtn) editNameBtn.onclick = handleEdit;
    if (editProfileBtn) editProfileBtn.onclick = handleEdit;

    // Export Recipes
    const exportBtn = document.getElementById('btn-export-recipes');
    if (exportBtn) {
        exportBtn.onclick = async () => {
            const { data: recipes } = await supabase.from('recipes').select('*, ingredients(*), preparation_steps(*)').eq('is_active', true);
            const blob = new Blob([JSON.stringify(recipes, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `recipes_hub_export_${new Date().toISOString().split('T')[0]}.json`;
            a.click();
            const exportMsg = window.i18n ? window.i18n.t('profileExported') : 'Recetas exportadas';
            showToast(exportMsg);
        };
    }

    // Theme Toggle
    const themeBtn = document.getElementById('btn-theme-toggle');
    if (themeBtn) {
        themeBtn.onclick = () => {
            toggleDarkMode();
            updateThemeIcon();
        };
        updateThemeIcon();
    }
}

function updateThemeIcon() {
    const icon = document.querySelector('#btn-theme-toggle .profile-menu-icon');
    const isDark = document.documentElement.classList.contains('dark');
    if (icon) {
        icon.textContent = isDark ? 'light_mode' : 'dark_mode';
    }
}

async function uploadAvatar(file, userId) {
    const fileExt = file.name.split('.').pop();
    const filePath = `${userId}/avatar.${fileExt}`;

    const { error: uploadError } = await supabase.storage
        .from('avatars')
        .upload(filePath, file, { upsert: true });

    if (uploadError) {
        console.error('Error uploading avatar:', uploadError);
        const uploadErr = window.i18n ? window.i18n.t('profileUploadError') : 'Error al subir imagen';
        showToast(uploadErr, 'error');
        return null;
    }

    const { data } = supabase.storage.from('avatars').getPublicUrl(filePath);
    return data.publicUrl;
}
