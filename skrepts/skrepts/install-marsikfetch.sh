#!/bin/bash
set -e

mkdir -p ~/.local/bin

curl -fsSL https://raw.githubusercontent.com/botanichk/my-dotfiles/main/skrepts/mafetch -o ~/.local/bin/marsik
chmod +x ~/.local/bin/marsik

if ! grep -q 'alias marsik=' ~/.zshrc; then
  echo 'alias marsik="~/.local/bin/marsik"' >> ~/.zshrc
fi

echo "✅ Marsikfetch установлен! Перезапусти терминал или выполни: source ~/.zshrc"
