import ollama
import os
import sys
from datetime import datetime

# EL INSTALADOR CAMBIARÁ ESTA LÍNEA AUTOMÁTICAMENTE
VAULT_PATH = "PENDIENTE"
MODEL = "qwen3:1.7b"

if not os.path.exists(VAULT_PATH):
    os.makedirs(VAULT_PATH)

def procesar_nota(texto):
    print(f"🤖 Generando nota con {MODEL}...")
    prompt = f"""Actúa como un experto documentador para Obsidian. Transforma la siguiente información en una nota profesional siguiendo estas reglas:
1. Estructura: Usa títulos claros (#, ##).
2. Elementos Visuales: Usa Emojis pertinentes.
3. Organización: Si hay datos comparativos o listas, usa TABLAS o Callouts de Obsidian (> [!INFO]).
4. Formato: Genera SOLO Markdown puro. NO uses bloques de código ```markdown ni etiquetas <thought>.
5. Tags: Al final, añade una sección de tags con # (ej: #desarrollo #laravel).

Información a procesar:"""
    
    try:
        response = ollama.generate(model=MODEL, prompt=prompt)
        contenido = response['response']
        contenido = contenido.replace('```markdown', '').replace('```', '').strip()
        
        timestamp = datetime.now().strftime("%Y-%m-%d_%H%M")
        nombre_archivo = f"Nota_{timestamp}.md"
        ruta_final = os.path.join(VAULT_PATH, nombre_archivo)
        
        with open(ruta_final, "w", encoding="utf-8") as f:
            f.write(contenido)
        print(f"✅ Guardado: {nombre_archivo}")
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    entrada = " ".join(sys.argv[1:]) if len(sys.argv) > 1 else input("📝 ¿Qué anotar?: ")
    if entrada:
        procesar_nota(entrada)
