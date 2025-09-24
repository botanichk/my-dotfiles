## 🚀 Установка
📦 Клонируем репозиторий с конфигами:

```bash
git clone https://github.com/botanichk/my-dotfiles.git

```
## 🐾 Установка Mafetch — терминальный агент Марсика

📦 Шаг 1: Создаём скрипт в домашней папке

```bash
nano ~/mafetch
```
✏️ Вставь туда Marsik-скрипт (можно скопировать из skrepts/mafetch или прямо из README)
🔧 Шаг 2: Делаем скрипт исполняемым
```
chmod +x ~/mafetch
```
🚚 Шаг 3: Перемещаем в системный путь
```
sudo mv ~/mafetch /usr/local/bin/mafetch
```
🧪 Шаг 4: Запускаем Marsik'а
```
mafetch
```
