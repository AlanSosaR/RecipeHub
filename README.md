# 📚 RecipeHub Personal - Guía de Documentos

## 📋 Resumen de Archivos

Tienes **2 documentos principales** para el proyecto:

---

## 🔧 1. SPECS-ANTIGRAVITY.md
**Para: Equipo de Desarrollo (Antigravity)**

### ✅ Qué contiene:

#### **A. Instrucciones de Base de Datos con MCP**
- Cómo conectarse a Supabase usando MCP
- **TODO el Schema SQL completo incluido** (9 tablas)
- Comando para ejecutar automáticamente
- Query de verificación

#### **B. Stack Tecnológico**
- Frontend: HTML + CSS + JavaScript vanilla
- Backend: Supabase (PostgreSQL + Auth + Storage)
- OCR: Tesseract.js
- Hosting: Netlify / Vercel

#### **C. Código JavaScript Funcional**
Incluye funciones completas para:
- ✅ Autenticación (signup, login, logout)
- ✅ CRUD de recetas
- ✅ Sistema de compartir
- ✅ OCR (foto → texto)
- ✅ Upload de imágenes
- ✅ Búsqueda y filtros

#### **D. Ejemplos de Código**
```javascript
// Crear receta desde foto con OCR
async function createRecipeFromOCR(userId, imageFile) {
    // Código completo incluido
}
```

### 🎯 Cómo usar este documento:

1. **Paso 1:** Antigravity se conecta a Supabase con MCP
   ```
   Host: db.xxxxx.supabase.co
   Database: postgres
   User: postgres
   Password: [de Supabase]
   ```

2. **Paso 2:** Ejecuta el SQL completo que está en el documento
   - Todo el schema está incluido
   - Son 9 tablas + índices + triggers + RLS

3. **Paso 3:** Verifica que se crearon las 9 tablas

4. **Paso 4:** Implementa las funciones JavaScript

5. **Paso 5:** Deploy a Netlify

---

## 🎨 2. SPECS-STITCH.md
**Para: Equipo de Diseño (Stitch)**

### ✅ Qué contiene:

#### **A. Sistema de Diseño Completo**
```
COLORES:
- Primary:   #FF6B35 (Naranja cálido)
- Secondary: #2D9596 (Turquesa)
- Success:   #10B981 (Verde)
- Error:     #EF4444 (Rojo)

TIPOGRAFÍA:
- Display: Epilogue (Bold 700, Extra Bold 800)
- Body: Inter (Regular 400, Medium 500, Semibold 600)

ESPACIADO:
- XS: 8px, SM: 12px, MD: 16px, LG: 24px, XL: 32px

BORDER RADIUS:
- Small: 8px, Medium: 12px, Large: 16px, Full: 9999px

SOMBRAS:
- SM: 0 2px 4px rgba(0,0,0,0.06)
- MD: 0 4px 8px rgba(0,0,0,0.08)
- LG: 0 8px 16px rgba(0,0,0,0.10)
```

#### **B. Wireframes Detallados**
Incluye wireframes pixel-perfect de:
1. Landing page
2. Registro/Login
3. Dashboard (mobile + desktop)
4. Vista detalle receta
5. Modo paso a paso (fullscreen)
6. Modal compartir
7. Modal OCR
8. Cards (sin imagen, con galería)

Ejemplo:
```
┌─────────────────────────────────┐
│ ❤️                       ✏️    │ ← 32x32px
│ ┌─────────────────────────────┐ │
│ │   [IMAGEN 16:9]             │ │ ← 200px height
│ └─────────────────────────────┘ │
│ 🏷️ Platos Principales          │
│ Paella Valenciana               │ ← Epilogue 20px/700
│ 🕐 30min  👥 4  ⭐ Media        │
└─────────────────────────────────┘
```

#### **C. Componentes UI**
Especificaciones exactas de:
- Botones (primary, secondary, icon, FAB)
- Inputs (text, search, textarea, select)
- Cards (recipe, stat, empty state)
- Badges (category, gallery, status)
- Modales
- Tooltips

#### **D. Estados y Animaciones**
- Loading states (spinner, skeleton)
- Hover effects
- Transitions (150ms, 250ms, 350ms)
- Animaciones de entrada/salida

#### **E. Responsive**
- Mobile: < 768px (diseño principal)
- Tablet: 768px - 1024px
- Desktop: > 1024px

### 🎯 Cómo usar este documento:

1. **Paso 1:** Lee el sistema de diseño (colores, tipografía, espaciado)

2. **Paso 2:** Crea componentes en Stitch siguiendo las especificaciones

