#! /bin/bash

if [ -f /etc/debian_version ]; then
	if [ ! -d ~/.oh-my-zsh ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi

	cp -r ./home/.config/* ~/.config 2> /dev/null

	xargs -a packages/deb-pkgs.txt sudo apt install -y
	xargs -a packages/snap-pkgs.txt snap install --classic

	if command -v rustup &> /dev/null; then
		rustup toolchain install stable
		rustup default stable
		rustup component add rust-analyzer clippy rustfmt
		#если добавятся пакеты cargo
		#xargs -a packages/cargo-pkgs.txt cargo install --locked
	fi

	if ! command -v pipx &> /dev/null; then
		python3 -m pip install --user pipx
		python3 -m pipx ensurepath
	fi

	pipx install uv
	pipx ensurepath

	chsh -s $(which zsh)
fi
