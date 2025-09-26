#!/bin/bash

# Установка Oh My Zsh, Powerlevel10k и плагинов
# Проверки, безопасная установка, без повторов

set -e

# Пути
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"

# Проверка: установлен ли Oh My Zsh
if [ -d "$ZSH" ]; then
  echo "⚠️ Oh My Zsh уже установлен в $ZSH"
else
  echo "📦 Устанавливаю Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Установка Powerlevel10k
if [ -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "✅ Powerlevel10k уже установлен"
else
  echo "🎨 Устанавливаю тему Powerlevel10k..."
  git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# Установка zsh-syntax-highlighting
if [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "✅ zsh-syntax-highlighting уже установлен"
else
  echo "🧠 Устанавливаю zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Установка zsh-autosuggestions
if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "✅ zsh-autosuggestions уже установлен"
else
  echo "🔮 Устанавливаю zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Обновление ~/.zshrc
echo "⚙️ Настраиваю ~/.zshrc..."

cat > ~/.zshrc <<EOF
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source \$ZSH/oh-my-zsh.sh
EOF

echo "✅ Готово! Перезапусти терминал или выполни: source ~/.zshrc"
