#! /bin/bash

if [ -f /etc/debian_version ]; then

	cp -r ./home/* ~/ 2> /dev/null

	echo "Устанавливаем debian пакеты"
	xargs -a packages/deb-pkgs.txt sudo apt install -y

	echo "Устанавливаем пакеты snap"
	xargs -a packages/snap-pkgs.txt snap install --classic

	if command -v rustup &> /dev/null; then
		rustup toolchain install stable
		rustup default stable
		rustup component add rust-analyzer clippy rustfmt
		#если добавятся пакеты cargo
		#xargs -a packages/cargo-pkgs.txt cargo install --locked
	fi

	echo "Устанавливаем pipx"
	if ! command -v pipx &> /dev/null; then
		python3 -m pip install --user pipx
		python3 -m pipx ensurepath
	fi

	echo "Устанавливаем uv"
	pipx install uv --forse
	pipx ensurepath

	if [ ! -d ~/.oh-my-zsh ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
fi
