## 🚀 Установка
📦 Клонируем репозиторий с конфигами:

```bash
git clone https://github.com/botanichk/my-dotfiles.git

```
## 🐾 Установка Mafetch — терминальный агент Марсика

# 📦 Шаг 1: Создаём скрипт в домашней папке

```bash
nano ~/mafetch
```
# ✏️ Вставь туда Marsik-скрипт (можно скопировать из skrepts/mafetch или прямо из README)
# 🔧 Шаг 2: Делаем скрипт исполняемым
```
chmod +x ~/mafetch
```
# 🚚 Шаг 3: Перемещаем в системный путь
```
sudo mv ~/mafetch /usr/local/bin/mafetch
```
# 🧪 Шаг 4: Запускаем Marsik'а
```
mafetch
```
> 📁 Папка `skrepts` — это мои личные терминальные артефакты.  
> Marsik не любит скучные названия.
# 🐾 Шаг 5: А можно и так
> Если ты не хочешь клонировать репозиторий, копировать файлы, ставить права и всё такое — просто запусти одну команду, и Marsik сам поселится в твоём терминале:
```
bash <(curl -fsSL https://raw.githubusercontent.com/botanichk/my-dotfiles/main/skrepts/skrepts/install-marsikfetch.sh)
```
---
> После этого можно просто написать:
```
marsik
```
---
И он выйдет из логова, покажет терминальный лор и помашет лапкой 🐧
