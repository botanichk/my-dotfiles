#!/bin/bash

echo "🚀 Запуск универсального скрипта настройки системы — от братика 😎"

# 1. Настройка Git
echo "🔧 Настройка Git..."
git config --global user.name "botanichk"
git config --global user.email "botanikbot@yahoo.com"
git config --global init.defaultBranch main
git config --global credential.helper store
echo "✅ Git настроен: имя, почта, ветка, кэширование"

# 2. Создание SSH-ключа (если нет)
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "🔑 Создаю SSH-ключ..."
    ssh-keygen -t rsa -b 4096 -C "botanikbot@yahoo.com" -f ~/.ssh/id_rsa -N ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "✅ SSH-ключ создан и добавлен в агент"
else
    echo "✅ SSH-ключ уже существует — пропускаю создание"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa 2>/dev/null || echo "⚠️ Не удалось добавить ключ в агент (возможно, нужен пароль)"
fi

# 3. Показать публичный ключ — чтобы ты мог добавить его в GitHub
echo ""
echo "📌 СКОПИРУЙ ЭТОТ КЛЮЧ И ДОБАВЬ В GITHUB:"
echo "👉 https://github.com/settings/ssh/new"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
read -p "✅ Добавил ключ в GitHub? Нажми Enter, чтобы продолжить..."

# 4. Проверка подключения к GitHub
echo "🔌 Проверяю подключение к GitHub..."
ssh -T git@github.com 2>&1 | grep "successfully authenticated" && echo "✅ Успешно!" || echo "❌ Ошибка — проверь ключ в GitHub"

# 5. Клонирование репозиториев
echo "📥 Клонирую репозитории..."

mkdir -p ~/projects
cd ~/projects

# robot-Atom
if [ ! -d "robot-Atom" ]; then
    echo "📦 Клонирую robot-Atom..."
    git clone https://github.com/botanichk/robot-Atom.git
    cd robot-Atom
    git remote set-url origin git@github.com:botanichk/robot-Atom.git
    echo "✅ robot-Atom клонирован и переключён на SSH"
    cd ..
else
    echo "⚠️ robot-Atom уже существует — пропускаю"
fi

# my-dotfiles
if [ ! -d "my-dotfiles" ]; then
    echo "📦 Клонирую my-dotfiles..."
    git clone https://github.com/botanichk/my-dotfiles.git
    cd my-dotfiles
    git remote set-url origin git@github.com:botanichk/my-dotfiles.git
    echo "✅ my-dotfiles клонирован и переключён на SSH"
    cd ..
else
    echo "⚠️ my-dotfiles уже существует — пропускаю"
fi

# 6. Создание важных папок
echo "📁 Создаю важные папки..."
mkdir -p ~/appimages
mkdir -p ~/Документы/void
mkdir -p ~/.local/bin
echo "✅ Папки созданы: ~/appimages, ~/Документы/void, ~/.local/bin"

# 7. Добавление ~/.local/bin в PATH (для zsh)
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    echo "✅ Добавил ~/.local/bin в ~/.zshrc"
else
    echo "📌 ~/.local/bin уже в ~/.zshrc"
fi

# 8. Готово!
echo ""
echo "🎉 ВСЁ ГОТОВО, БРАТИК!"
echo "📌 Что сделано:"
echo "   - Git настроен"
echo "   - SSH-ключ создан и добавлен"
echo "   - Репозитории клонированы и ПЕРЕКЛЮЧЕНЫ НА SSH"
echo "   - Папки созданы"
echo "   - PATH обновлён"
echo ""
echo "💡 Перезапусти терминал или выполни:"
echo "   source ~/.zshrc"
echo ""
echo "🚀 Теперь ты готов к работе на ЛЮБОЙ системе — без HTTPS-ловушек!"
