/**
 * RecipeFormManager - RecipeHub Personal
 * Maneja la creación y edición de recetas, incluyendo listas dinámicas
 * de ingredientes y pasos, y carga de imágenes.
 */
class RecipeFormManager {
    constructor() {
        this.recipeId = new URLSearchParams(window.location.search).get('id');
        this.isEditing = !!this.recipeId;
        this.currentRecipe = null;
        this.selectedImage = null;

        this.ingredients = [];
        this.steps = [];

        this.init();
    }

    async init() {
        // 1. Verificar auth
        const isAuth = await window.authManager.checkAuth();
        if (!isAuth) {
            window.location.href = 'index.html';
            return;
        }

        // 2. Cargar categorías en el select
        await this.loadCategories();

        // 3. Si es edición, cargar datos de la receta
        if (this.isEditing) {
            await this.loadRecipeData();
        } else {
            // Inicializar con un campo vacío de cada uno
            this.addIngredient();
            this.addStep();
        }

        this.setupEventListeners();
    }

    async loadCategories() {
        const select = document.getElementById('category');
        const result = await window.db.getMyCategories();

        if (result.success) {
            select.innerHTML = result.categories.map(cat => `
                <option value="${cat.id}">${cat.name_es}</option>
            `).join('');
        }
    }

    async loadRecipeData() {
        document.getElementById('formTitle').textContent = 'Editar Receta';
        const result = await window.db.getRecipeById(this.recipeId);

        if (result.success) {
            const r = result.recipe;
            this.currentRecipe = r;

            // Llenar campos básicos
            const form = document.getElementById('recipeForm');
            form.name.value = r.name_es;
            form.description.value = r.description_es || '';
            form.category_id.value = r.category_id;
            form.difficulty.value = r.difficulty;
            form.prep_time_minutes.value = r.prep_time_minutes;
            form.servings.value = r.servings;

            // Imagen
            if (r.images && r.images.length > 0) {
                const primary = r.images.find(img => img.is_primary) || r.images[0];
                this.showPreview(primary.image_url);
            }

            // Ingredientes
            r.ingredients.forEach(ing => this.addIngredient(ing));
            if (r.ingredients.length === 0) this.addIngredient();

            // Pasos
            r.steps.forEach(step => this.addStep(step));
            if (r.steps.length === 0) this.addStep();
        }
    }

