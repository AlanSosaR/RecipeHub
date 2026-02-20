/**
 * OCRManager - RecipeHub Drive
 * Maneja el Modal de Escaneo, la Cámara y el Parsing de Recetas.
 */
class OCRManager {
    constructor() {
        this.video = document.getElementById('videoFeed');
        this.canvas = document.createElement('canvas');
        this.stream = null;
        this.currentFacingMode = 'environment';

        this.setupEventListeners();
    }

    setupEventListeners() {
        // Modal Controls
        const btnClose = document.getElementById('btnCloseOCR');
        if (btnClose) btnClose.addEventListener('click', () => this.closeModal());

        // Camera Controls
        const btnCapture = document.getElementById('btnCapture');
        if (btnCapture) btnCapture.addEventListener('click', () => this.capturePhoto());

        const btnSwitch = document.getElementById('btnSwitchCamera');
        if (btnSwitch) btnSwitch.addEventListener('click', () => this.switchCamera());

        const galleryBtn = document.getElementById('btnGallery');
        const galleryInput = document.getElementById('ocrGalleryInput');
        if (galleryBtn && galleryInput) {
            galleryBtn.addEventListener('click', () => galleryInput.click());
            galleryInput.addEventListener('change', (e) => this.handleGallerySelection(e));
        }

        // Action Buttons
        const btnRetry = document.getElementById('btnRetryOCR');
        if (btnRetry) btnRetry.addEventListener('click', () => this.resetModalState());

        const btnImport = document.getElementById('btnImportOCR');
        if (btnImport) btnImport.addEventListener('click', () => this.importToForm());

        const btnSaveDirect = document.getElementById('btnSaveDirectOCR');
        if (btnSaveDirect) btnSaveDirect.addEventListener('click', () => this.saveDirectly());

        // Field listeners for M3 effects
        const ocrNameInput = document.getElementById('ocrRecipeName');
        if (ocrNameInput) {
            ocrNameInput.addEventListener('input', () => {
                if (ocrNameInput.value) ocrNameInput.classList.add('has-value');
                else ocrNameInput.classList.remove('has-value');
            });
        }
    }

    // --- Modal Management ---
    async openModal() {
        const modal = document.getElementById('ocrModal');
        modal.classList.remove('hidden');
        // Force reflow for transition
        void modal.offsetWidth;
        modal.classList.remove('opacity-0');

        await this.startCamera();
    }

    closeModal() {
        const modal = document.getElementById('ocrModal');
        modal.classList.add('opacity-0');

        // Wait for transition to finish before hiding and stopping camera
        setTimeout(() => {
            modal.classList.add('hidden');
            this.stopCamera();
            this.resetModalState();
        }, 300);
    }

    resetModalState() {
        document.getElementById('ocrCameraState').classList.remove('hidden');
        document.getElementById('ocrResultState').classList.add('hidden');
        document.getElementById('ocrLoading').classList.add('hidden');
        document.getElementById('extractedText').value = '';
    }

    // --- Camera Logic ---
    async startCamera() {
        try {
            this.stopCamera(); // Ensure clean start

            const constraints = {
                video: {
                    facingMode: this.currentFacingMode,
                    width: { ideal: 1280 },
                    height: { ideal: 720 }
                }
            };

            this.stream = await navigator.mediaDevices.getUserMedia(constraints);
            this.video.srcObject = this.stream;
        } catch (error) {
            console.error('Error accediendo a la cámara:', error);
            window.utils.showToast('No se pudo acceder a la cámara', 'error');
        }
    }

    stopCamera() {
        if (this.stream) {
            this.stream.getTracks().forEach(track => track.stop());
            this.stream = null;
        }
    }

    async switchCamera() {
        this.currentFacingMode = this.currentFacingMode === 'environment' ? 'user' : 'environment';
        await this.startCamera();
    }

    capturePhoto() {
        if (!this.video.videoWidth) return;

        this.canvas.width = this.video.videoWidth;
        this.canvas.height = this.video.videoHeight;
        const ctx = this.canvas.getContext('2d');
        ctx.drawImage(this.video, 0, 0);

        const imageDataValue = this.canvas.toDataURL('image/jpeg');
        this.processOCR(imageDataValue);
    }

