/**
 * RecipeDetailManager - RecipeHub Personal
 * Maneja la lógica de visualización de detalles de una receta,
 * incluyendo pestañas, carga de datos y acciones (favoritos, editar).
 */
class RecipeDetailManager {
    constructor() {
        const params = new URLSearchParams(window.location.search);
        this.recipeId = params.get('id');
        this.permission = params.get('permission'); // 'view' o 'view_and_copy'
        this.currentRecipe = null;

        if (!this.recipeId) {
            window.location.replace('index.html');
            return;
        }

        this.init();
    }

    async init() {
        // 1. Verificar autenticación
        const isAuth = await window.authManager.checkAuth();
        if (!isAuth) {
            window.location.replace('index.html');
            return;
        }

        // 2. Cargar datos
        await this.loadRecipeData();

        // 3. Setup de la interfaz
        this.setupEventListeners();
    }

    async loadRecipeData() {
        try {
            const result = await window.db.getRecipeById(this.recipeId);

            if (!result.success) {
                console.error('Error cargando receta:', result.error);
                window.showToast(window.i18n ? window.i18n.t('noRecipesTitle') : 'Receta no encontrada', 'error');
                return;
            }

            this.currentRecipe = result.recipe;
            this.renderRecipe();

        } catch (error) {
            console.error('Error en loadRecipeData:', error);
        }
    }

    renderRecipe() {
        const recipe = this.currentRecipe;

        // Hero Background
        const heroEl = document.getElementById('recipeHero');
        const appEl = document.getElementById('app');

        if (recipe.primaryImage) {
            heroEl.style.backgroundImage = `url(${recipe.primaryImage})`;
            heroEl.classList.remove('no-image');
            if (appEl) appEl.classList.remove('no-image');
            heroEl.style.display = 'block';
        } else {
            heroEl.style.backgroundImage = 'none';
            heroEl.classList.add('no-image');
            if (appEl) appEl.classList.add('no-image');
            heroEl.style.display = 'block';
        }

        setTimeout(() => {
            heroEl.style.opacity = '1';
        }, 50);

        // Text data
        const titleMobile = document.getElementById('recipeTitleMobile');
        const titleDesktop = document.getElementById('recipeTitleDesktop');

        const isEn = window.i18n && window.i18n.getLang() === 'en';
        if (titleMobile) titleMobile.textContent = isEn ? (recipe.name_en || recipe.name_es) : recipe.name_es;
        if (titleDesktop) titleDesktop.textContent = isEn ? (recipe.name_en || recipe.name_es) : recipe.name_es;

        const desc = isEn ? (recipe.description_en || recipe.description_es) : recipe.description_es;
        document.getElementById('recipeDescription').textContent = desc || (window.i18n ? window.i18n.t('noDescription') : 'Sin descripción');

        // Pantry Content
        const pantrySection = document.getElementById('pantrySection');
        const pantryEl = document.getElementById('recipePantry');
        const pantry = isEn ? (recipe.pantry_en || recipe.pantry_es) : recipe.pantry_es;
        if (pantry) {
            pantrySection.style.display = 'block';
            pantryEl.textContent = pantry;
        } else {
            pantrySection.style.display = 'none';
        }

        // Date
        const date = new Date(recipe.created_at).toLocaleDateString(window.i18n && window.i18n.getLang() === 'en' ? 'en-US' : 'es-ES');
        document.getElementById('recipeDate').textContent = date;

        // Favorite State
        const favBtn = document.getElementById('btnFavorite');
        if (recipe.is_favorite) {
            favBtn.classList.add('active');
            favBtn.querySelector('span').style.fontVariationSettings = "'FILL' 1";
        }

        // --- Lógica de Permisos UI ---
        const btnEdit = document.getElementById('btnEdit');
        const btnDelete = document.getElementById('btnDelete');
        const permissionContainer = document.getElementById('permissionContainer');
        const currentUserId = window.authManager.currentUser?.id;
        const isOwner = recipe.user_id === currentUserId;

        // Si es el dueño, no aplicamos restricciones de banner ni ocultamos botones
        if (isOwner) {
            if (btnEdit) btnEdit.style.display = 'flex';
            if (btnDelete) btnDelete.style.display = 'flex';
            if (permissionContainer) permissionContainer.innerHTML = '';
        } else if (this.permission) {
            // Si hay permiso de URL y NO es el dueño, aplicamos restricciones
            if (btnEdit) btnEdit.style.display = 'none';
            if (btnDelete) btnDelete.style.display = 'none';

            const isCopyable = this.permission === 'view_and_copy' || this.permission === 'copiar';

            if (this.permission === 'view') {
                permissionContainer.innerHTML = `
                    <div class="permission-banner">
                        <div class="permission-info-row">
                            <span class="material-symbols-outlined">visibility</span>
                            <span class="text">${window.i18n ? window.i18n.t('canView') : 'Solo puedes ver'}</span>
                        </div>
                    </div>
                `;
            } else if (isCopyable) {
                permissionContainer.innerHTML = `
                    <div class="permission-banner">
                        <div class="permission-info-row">
                            <span class="material-symbols-outlined">content_copy</span>
                            <span class="text">${window.i18n ? window.i18n.t('canCopy') : 'Puedes agregar a tus recetas'}</span>
                        </div>
                        <button class="btn-copy-recipe" id="btnCopyRecipe">
                            <span class="material-symbols-outlined">add_circle</span>
                            ${window.i18n ? window.i18n.t('permAdd') : 'Añadir a mis recetas'}
                        </button>
                    </div>
                `;
                // Listener para el nuevo botón
                setTimeout(() => {
                    const copyBtn = document.getElementById('btnCopyRecipe');
                    if (copyBtn) copyBtn.onclick = () => this.copyRecipe();
                }, 100);
            }
        }

        this.renderIngredients();
        this.renderSteps();
    }

