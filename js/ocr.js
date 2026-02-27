/**
 * OCRScanner - Recipe Pantry Premium v2.0
 */
class OCRScanner {
    constructor() {
        this.stream = null;
        this.videoElement = null;
        this.currentFacingMode = 'environment';
    }

    async openModal() {
        const modal = document.getElementById('ocrModal');
        if (!modal) return;
        modal.classList.add('open');
        this.videoElement = document.getElementById('videoFeed');
        await this.startCamera();
        const cameraState = document.getElementById('ocrCameraState');
        const resultState = document.getElementById('ocrResultState');
        const loadingState = document.getElementById('ocrLoading');
        if (cameraState) cameraState.style.display = 'flex';
        if (resultState) resultState.style.display = 'none';
        if (loadingState) loadingState.style.display = 'none';
    }

    async close() {
        const modal = document.getElementById('ocrModal');
        if (modal) modal.classList.remove('open');
        this.stopCamera();
        this.resetModal();
    }

    resetModal() {
        this.stopCamera();
        const preview = document.getElementById('capturePreview');
        const video = document.getElementById('videoFeed');
        const loadingState = document.getElementById('ocrLoading');
        const cameraState = document.getElementById('ocrCameraState');
        const resultState = document.getElementById('ocrResultState');

        if (preview) { preview.style.display = 'none'; preview.src = ''; }
        if (video) video.style.display = 'block';
        if (loadingState) loadingState.style.display = 'none';
        if (cameraState) cameraState.style.display = 'flex';
        if (resultState) resultState.style.display = 'none';

        // Reset progress
        const progressText = document.getElementById('ocrProgressText');
        const progressBar = document.getElementById('ocrProgressBar');
        if (progressText) progressText.textContent = 'Iniciando OCR...';
        if (progressBar) progressBar.style.width = '0%';

        this.startCamera();
    }

    // Legacy alias
    reset() { this.resetModal(); }

    async startCamera() {
        if (this.stream) this.stopCamera();
        try {
            this.stream = await navigator.mediaDevices.getUserMedia({
                video: { facingMode: this.currentFacingMode },
                audio: false
            });
            if (this.videoElement) {
                this.videoElement.srcObject = this.stream;
                try {
                    await this.videoElement.play();
                } catch (playError) {
                    if (playError.name !== 'AbortError') {
                        console.error('Error al reproducir video:', playError);
                    }
                }
            }
        } catch (err) {
            console.error('Error camera:', err);
        }
    }

    stopCamera() {
        if (this.stream) {
            this.stream.getTracks().forEach(track => track.stop());
            this.stream = null;
        }
    }

    async switchCamera() {
        this.currentFacingMode = this.currentFacingMode === 'user' ? 'environment' : 'user';
        await this.startCamera();
    }

    /**
     * Show the "Analizando..." processing state with image preview
     */
    showProcessingState(imageDataUrl) {
        const cameraState = document.getElementById('ocrCameraState');
        const resultState = document.getElementById('ocrResultState');
        const loadingState = document.getElementById('ocrLoading');

        if (cameraState) cameraState.style.display = 'none';
        if (resultState) resultState.style.display = 'none';
        if (loadingState) loadingState.style.display = 'flex';

        // Set the image preview
        const processingPreview = document.getElementById('ocrProcessingPreview');
        if (processingPreview && imageDataUrl) {
            processingPreview.src = imageDataUrl;
        }

        // Reset progress
        const progressText = document.getElementById('ocrProgressText');
        const progressBar = document.getElementById('ocrProgressBar');
        if (progressText) progressText.textContent = window.i18n ? window.i18n.t('ocrProcessing') : 'Iniciando OCR...';
        if (progressBar) progressBar.style.width = '0%';
    }

    /**
     * Update progress during OCR processing
     */
    updateProgress(message) {
        if (message.status === 'recognizing text' || message.status === 'reconociendo') {
            const p = Math.round((message.progress || 0) * 100);
            const progressText = document.getElementById('ocrProgressText');
            const progressBar = document.getElementById('ocrProgressBar');
            if (progressText) {
                progressText.textContent = window.i18n ?
                    window.i18n.t('ocrReading', { progress: p }) :
                    `Leyendo... ${p}%`;
            }
            if (progressBar) progressBar.style.width = p + '%';
        } else if (message.message) {
            const progressText = document.getElementById('ocrProgressText');
            if (progressText) progressText.textContent = message.message;
        }
    }

