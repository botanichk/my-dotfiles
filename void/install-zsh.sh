#!/bin/bash
# 🧙 Marsik-Zsh Installer: преврати терминал в приключение

echo "🔄 Переключаем оболочку на Zsh..."
sudo chsh -s /bin/zsh

echo "✨ Устанавливаем Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "🎨 Подключаем Powerlevel10k — терминальный шик..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "🧠 Добавляем автодополнение и подсветку синтаксиса..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "🛠️ Настраиваем .zshrc автоматически..."
ZSHRC="$HOME/.zshrc"

# Заменяем тему
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"

# Заменяем список плагинов
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' "$ZSHRC"

# Добавляем Marsik-комментарии, если их нет
grep -q "# Marsik-style Zsh setup" "$ZSHRC" || cat <<EOF >> "$ZSHRC"

# Marsik-style Zsh setup 🧙
# Подключены:
# - Powerlevel10k: тема терминального величия
# - zsh-syntax-highlighting: радуга команд
# - zsh-autosuggestions: терминальный телепат
EOF

echo "🚀 Готово! Перезапусти терминал и наслаждайся новым обликом."