    async copyRecipe() {
        const recipe = this.currentRecipe;
        const btn = document.getElementById('btnCopyRecipe');

        try {
            window.setButtonLoading(btn, true, window.i18n ? window.i18n.t('saving') : 'Guardando...');

            // 1. Crear copia de la receta base (Solo columnas que existen en la DB)
            const { name_es, description_es, pantry_es, category_id } = recipe;
            const res = await window.db.createRecipe({
                name_es,
                description_es,
                pantry_es,
                category_id,
                is_favorite: false,
                is_active: true
            });

            if (!res.success) throw new Error(res.error);
            const newRecipeId = res.recipe.id;

            // 2. Copiar ingredientes
            if (recipe.ingredients?.length > 0) {
                await window.db.addIngredients(newRecipeId, recipe.ingredients);
            }

            // 3. Copiar pasos
            if (recipe.steps?.length > 0) {
                await window.db.addSteps(newRecipeId, recipe.steps);
            }

            window.showToast(window.i18n ? window.i18n.t('saveSuccess') : '¡Receta guardada!', 'success');

            // 4. Redirigir a la copia propia
            setTimeout(() => {
                window.location.href = `recipe-detail.html?id=${newRecipeId}`;
            }, 1500);

        } catch (err) {
            console.error('Error al copiar receta:', err);
            window.showToast(window.i18n ? window.i18n.t('saveError') : 'Error al guardar la receta', 'error');
            window.setButtonLoading(btn, false);
        }
    }

    renderIngredients() {
        const listEl = document.getElementById('ingredientsList');
        const ingredients = this.currentRecipe.ingredients || [];
        const isEn = window.i18n && window.i18n.getLang() === 'en';

        if (ingredients.length === 0) {
            listEl.innerHTML = `<p class="empty-text">${window.i18n ? window.i18n.t('ocrNoIngredients') : 'No hay ingredientes registrados.'}</p>`;
            return;
        }

        listEl.innerHTML = ingredients.map(ing => {
            const unit = isEn ? (ing.unit_en || ing.unit_es) : ing.unit_es;
            const name = isEn ? (ing.name_en || ing.name_es) : ing.name_es;
            const text = `${ing.quantity || ''} ${unit || ''} ${name}`.trim();
            return `
                <li class="ingredient-item">
                    <input type="checkbox" id="ing-${ing.id}">
                    <label for="ing-${ing.id}">
                        <span class="custom-checkbox"></span>
                        <span class="ing-text">${text}</span>
                    </label>
                </li>
            `;
        }).join('');
    }

