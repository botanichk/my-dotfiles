
# XFCE: Plank и Ulauncher

## Установка

```
sudo xbps-install -Sy plank ulauncher
```

Автозапуск
Создай папку (если её нет):

```
mkdir -p ~/.config/autostart
```
Добавь .desktop‑файлы:
Plank

```
cat > ~/.config/autostart/plank.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOF
```

Ulauncher
```
cat > ~/.config/autostart/ulauncher.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=ulauncher --hide-window
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Ulauncher
EOF
```

Настройка
Plank: ПКМ по доку → Preferences | plank --preferences

Ulauncher: запусти ulauncher → Preferences

горячая клавиша вызова (по умолчанию <kbd>Ctrl</kbd>+<kbd>Space</kbd>)

темы оформления

расширения (plugins)

Теперь при входе в XFCE автоматически стартуют и Plank, и Ulauncher.
### добавить Ulauncher в Plank

```
nano ~/.local/share/applications/ulauncher.desktop
```

### добавить

```
[Desktop Entry]
Name=Ulauncher
Exec=ulauncher
Icon=ulauncher
Type=Application
Categories=Utility;
StartupNotify=false
```

### запустить в ручную

```
ulauncher &
```
---

## 🕒 Conky Clock

Минималистичные часы на рабочем столе через Conky.  
Конфиг: `xfce/conky/conky-clock.conf`  

```
mkdir -p ~/.conky
```

```
nano ~/.conky/conky-clock.conf
```

Автозапуск: `xfce/conky/conky.desktop`

```
mkdir -p ~/.config/autostart
```

```
nano ~/.config/autostart/conky.desktop
```

---

### 📦 Установка

```bash
sudo xbps-install -S conky
⚙️ Настройка
mkdir -p ~/.conky
cp xfce/conky/conky-clock.conf ~/.conky/

mkdir -p ~/.config/autostart
cp xfce/conky/conky.desktop ~/.config/autostart/
chmod +x ~/.config/autostart/conky.desktop
🧪 Проверка
conky -c ~/.conky/conky-clock.conf

