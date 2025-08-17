#!/usr/bin/env bash

# Setup shell (ZSH)

brew update
brew install zsh

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ ! -f "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/cmdtime" ] && git clone https://github.com/tom-auger/cmdtime ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/cmdtime
[ ! -f "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -f "~/.zsh/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# Install stuff

if [ ! -f "~/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi

# installs fnm (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash
# download and install Node.js
$HOME/.local/share/fnm/fnm use --install-if-missing 22

brew tap FelixKratz/formulae
brew install fd lazygit neovim borders jq \
  sketchybar docker autojump zsh-autosuggestions \
  grep openssh git-lfs tree
brew install --cask sf-symbols font-hack-nerd-font font-sketchybar-app-font ghostty nikitabobko/tap/aerospace

brew cleanup

# Copy/replace configs

mkdir -p ~/.config
cp -r aerospace ~/.config/
cp -r sketchybar ~/.config/
cp -r nvim ~/.config/
cp -r ghostty ~/.config/

cp .zshrc ~/

aerospace
brew services restart sketchybar
