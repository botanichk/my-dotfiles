
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
Plank: ПКМ по доку → Preferences

выбрать тему

размер иконок

позицию панели

Ulauncher: запусти ulauncher → Preferences

горячая клавиша вызова (по умолчанию <kbd>Ctrl</kbd>+<kbd>Space</kbd>)

темы оформления

расширения (plugins)

Теперь при входе в XFCE автоматически стартуют и Plank, и Ulauncher.
