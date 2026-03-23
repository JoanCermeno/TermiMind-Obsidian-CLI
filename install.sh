#!/bin/bash

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🚀 Iniciando Instalador de Agente Obsidian Local${NC}"

# 1. Requisito: Verificar Ollama
if ! command -v ollama &> /dev/null; then
    echo -e "${RED}⚠️  Ollama no está instalado.${NC}"
    read -p "¿Deseas instalar Ollama ahora? (s/n): " inst_ollama
    if [[ $inst_ollama == "s" ]]; then
        curl -fsSL https://ollama.com/install.sh | sh
    else
        echo "Instalación abortada. Ollama es necesario."
        exit 1
    fi
fi

# 2. Descargar el modelo ligero (Qwen 1.7B)
echo -e "${BLUE}🧠 Descargando modelo ligero (qwen2.5:1.7b)...${NC}"
ollama pull qwen2.5:1.7b

# 3. Configurar Python y Entorno
echo -e "${BLUE}📦 Configurando entorno de Python...${NC}"
python3 -m venv venv
./venv/bin/pip install ollama --quiet

# 4. Datos del Usuario
read -p "📂 Introduce la ruta de tu Bóveda de Obsidian: " VAULT_PATH
read -p "⌨️  ¿Qué nombre quieres para el comando? (ej. notas): " COMMAND_NAME

# Inyectar la ruta en el script de python
sed -i "s|VAULT_PATH = .*|VAULT_PATH = \"$VAULT_PATH\"|g" agente.py

# 5. CREAR BINARIO GLOBAL (Independiente del Shell)
# Creamos un pequeño "wrapper" que ejecute el venv y el script
cat <<EOF > $COMMAND_NAME
#!/bin/bash
$(pwd)/venv/bin/python $(pwd)/agente.py "\$@"
EOF

chmod +x $COMMAND_NAME

echo -e "${BLUE}🔐 Solicitando permisos para crear comando global...${NC}"
sudo mv $COMMAND_NAME /usr/local/bin/

echo -e "${GREEN}✅ ¡Instalación Exitosa!${NC}"
echo -e "Ahora puedes usar el comando ${BLUE}$COMMAND_NAME${NC} desde cualquier parte."
