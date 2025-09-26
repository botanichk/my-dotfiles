# ⚙️ Настройка Zsh + Oh My Zsh + Powerlevel10k

Пошаговая инструкция по настройке оболочки Zsh с темой Powerlevel10k и полезными плагинами.

---

## 🐧 Шаг 1: Сделать Zsh основной оболочкой

```
chsh -s /bin/zs
```
🐧 Шаг 2: Установка Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
🐧 Шаг 3: Установка темы Powerlevel10k

```
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
```
Открой .zshrc:

```
nano ~/.zshrc
```
Найди строку с ZSH_THEME= и замени на:

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```
🐧 Шаг 4: Установка плагинов

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

В .zshrc пропиши:

```
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
```

🐧 Шаг 5: Завершение настройки .zshrc
Убедись, что в .zshrc есть:

```
ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
```
🐧 Шаг 6: Применить настройки

```
source ~/.zshrc
```