    handleGallerySelection(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => this.processOCR(e.target.result);
            reader.readAsDataURL(file);
        }
    }

    // --- OCR Simulation ---
    async processOCR(imageB64) {
        // Show Loading
        document.getElementById('ocrLoading').classList.remove('hidden');

        // Simulate API delay
        setTimeout(() => {
            // Mock Text Result
            const mockText = `LASAGNA DE BERENJENA

Ingredientes:
- 2 berenjenas grandes
- 500g queso ricotta
- 1 bote de salsa de tomate
- Queso parmesano rallado
- Hojas de albahaca fresca

Pasos:
1. Cortar las berenjenas en láminas y salar para quitar el amargor.
2. En una fuente para horno, colocar una base de salsa de tomate.
3. Añadir una capa de berenjenas, luego queso ricotta y repetir.
4. Terminar con queso parmesano y hornear 40 mins a 180C.`;

            // UI Update
            document.getElementById('ocrLoading').classList.add('hidden');
            document.getElementById('ocrCameraState').classList.add('hidden');
            document.getElementById('ocrResultState').classList.remove('hidden');

            document.getElementById('extractedText').value = mockText;

            // Suggested Title (First non-empty line)
            const suggestion = mockText.split('\n').filter(l => l.trim())[0] || '';
            const nameField = document.getElementById('ocrRecipeName');
            nameField.value = suggestion;
            if (suggestion) nameField.classList.add('has-value');
        }, 1500);
    }

    // --- Parsing & Import ---
    importToForm() {
        const text = document.getElementById('extractedText').value;
        if (!text) return;

        // Simple Parser
        const lines = text.split('\n');
        let currentSection = null; // 'ingredients' | 'steps' | null
        let titleFound = false;

        // Clear current lists? Optional, but let's keep existing and append
        // Actually for a fresh scan, clearing might be better, but appending is safer.

        lines.forEach(line => {
            line = line.trim();
            if (!line) return;

            const lower = line.toLowerCase();

            // Detect Title (first line)
            if (!titleFound && !lower.includes('ingredientes') && !lower.includes('pasos')) {
                const nameInput = document.getElementById('name');
                if (nameInput && !nameInput.value) {
                    nameInput.value = line;
                    titleFound = true;
                    return;
                }
            }

            // Detect Sections
            if (lower.includes('ingredientes')) {
                currentSection = 'ingredients';
                return;
            }
            if (lower.includes('pasos') || lower.includes('preparación')) {
                currentSection = 'steps';
                return;
            }

            // Parse Items
            if (currentSection === 'ingredients') {
                // Remove bullets like "- " or "* "
                const cleanLine = line.replace(/^[-*•]\s*/, '');
                if (window.recipeForm) window.recipeForm.addIngredient({ raw_text: cleanLine });
            } else if (currentSection === 'steps') {
                // Remove numbering "1. "
                const cleanLine = line.replace(/^\d+[\.|)]\s*/, '');
                if (window.recipeForm) window.recipeForm.addStep({ instruction_es: cleanLine });
            }
        });

        window.utils.showToast('Receta importada correctamente', 'success');
        this.closeModal();
    }

    async saveDirectly() {
        const name = document.getElementById('ocrRecipeName').value.trim();
        const text = document.getElementById('extractedText').value.trim();

        if (!name) {
            window.utils.showToast('Por favor, asigne un nombre a la receta', 'error');
            return;
        }

        document.getElementById('ocrLoading').classList.remove('hidden');
        const loadingText = document.getElementById('ocrLoading').querySelector('p');
        loadingText.textContent = 'Creando receta...';

        try {
            // 1. Parsear texto completo
            const parsed = this.parseFullText(text);

            // 2. Crear receta base
            const recipeData = {
                name_es: name,
                description_es: parsed.description,
                prep_time_minutes: parsed.time || 30,
                difficulty: 'medium',
                user_id: window.authManager.currentUser.id
            };

            const result = await window.db.createRecipe(recipeData);
            if (!result.success) throw new Error(result.error);

            const recipeId = result.recipe.id;

            // 3. Guardar Ingredientes
            if (parsed.ingredients.length > 0) {
                loadingText.textContent = 'Guardando ingredientes...';
                await window.db.addIngredients(recipeId, parsed.ingredients);
            }

            // 4. Guardar Pasos
            if (parsed.steps.length > 0) {
                loadingText.textContent = 'Guardando preparación...';
                await window.db.addSteps(recipeId, parsed.steps);
            }

            window.utils.showToast('¡Receta creada con éxito!', 'success');

            setTimeout(() => {
                window.location.href = `recipe-detail.html?id=${recipeId}`;
            }, 800);

        } catch (error) {
            console.error('Error en guardado directo OCR:', error);
            window.utils.showToast('Error al crear la receta', 'error');
            document.getElementById('ocrLoading').classList.add('hidden');
        }
    }

    parseFullText(text) {
        const lines = text.split('\n');
        const result = {
            description: '',
            ingredients: [],
            steps: [],
            time: 30
        };

        let currentSection = null;
        let descLines = [];

        lines.forEach((line, idx) => {
            const clean = line.trim();
            if (!clean) return;
            const lower = clean.toLowerCase();

            // Detectar secciones
            if (lower.includes('ingredientes')) {
                currentSection = 'ingredients';
                return;
            }
            if (lower.includes('pasos') || lower.includes('preparación') || lower.includes('instrucciones')) {
                currentSection = 'steps';
                return;
            }

            // Si es la primera o segunda línea y no es sección, podría ser parte de descripción
            if (!currentSection && idx > 0 && idx < 4) {
                descLines.push(clean);
                return;
            }

            // Procesar items
            if (currentSection === 'ingredients') {
                const raw = clean.replace(/^[-*•]\s*/, '');
                result.ingredients.push({ name_es: raw, raw_text: raw });
            } else if (currentSection === 'steps') {
                const raw = clean.replace(/^\d+[\.|)]\s*/, '');
                result.steps.push({ instruction_es: raw });
            }
        });

        result.description = descLines.join(' ').substring(0, 200);
        return result;
    }

    // Mantener para compatibilidad interna
    parseText(text) {
        return this.parseFullText(text);
    }
}

// Initialize
window.ocr = new OCRManager();
