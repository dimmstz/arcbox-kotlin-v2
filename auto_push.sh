#!/bin/bash

echo "🚀 Iniciando processo de atualização do repositório..."

# 1. Ajustar permissão do gradlew
chmod +x gradlew

# 2. Configurar o Git (se ainda não estiver)
git config --global --add safe.directory '*'

# 3. Adicionar todas as alterações
git add .

# 4. Solicitar mensagem de commit (ou usar uma mensagem padrão se deixar em branco)
read -p "Digite a mensagem do commit [Update automatico]: " msg
msg=${msg:-"Update automatico"}

# 5. Criar o commit
git commit -m "$msg"

# 6. Enviar para o GitHub
echo "📤 Enviando alterações para a branch main..."
git push origin main

echo "✅ Sucesso! As alterações foram enviadas e a build no Codemagic deve começar."
