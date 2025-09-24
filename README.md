
🧰 Мои конфиги и шпаргалки
...и всякое такое 🐧

Вот пример, как можно оформить README поинтересней, с кнопками и стилем:

markdown
# 🧰 Мои конфиги и шпаргалки

> *«Терминал — это не просто инструмент. Это мой мир.»*

Собрано для Void Linux, но многое подойдёт и другим 🐧

---

## 📦 Установка конфигов

```bash
git clone https://github.com/igorvoid/configs.git
cd configs
./install.sh
🧠 Шпаргалки по системе
bash
xbps-query -Rs <пакет>    # Поиск пакета
xbps-install -S <пакет>   # Установка
xbps-remove -R <пакет>    # Удаление с зависимостями
🎨 Темы и оформление
bash
cp -r themes/marsik-grub /boot/grub/themes/
nano /etc/default/grub    # Укажи тему
update-grub
🧹 Очистка системы
bash
sudo xbps-remove -Oo      # Удалить неиспользуемые пакеты
sudo xbps-remove -o       # Удалить устаревшие