    renderSteps() {
        const stepsEl = document.getElementById('stepsList');
        const steps = this.currentRecipe.steps || [];
        const isEn = window.i18n && window.i18n.getLang() === 'en';

        if (steps.length === 0) {
            stepsEl.innerHTML = `<p class="empty-text">${window.i18n ? window.i18n.t('ocrNoSteps') : 'No hay pasos registrados.'}</p>`;
            return;
        }

        stepsEl.innerHTML = steps.map((step, index) => {
            const instruction = isEn ? (step.instruction_en || step.instruction_es) : step.instruction_es;
            return `
                <div class="step-item">
                    <div class="step-number">${index + 1}</div>
                    <div class="step-text">${instruction}</div>
                </div>
            `;
        }).join('');
    }

    setupEventListeners() {
        // Favorite Button
        document.getElementById('btnFavorite').addEventListener('click', (e) => {
            e.stopPropagation();
            this.toggleFavorite();
        });

        // Edit Button
        const btnEdit = document.getElementById('btnEdit');
        if (btnEdit) {
            btnEdit.addEventListener('click', () => {
                window.location.href = `recipe-form.html?id=${this.recipeId}`;
            });
        }

        // Delete Button
        const btnDelete = document.getElementById('btnDelete');
        if (btnDelete) {
            btnDelete.addEventListener('click', () => {
                this.confirmDelete();
            });
        }
    }

    async confirmDelete() {
        const confirmMsg = window.i18n ? window.i18n.t('deleteConfirm') : '¿Seguro que desea eliminar la receta?';
        const deleteBtnTxt = window.i18n ? window.i18n.t('deleteBtn') : 'ELIMINAR';

        window.showActionSnackbar(confirmMsg, deleteBtnTxt, async () => {
            const result = await window.db.deleteRecipe(this.recipeId);
            if (result.success) {
                window.showToast(window.i18n ? window.i18n.t('deleteSuccess') : 'Receta eliminada correctamente', 'success');
                setTimeout(() => {
                    window.location.replace('index.html');
                }, 1000);
            } else {
                window.showToast(window.i18n ? window.i18n.t('deleteError') : 'Error al eliminar la receta', 'error');
            }
        });
    }

    // switchTab removed - No longer needed for unified view

    async toggleFavorite() {
        const favBtn = document.getElementById('btnFavorite');
        const isCurrentlyFavorite = this.currentRecipe.is_favorite;

        const result = await window.db.toggleFavorite(this.recipeId, isCurrentlyFavorite);

        if (result.success) {
            const addedMsg = window.i18n ? window.i18n.t('favAdded') : 'Añadido a favoritos';
            const removedMsg = window.i18n ? window.i18n.t('favRemoved') : 'Eliminado de favoritos';
            window.showToast(
                result.isFavorite ? addedMsg : removedMsg,
                'success'
            );
            this.currentRecipe.is_favorite = result.isFavorite;
            this.updateFavoriteButtonUI(result.isFavorite);
        } else {
            window.showToast(window.i18n ? window.i18n.t('favError') : 'Error al actualizar favoritos', 'error');
        }
    }

    updateFavoriteButtonUI(isFavorite) {
        const favBtn = document.getElementById('btnFavorite');
        if (!favBtn) return;

        if (isFavorite) {
            favBtn.classList.add('active');
            favBtn.querySelector('span').style.fontVariationSettings = "'FILL' 1";
        } else {
            favBtn.classList.remove('active');
            favBtn.querySelector('span').style.fontVariationSettings = "'FILL' 0";
        }
    }
}
