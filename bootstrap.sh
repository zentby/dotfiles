#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

doIt;
unset doIt;

# install extra tools

sudo apt update -y
sudo apt install -y autojump zsh-syntax-highlighting

git clone https://github.com/tom-auger/cmdtime ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/cmdtime
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-npm-scripts-autocomplete

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

curl -fsSL https://fnm.vercel.app/install | bash

sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