    setupEventListeners() {
        // Imagen
        const uploadArea = document.getElementById('imageUploadArea');
        const imageInput = document.getElementById('imageInput');

        uploadArea.addEventListener('click', () => imageInput.click());
        imageInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            if (file) {
                this.selectedImage = file;
                const reader = new FileReader();
                reader.onload = (e) => this.showPreview(e.target.result);
                reader.readAsDataURL(file);
            }
        });

        document.getElementById('btnRemoveImage').addEventListener('click', (e) => {
            e.stopPropagation();
            this.removeImage();
        });

        // Botones Agregar
        document.getElementById('btnAddIngredient').addEventListener('click', () => this.addIngredient());
        document.getElementById('btnAddStep').addEventListener('click', () => this.addStep());

        // OCR
        const btnOCROpen = document.getElementById('btnOCROpen');
        if (btnOCROpen) {
            btnOCROpen.addEventListener('click', () => {
                if (window.ocr) window.ocr.openModal();
            });
        }

        // Form Submit
        document.getElementById('recipeForm').addEventListener('submit', (e) => {
            e.preventDefault();
            this.saveRecipe();
        });
    }

    // --- Gestión de UI de Imagen ---
    showPreview(url) {
        const preview = document.getElementById('imagePreview');
        const placeholder = document.querySelector('.upload-placeholder');
        const removeBtn = document.getElementById('btnRemoveImage');

        preview.src = url;
        preview.classList.remove('hidden');
        if (placeholder) placeholder.classList.add('hidden');
        if (removeBtn) removeBtn.classList.remove('hidden');
    }

    removeImage() {
        this.selectedImage = null;
        document.getElementById('imagePreview').classList.add('hidden');
        const placeholder = document.querySelector('.upload-placeholder');
        if (placeholder) placeholder.classList.remove('hidden');
        const removeBtn = document.getElementById('btnRemoveImage');
        if (removeBtn) removeBtn.classList.add('hidden');
        document.getElementById('imageInput').value = '';
    }

    // --- Listas Dinámicas ---
    addIngredient(data = null) {
        const container = document.getElementById('ingredientsList');
        // Usar clases del nuevo diseño (components.css form components)

        const item = document.createElement('div');
        item.className = 'flex items-center gap-3 group animate-fade-in';
        item.innerHTML = `
            <span class="material-symbols-outlined text-gray-300 cursor-move">drag_indicator</span>
            <input type="text" class="form-input flex-1" placeholder="Ej. 2 tazas de harina" value="${data ? data.raw_text || data.name_es : ''}" required>
            <button type="button" class="btn-remove-small text-gray-300 hover:text-red-500 opacity-0 group-hover:opacity-100 transition-all p-1">
                <span class="material-symbols-outlined text-[20px]">close</span>
            </button>
        `;

        item.querySelector('.btn-remove-small').addEventListener('click', () => item.remove());
        container.appendChild(item);
    }

    addStep(data = null) {
        const container = document.getElementById('stepsList');
        const stepNum = container.children.length + 1;

        const item = document.createElement('div');
        item.className = 'flex gap-4 group animate-fade-in';
        item.innerHTML = `
            <div class="flex-shrink-0 w-8 h-8 rounded-full bg-emerald-50 text-emerald-700 font-semibold text-sm flex items-center justify-center mt-1 step-number">${stepNum}</div>
            <div class="flex-1">
                <textarea class="form-textarea block w-full resize-none" placeholder="Describe este paso..." rows="2" required>${data ? data.instruction_es : ''}</textarea>
            </div>
            <button type="button" class="btn-remove-small text-gray-300 hover:text-red-500 opacity-0 group-hover:opacity-100 transition-all self-start mt-2 p-1">
                <span class="material-symbols-outlined text-[20px]">delete</span>
            </button>
        `;

        item.querySelector('.btn-remove-small').addEventListener('click', () => {
            item.remove();
            this.updateStepNumbers();
        });
        container.appendChild(item);
    }

    updateStepNumbers() {
        const steps = document.getElementById('stepsList').querySelectorAll('.step-number');
        steps.forEach((badge, index) => {
            badge.textContent = index + 1;
        });
    }

    // --- Persistencia ---
    async saveRecipe() {
        const form = document.getElementById('recipeForm');
        const btnSave = document.getElementById('btnSave');

        try {
            btnSave.disabled = true;
            btnSave.innerHTML = '<span class="spinner-small"></span> Guardando...';

            const recipeData = {
                name_es: form.name.value,
                description_es: form.description.value,
                category_id: form.category_id.value,
                difficulty: form.difficulty.value,
                prep_time_minutes: parseInt(form.prep_time_minutes.value) || 0,
                servings: parseInt(form.servings.value) || 0
            };

            let recipeId = this.recipeId;
            let result;

            if (this.isEditing) {
                result = await window.db.updateRecipe(this.recipeId, recipeData);
            } else {
                result = await window.db.createRecipe(recipeData);
                recipeId = result.recipe?.id;
            }

            if (!result.success) throw new Error(result.error);

            // 1. Guardar Imagen si hay una nueva
            if (this.selectedImage) {
                await window.db.uploadImage(this.selectedImage, recipeId);
            }

            // 2. Guardar Ingredientes (Lógica simplificada: borrar y recrear o actualizar)
            // Para simplicidad en este MVP, asumiremos que el backend maneja la relación o lo haremos manual post-MVP
            // window.ui.showToast('¡Receta guardada con éxito!', 'success');

            setTimeout(() => {
                window.location.href = `recipe-detail.html?id=${recipeId}`;
            }, 1000);

        } catch (error) {
            console.error('Error salvando receta:', error);
            window.ui.showToast('Error al guardar la receta', 'error');
            btnSave.disabled = false;
            btnSave.textContent = 'Guardar Receta';
        }
    }
}

// Inicializar
window.recipeForm = new RecipeFormManager();
