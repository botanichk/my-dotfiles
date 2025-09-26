🧙 Marsik-Zsh Installer
Преврати свой терминал в приключение с Powerlevel10k, автодополнением и радужной подсветкой команд.

🚀 Установка
Ничего не качай вручную — просто скопируй и запусти:
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/botanichk/my-dotfiles/main/void/install-zsh.sh)"
```
Today
Братик,напиши мне скрипт ,я тебе ссылки сейчас дам и ты поймешь что я хочу
Конечно, братик, кидай ссылки — разберёмся, что ты задумал, и соберём скрипт как надо: с юмором, стилем и кнопкой «Copy» на GitHub 😎. Жду твои ссылки!

sudo chsh -s /bin/zsh ,sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)",git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k ,git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ,git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ,sudo nano ~/.zshrc ,ZSH_THEME="powerlevel10k/powerlevel10k" ,plugins=( git zsh-syntax-highlighting zsh-autosuggestions ) , понял чтояхочу zsh , git ,curl ,wget устанавливать скриптом не надо ,они уже будут .
Понял тебя, братик. Ты хочешь скрипт, который:

Переключает оболочку на Zsh

Ставит Oh My Zsh

Подключает Powerlevel10k

Добавляет два плагина: автодополнение и подсветку синтаксиса

Настраивает .zshrc с нужной темой и плагинами

Вот тебе скрипт в стиле Marsik-квеста, с юмором и кнопкой «Copy» на GitHub:

bash
#!/bin/bash
# 🧙‍♂️ Marsik-Zsh Installer: преврати свой терминал в магию

echo "🔄 Переключаем оболочку на Zsh..."
sudo chsh -s /bin/zsh

echo "✨ Устанавливаем Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "🎨 Подключаем Powerlevel10k — терминальный шик..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "🧠 Добавляем автодополнение и подсветку синтаксиса..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "🛠️ Настраиваем .zshrc — как герой терминала..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

echo "🚀 Готово! Перезапусти терминал и наслаждайся новым обликом."
Хочешь, добавим ASCII-заставку, звуковой сигнал или Marsik-комментарии в .zshrc? Или оформить это как установочный .deb с сюрпризом?

github.com

github.com

Show all
а в sudo nano ~/.zshrc он сам все сделает или мне самому надо вносить изменения ?
Хороший вопрос, братик 💡

Команда sudo nano ~/.zshrc просто открывает файл .zshrc в текстовом редакторе nano с правами суперпользователя. Она ничего не меняет сама по себе — это как открыть блокнот: дальше всё зависит от тебя.

🔧 Если ты хочешь, чтобы изменения в .zshrc происходили автоматически, то лучше использовать команды вроде:

bash
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
Они сами найдут нужные строки и заменят их. Без ручного редактирования.

🧙‍♂️ А если ты хочешь сам кастомизировать, добавить комментарии, ASCII-арт или Marsik-магии — тогда nano в руки и вперёд! Это как ручная настройка меча перед боем.

Хочешь, я добавлю в скрипт автоматическую настройку .zshrc с твоим стилем? Или сделаю шаблон .zshrc, чтобы ты просто скопировал?

github.com

Да добавь автоматическую настройку zshrc
Вот тебе, братик, полный Marsik-style скрипт с автоматической настройкой .zshrc, чтобы всё было красиво, удобно и без лишних движений:

bash
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
Если хочешь, могу добавить ASCII-заставку, звуковой сигнал при запуске или даже кастомный привет в терминале типа:

bash
echo "Добро пожаловать, герой терминала!" | lolcat
Скажи, как хочешь кастомизировать — сделаем как в сказке.

github.com

github.com

Show all
Нет братик пока украшать не будем ,а вот сюда https://github.com/botanichk/my-dotfiles/tree/main/void надо его сохранить ,и если можно обойтись безлокального файла то было бы отдично. Чуть что это мое хранилище
Понял тебя, братик. Раз ты хочешь сохранить скрипт прямо в репозиторий botanichk/my-dotfiles → void, и желательно без создания локального файла, то вот тебе пошаговый терминальный квест, как герой .dotfiles может это сделать:

🧙‍♂️ Marsik-метод: сохранить скрипт напрямую в GitHub
📜 Шаг 1: Создаём файл прямо в GitHub через curl и gh (если установлен)
Если у тебя установлен GitHub CLI (gh), можно сделать пуш без локального файла:

bash
gh repo clone botanichk/my-dotfiles -- --depth=1
cd my-dotfiles/void

# Создаём файл install-zsh.sh с содержимым
cat <<'EOF' > install-zsh.sh
#!/bin/bash
# 🧙 Marsik-Zsh Installer: преврати терминал в приключение

echo "🔄 Переключаем оболочку на Zsh..."
sudo chsh -s /bin/zsh

echo "✨ Устанавливаем Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "🎨 Подключаем Powerlevel10k — терминальный шик..."
git clone https://github.com/romkatv/powerlevel10k.git \$ZSH_CUSTOM/themes/powerlevel10k

echo "🧠 Добавляем автодополнение и подсветку синтаксиса..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "🛠️ Настраиваем .zshrc автоматически..."
ZSHRC="\$HOME/.zshrc"
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "\$ZSHRC"
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' "\$ZSHRC"

grep -q "# Marsik-style Zsh setup" "\$ZSHRC" || cat <<EOC >> "\$ZSHRC"

# Marsik-style Zsh setup 🧙
# Подключены:
# - Powerlevel10k: тема терминального величия
# - zsh-syntax-highlighting: радуга команд
# - zsh-autosuggestions: терминальный телепат
EOC

echo "🚀 Готово! Перезапусти терминал и наслаждайся новым обликом."
EOF

# Добавляем и пушим
git add install-zsh.sh
git commit -m "Добавлен Marsik-скрипт установки Zsh"
git push
🪄 Альтернатива: через GitHub Web UI
Если хочешь вообще без терминала — просто:

Перейди в void-папку репозитория

Нажми "Add file" → "Create new file"

Назови файл install-zsh.sh

Вставь туда скрипт (я тебе его выше дал)

Commit — и готово!

Хочешь, я помогу оформить README.md для этой папки, чтобы скрипт выглядел как часть терминального приключения?

github.com

Этим воспользовался Альтернатива: через GitHub Web UI он уже там ))
Красавчик, братик 😎 Всё по Marsik-квесту: без лишних файлов, прямо в репу, как герой .dotfiles! Скрипт теперь живёт в void, и любой, кто туда заглянет, почувствует терминальный уют.

Если захочешь:

Оформить README.md с кнопкой «Copy» и мини-инструкцией

Добавить установку alias'ов или приветствие при запуске

Сделать установку через curl | bash как у настоящих терминальных магов

— просто свистни, я рядом и готов к новым подвигам 🧙‍♂️

а вот это Оформить README.md с кнопкой «Copy» и мини-инструкцией я и хотелпопросить ,но мой братик моложе и потому всегда первый ))
Вот это дух, братик! 😄 А теперь держи README.md, оформленный как терминальный квест с кнопкой «Copy» и мини-инструкцией, чтобы любой герой мог установить Zsh с Powerlevel10k и не потеряться:

🧙 Marsik-Zsh Installer
Преврати свой терминал в приключение с Powerlevel10k, автодополнением и радужной подсветкой команд.

🚀 Установка
Ничего не качай вручную — просто скопируй и запусти:

bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/botanichk/my-dotfiles/main/void/install-zsh.sh)"
🪄 Copy-кнопка появится автоматически на GitHub, если обернуть команду в тройные кавычки как выше.

🔧 Что делает скрипт
Переключает оболочку на Zsh

Устанавливает Oh My Zsh

Подключает тему Powerlevel10k

Добавляет плагины:

zsh-syntax-highlighting

zsh-autosuggestions

Настраивает .zshrc автоматически с Marsik-комментариями
---
📦 Требования
Zsh, Git, curl, wget — уже должны быть установлены
