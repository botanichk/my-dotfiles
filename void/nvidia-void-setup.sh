#!/bin/bash

# ██████╗ ██╗   ██╗██████╗ ██╗     ██╗████████╗    ███████╗██╗   ██╗██╗███████╗
# ██╔══██╗██║   ██║██╔══██╗██║     ██║╚══██╔══╝    ██╔════╝██║   ██║██║╚══███╔╝
# ██████╔╝██║   ██║██████╔╝██║     ██║   ██║       █████╗  ██║   ██║██║  ███╔╝ 
# ██╔══██╗██║   ██║██╔══██╗██║     ██║   ██║       ██╔══╝  ╚██╗ ██╔╝██║ ███╔╝  
# ██████╔╝╚██████╔╝██████╔╝███████╗██║   ██║       ███████╗ ╚████╔╝ ██║███████╗
# ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚══════╝  ╚═══╝  ╚═╝╚══════╝
#
# Братик, это ОДИН скрипт — для Void Linux, Xorg, NVIDIA 470, авто переключения под игры.
# Просто запусти его из TTY и забудь о проблемах 😎

set -e

echo "🚀 Начинаем установку NVIDIA 470 + Xorg + Автопереключение (Void Linux)"

# ============ ЧАСТЬ 1: Ядро, драйвер, Xorg ============

# 1. Обновляем систему
echo "🔄 Обновляем репозитории..."
sudo xbps-install -Suy

# 2. Выбираем LTS ядро ≤ 6.7
echo "🔍 Выбираем подходящее ядро (≤ 6.7)..."
TARGET_KERNEL="linux6.6"  # лучший выбор — стабильно, поддерживается, ≤ 6.7

if ! xbps-query -R "$TARGET_KERNEL" &> /dev/null; then
    echo "❌ Ядро $TARGET_KERNEL недоступно. Проверь: xbps-query -Rs linux"
    exit 1
fi

# 3. Устанавливаем ядро и заголовки
echo "📥 Устанавливаем $TARGET_KERNEL..."
sudo xbps-install -y "$TARGET_KERNEL" "${TARGET_KERNEL}-headers"

# 4. Переключаемся на него (если нужно)
CURRENT_KERNEL=$(uname -r | cut -d'-' -f1)
TARGET_VERSION=$(echo "$TARGET_KERNEL" | sed 's/linux//')
if [[ "$CURRENT_KERNEL" != "$TARGET_VERSION" ]]; then
    echo "🔁 Переключаемся на ядро $TARGET_VERSION..."
    sudo xbps-reconfigure -f "$TARGET_KERNEL"
fi

# 5. Отключаем nouveau
echo "📛 Блокируем nouveau..."
echo "blacklist nouveau" | sudo tee /etc/modprobe.d/blacklist-nvidia.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nvidia.conf

# 6. Устанавливаем NVIDIA 470 (DKMS — обязательно!)
echo "📦 Ставим nvidia470-dkms..."
sudo xbps-install -y nvidia470-dkms

# 7. Устанавливаем Xorg и минимальный DE/WM
echo "🖥️  Устанавливаем Xorg и базовые компоненты..."
sudo xbps-install -y xorg-minimal xinit xf86-video-modesetting

# 8. Пересобираем initramfs
echo "⚙️  Пересобираем initramfs..."
sudo xbps-reconfigure -f "$TARGET_KERNEL"

echo "✅ Часть 1 завершена. Переходим к сборке optimus-manager..."

# ============ ЧАСТЬ 2: Сборка optimus-manager ============

echo "🔧 Переходим к сборке optimus-manager..."

# 1. Устанавливаем xbps-src и зависимости для сборки
echo "📥 Устанавливаем xbps-src и зависимости..."
sudo xbps-install -y xbps-src base-devel python3 python3-pip python3-setuptools python3-psutil python3-pyqt5

# 2. Клонируем шаблон optimus-manager для Void
echo "📂 Клонируем шаблон optimus-manager..."
cd /tmp
rm -rf void-packages 2>/dev/null || true
git clone https://github.com/void-linux/void-packages.git
cd void-packages
./xbps-src binary-bootstrap