3. **Paso 3:** Diseña las pantallas usando los wireframes como guía

4. **Paso 4:** Aplica estados y animaciones

5. **Paso 5:** Asegúrate que sea responsive

---

## 🔄 Flujo de Trabajo

### **Fase 1: Base de Datos (Antigravity)**
```
Antigravity
    ↓
Conecta a Supabase con MCP
    ↓
Ejecuta SQL del documento
    ↓
Verifica 9 tablas creadas
    ↓
✅ BD Lista
```

### **Fase 2: Diseño (Stitch)**
```
Stitch
    ↓
Lee sistema de diseño
    ↓
Crea componentes
    ↓
Diseña pantallas
    ↓
Exporta assets
    ↓
✅ Diseño Listo
```

### **Fase 3: Desarrollo (Antigravity)**
```
Antigravity
    ↓
Implementa código JavaScript
    ↓
Conecta con Supabase
    ↓
Integra diseño de Stitch
    ↓
Testing
    ↓
Deploy a Netlify
    ↓
✅ App Funcionando
```

---

## 📊 Tabla Comparativa

| Aspecto | SPECS-ANTIGRAVITY.md | SPECS-STITCH.md |
|---------|---------------------|-----------------|
| **Audiencia** | Desarrolladores | Diseñadores |
| **Contenido Principal** | Código + BD | Diseño + UI |
| **Incluye BD** | ✅ Sí (SQL completo) | ❌ No |
| **Incluye Código** | ✅ Sí (JavaScript) | ❌ No |
| **Incluye Wireframes** | ❌ No | ✅ Sí (todos) |
| **Incluye Sistema Diseño** | ❌ No | ✅ Sí (completo) |
| **Instrucciones MCP** | ✅ Sí | ❌ No |
| **Medidas Exactas** | Algunas | ✅ Todas |

---

## ⚙️ Configuración Inicial

### **Para Antigravity:**

1. **Obtener credenciales Supabase:**
   - Ir a: https://supabase.com/dashboard
   - Settings → Database
   - Copiar: Host, Database, Port, User, Password

2. **Configurar MCP:**
   ```javascript
   const supabaseConnection = {
       host: 'db.xxxxx.supabase.co',
       database: 'postgres',
       port: 5432,
       user: 'postgres',
       password: 'TU_PASSWORD',
       ssl: true
   };
   ```

3. **Ejecutar SQL:**
   - Todo el schema está en SPECS-ANTIGRAVITY.md
   - Copiar y ejecutar todo el bloque SQL

4. **Verificar:**
   ```sql
   SELECT tablename FROM pg_tables 
   WHERE schemaname = 'public' 
   AND tablename IN ('users', 'categories', 'recipes', ...)
   ORDER BY tablename;
   ```
   - Debe mostrar 9 tablas

### **Para Stitch:**

1. **Leer sistema de diseño** en SPECS-STITCH.md

2. **Crear artboard** en Stitch:
   - Mobile: 375px width
   - Desktop: 1440px width

3. **Importar fuentes:**
   - Epilogue (Google Fonts)
   - Inter (Google Fonts)

4. **Configurar colores:**
   - Primary: #FF6B35
   - Secondary: #2D9596
   - Y todos los demás del documento

5. **Empezar con componentes** más usados:
   - Botones
   - Inputs
   - Cards

---

## 🚀 Siguiente Paso

### **Inmediato:**
1. ✅ Antigravity: Conectar a Supabase y crear BD
2. ✅ Stitch: Leer sistema de diseño y empezar componentes

### **Paralelo:**
- Antigravity desarrolla mientras Stitch diseña
- Integración cuando ambos terminen

### **Final:**
- Testing completo
- Deploy a producción
- ✅ RecipeHub Personal funcionando

---

## 📞 Soporte

Si necesitas aclaración sobre:
- **Base de datos o código:** Ver SPECS-ANTIGRAVITY.md
- **Diseño o UI:** Ver SPECS-STITCH.md

---

## ✅ Checklist de Inicio

### **Antigravity:**
- [ ] Obtener credenciales Supabase
- [ ] Conectar con MCP
- [ ] Ejecutar SQL (9 tablas)
- [ ] Verificar creación exitosa
- [ ] Crear bucket Storage "recipe-images"

### **Stitch:**
- [ ] Leer sistema de diseño completo
- [ ] Configurar fuentes y colores
- [ ] Crear componentes base
- [ ] Diseñar pantalla Landing
- [ ] Diseñar Dashboard mobile

---

**¡Todo está listo para comenzar el desarrollo!** 🚀
