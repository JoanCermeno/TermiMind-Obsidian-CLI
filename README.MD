# 🧠 TermiMind-Obsidian-CLI

**TermiMind** es un agente de IA local diseñado para desarrolladores que viven en la terminal. Olvídate de abrir Obsidian cada vez que quieras anotar algo; simplemente dile a tu terminal lo que estás pensando y deja que la IA organice, formatee y guarde la nota por ti con marcas de tiempo precisas.

---

## ✨ Características
- 🛡️ **100% Privado**: Tus datos nunca salen de tu máquina. Todo corre localmente con **Ollama**.
- ⚡ **Ultra Rápido**: Optimizado para modelos ligeros como `qwen2.5:1.7b` (ideal para GPUs como la RX 470).
- 📝 **Markdown Inteligente**: Genera automáticamente títulos, tablas, emojis y Callouts de Obsidian.
- 🚀 **Instalación Global**: Se instala como un comando del sistema (`/usr/local/bin`), funcionando en Bash, Zsh o cualquier Shell.

---

## 📋 Requisitos del Sistema
Antes de instalar, asegúrate de tener:
1. **Linux** (Probado en Debian Trixie / KDE Plasma).
2. **Python 3** y el módulo `venv` instalados.
3. **Ollama** funcionando (el instalador intentará descargarlo si no lo tienes).
4. **Obsidian** instalado con una bóveda (Vault) activa.

---

## 🛠️ Instalación Paso a Paso

Sigue estos comandos en tu terminal para configurar tu agente en menos de un minuto:

1. **Clona el repositorio:**
   ```bash
   git clone [https://github.com/JoanCermeno/TermiMind-Obsidian-CLI.git](https://github.com/JoanCermeno/TermiMind-Obsidian-CLI.git)
   cd TermiMind-Obsidian-CLI
   ```



## Ejecuta el instalador:
   ```bash
   bash install.sh
   ```

## Configura tus preferencias:

- El instalador te pedirá la **ruta de tu bóveda de Obsidian** (ej: `/home/joan/Documents/Estudios_obsidian`).
    
- Te preguntará qué **nombre de comando** quieres usar (por ejemplo: `notas`).
    
- El script configurará el entorno virtual y creará el acceso global automáticamente.

---------
## 🚀 Ejemplo de Uso

Una vez instalado, puedes usarlo de dos maneras:

### 1. Modo Directo (Rápido)

Escribe el comando seguido de tu idea entre comillas, Por ejemplo:
```bash
notas "Hoy terminamos varias funcionalidades clave del sistema POS: hice cambios al header, al footer, para la siguiente tarea, recuerdame modificar la seccion del login para mejorar el disenio"
```

### 2. Modo Interactivo

Simplemente escribe el comando y presiona Enter:
```bash
notas
```
_El agente te preguntará:_ `📝 ¿Qué quieres anotar?`

----
## 💡 ¿Qué obtendrás en Obsidian?

El agente procesará tu mensaje y creará un archivo `.md` con:

- 📅 **Marca de tiempo** en el nombre del archivo.
    
- 🏷️ **Tags automáticos** basados en el contexto.
    
- 📊 **Tablas y Emojis** si la información es técnica o comparativa.
    

## 🛠️ Tecnologías Usadas

- **Python** (Core del Agente).
    
- **Ollama** (Motor de IA).
    
- **Qwen2.5 1.7B** (Modelo de lenguaje).
    
- **Bash** (Instalador universal).
Desarrollado con ❤️ por [Joan Cermeño](https://github.com/JoanCermeno)