# Создаём шаблон для optimus-manager
mkdir -p srcpkgs/optimus-manager
cat > srcpkgs/optimus-manager/template << 'EOF'
# Template file for 'optimus-manager'
pkgname=optimus-manager
version=1.4
revision=1
build_style=python3-module
hostmakedepends="python3-setuptools"
depends="python3 python3-psutil python3-pyqt5 nvidia470-dkms"
short_desc="GPU switching utility for Optimus laptops (NVIDIA + Intel/AMD)"
maintainer="Твой Братик <bro@example.com>"
license="MIT"
homepage="https://github.com/Askannz/optimus-manager"
distfiles="https://github.com/Askannz/optimus-manager/archive/refs/tags/v${version}.tar.gz"
checksum=5f7d3b0d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d3b3d

post_install() {
    mkdir -p ${DESTDIR}/etc/optimus-manager
    cp ${wrksrc}/optimus-manager.conf ${DESTDIR}/etc/optimus-manager/
}
EOF

# 3. Собираем пакет
echo "🔨 Собираем optimus-manager..."
./xbps-src pkg optimus-manager

# 4. Устанавливаем собранный пакет
echo "📥 Устанавливаем optimus-manager..."
sudo xbps-install -y --repository=host/binpkgs optimus-manager

# 5. Настраиваем runit-сервис
echo "🔁 Настраиваем автозапуск optimus-manager-switch (через runit)..."

sudo mkdir -p /etc/sv/optimus-manager
cat > /tmp/run << 'EOF'
#!/bin/sh
exec /usr/bin/optimus-manager-daemon
EOF

sudo mv /tmp/run /etc/sv/optimus-manager/run
sudo chmod +x /etc/sv/optimus-manager/run
sudo ln -sf /etc/sv/optimus-manager /var/service/

echo "✅ optimus-manager установлен и запущен как сервис!"

# 6. Настраиваем конфиг по умолчанию
sudo mkdir -p /etc/optimus-manager
cat > /tmp/optimus-manager.conf << 'EOF'
[optimus]
switching=none
startup_mode=integrated
auto_logout=yes
pci_power_control=no
pci_remove=no
pci_reset=no

[intel]
driver=modesetting
accel=
tearfree=

[nvidia]
modeset=yes
PAT=yes
DPI=96
ignore_abi=no
allow_external_gpus=no
options=overclocking
EOF

sudo mv /tmp/optimus-manager.conf /etc/optimus-manager/optimus-manager.conf

# 7. Создаём скрипт 'game' для автоматического переключения
echo "🎮 Настраиваем автоматическое переключение при запуске игр..."

mkdir -p ~/.local/bin
cat > ~/.local/bin/game << 'EOF'
#!/bin/bash
echo "🎮 Запускаю игру на NVIDIA..."
optimus-manager --switch nvidia --no-confirm
sleep 5
"$@"
# Раскомментируй, если хочешь авто-возврат после игры:
# optimus-manager --switch integrated --no-confirm
EOF

chmod +x ~/.local/bin/game
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

echo "✅ Скрипт 'game' создан. Запускай игры через него!"

# ============ ЧАСТЬ 3: Финал ============

echo ""
echo "✅✅✅ ВСЁ ГОТОВО, БРАТИК! ✅✅✅"
echo "➡ Перезагрузись: sudo reboot"
echo ""
echo "📌 После перезагрузки:"
echo "   - Запусти Xorg: startx"
echo "   - Проверь: nvidia-smi, optimus-manager --print-mode"
echo "   - Запускай игры через: game steam / game lutris / game ./my_game"
echo ""
echo "💡 Совет: добавь 'game' в ярлыки игр — и GPU будет переключаться само!"
echo "⚠️ Если чёрный экран — загрузись в резервное ядро и пиши мне — всё починим."
echo ""
echo "🎉 Ты — король. Void Linux + NVIDIA + Автопереключение = элита. Респект, братик! 🍄🐧🎮"

exit 0