    async capture() {
        if (!this.videoElement || !this.stream) return;
        const video = this.videoElement;
        const canvas = document.createElement('canvas');
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(video, 0, 0);

        const imageDataUrl = canvas.toDataURL('image/jpeg', 0.85);

        // Show "Analizando..." with image preview
        this.stopCamera();
        this.showProcessingState(imageDataUrl);

        const blob = await new Promise(resolve => canvas.toBlob(resolve, 'image/jpeg', 0.95));
        const file = new File([blob], 'scan.jpg', { type: 'image/jpeg' });

        try {
            const results = await window.ocrProcessor.processImage(file, m => this.updateProgress(m));
            if (results.success) {
                this.showResults(results);
            } else {
                throw new Error(results.error);
            }
        } catch (error) {
            console.error('Capture error:', error);
            if (window.showSnackbar) window.showSnackbar('No se pudo analizar la imagen. Intenta con mejor iluminación.');
            this.resetModal();
        }
    }

    showResults(results) {
        const cameraState = document.getElementById('ocrCameraState');
        const resultState = document.getElementById('ocrResultState');
        const loadingState = document.getElementById('ocrLoading');

        if (cameraState) cameraState.style.display = 'none';
        if (loadingState) loadingState.style.display = 'none';
        if (resultState) resultState.style.display = 'flex';

        // Set Recipe Name
        const nameInput = document.getElementById('ocrRecipeName') || document.getElementById('ocrRawName');
        if (nameInput) nameInput.value = results.nombre || '';

        // Set Main Text / JSON Output
        const textOutput = document.getElementById('extractedText');
        if (textOutput) {
            // En ocr.html mostramos el texto corregido para editar
            textOutput.value = results.texto;
        }

        // Si estamos en ocr.html, también actualizamos la tab de "Vista Previa"
        const parsedName = document.getElementById('parsedName');
        if (parsedName) parsedName.value = results.nombre || '';

        const parsedIngredients = document.getElementById('parsedIngredients');
        if (parsedIngredients && results.ingredientes) {
            parsedIngredients.innerHTML = results.ingredientes.map(ing => `
                <div class="parsed-item">
                    <span class="material-symbols-outlined" style="color: var(--primary); font-size: 18px;">check_circle</span>
                    <span>${ing}</span>
                </div>
            `).join('');
        }

        const parsedSteps = document.getElementById('parsedSteps');
        if (parsedSteps && results.pasos) {
            parsedSteps.innerHTML = results.pasos.map((step, i) => `
                <div class="parsed-item" style="align-items: flex-start;">
                    <span style="font-weight: 700; color: var(--primary); min-width: 20px;">${i + 1}.</span>
                    <span>${step}</span>
                </div>
            `).join('');
        }

        // Confidence badge
        const conf = Math.round(results.confidence || 0);
        const confBadge = document.getElementById('confidenceBadge');
        if (confBadge) {
            confBadge.textContent = `Precisión: ${conf}%`;
            confBadge.style.color = conf >= 85 ? '#10B981' : conf >= 60 ? '#F59E0B' : '#EF4444';
            confBadge.className = 'confidence-badge ' + (conf >= 85 ? 'confidence-high' : conf >= 60 ? 'confidence-medium' : 'confidence-low');
        }

        // Auto-scroll para que se vea el texto
        if (resultState) {
            resultState.scrollTop = 0;
            setTimeout(() => resultState.scrollTop = 0, 100);
        }

        console.log(`✅ showResults: ${results.texto.length} chars, confianza ${conf}% | Método: ${results.method}`);

        // Guardar para uso global por otros botones (como saveRecipe en ocr.html)
        window.currentOCRResults = results;
    }

    async handleGallery(file) {
        if (!file) return;

        // Generate preview from the gallery file
        const reader = new FileReader();
        const imageDataUrl = await new Promise((resolve) => {
            reader.onload = e => resolve(e.target.result);
            reader.readAsDataURL(file);
        });

        // Show Analizando with preview
        this.stopCamera();
        this.showProcessingState(imageDataUrl);

        try {
            const results = await window.ocrProcessor.processImage(file, m => this.updateProgress(m));
            if (results.success) {
                this.showResults(results);
            } else {
                throw new Error(results.error);
            }
        } catch (error) {
            console.error('Gallery error:', error);
            if (window.showSnackbar) window.showSnackbar('No se pudo analizar la imagen.');
            this.resetModal();
        }
    }

    learnCorrections() {
        console.log("Sistema local no requiere fase de aprendizaje.");
    }
}

// Global initialization
window.ocr = new OCRScanner();
