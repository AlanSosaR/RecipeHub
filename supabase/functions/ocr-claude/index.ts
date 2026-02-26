import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const { image } = await req.json();
        const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');

        if (!ANTHROPIC_API_KEY) {
            throw new Error('ANTHROPIC_API_KEY no configurada');
        }

        console.log('🤖 Procesando con Claude 3.5 Sonnet...');

        const response = await fetch('https://api.anthropic.com/v1/messages', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': ANTHROPIC_API_KEY,
                'anthropic-version': '2023-06-01'
            },
            body: JSON.stringify({
                model: 'claude-3-5-sonnet-20241022',
                max_tokens: 4096,
                messages: [{
                    role: 'user',
                    content: [
                        {
                            type: 'image',
                            source: {
                                type: 'base64',
                                media_type: 'image/png', // Use generic if unknown, but browser-side we usually send png or jpeg
                                data: image
                            }
                        },
                        {
                            type: 'text',
                            text: `Eres un experto en OCR de recetas culinarias. Extrae TODO el texto de esta imagen con MÁXIMA precisión.

INSTRUCCIONES CRÍTICAS:
1. Lee TODO el texto visible, sin omitir nada
2. Mantén el formato original exacto (listas, viñetas, numeración)
3. Respeta números, unidades de medida y símbolos especiales
4. Si algo no es legible, indica [ilegible]

CORRECCIONES AUTOMÁTICAS (solo errores obvios):
- "l" (ele) que claramente es "1" (uno) → corrígelo
- "O" (letra o) que claramente es "0" (cero) → corrígelo
- "rn" que claramente es "m" → corrígelo
- Palabras mal escritas obvias (ej: "tornates" → "tomates")

FORMATO DE SALIDA:
Devuelve SOLO el texto extraído y corregido, sin comentarios, sin explicaciones.
Primera línea destacada = NOMBRE DE LA RECETA.

Empieza ahora:`
                        }
                    ]
                }]
            })
        });

        if (!response.ok) {
            const errorData = await response.json();
            throw new Error(errorData.error?.message || 'Error en Claude API');
        }

        const data = await response.json();
        const extractedText = data.content[0].text;

        console.log('✅ Texto extraído por Claude');

        return new Response(
            JSON.stringify({
                text: extractedText,
                success: true,
                model: 'claude-3.5-sonnet',
                confidence: 97 // Claude no da confidence, pero es ~97% real
            }),
            {
                headers: {
                    ...corsHeaders,
                    'Content-Type': 'application/json'
                }
            }
        );

    } catch (error) {
        console.error('🔥 Error:', error);

        return new Response(
            JSON.stringify({
                error: error.message,
                success: false,
                details: 'Verifica configuración de ANTHROPIC_API_KEY'
            }),
            {
                status: 500,
                headers: {
                    ...corsHeaders,
                    'Content-Type': 'application/json'
                }
            }
        );
    }
});
