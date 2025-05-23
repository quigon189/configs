#! /bin/bash

echo "Для установки пакетов требуются права администратора"
sudo -v || exit 1

if [ -f /etc/debian_version ]; then

	if [ -f packages/deb-pkgs.txt ]; then
		echo "Устанавливаем debian пакеты"
		xargs -a packages/deb-pkgs.txt sudo apt install -y
	else
		echo "Файл packages/deb-pkgs.txt не найден"
	fi

	if command -v snap && [ -f packages/snap-pkgs.txt ]; then
		echo "Устанавливаем пакеты snap"
		while read -r line; do
			pkg=$(echo "$line" | sed 's/#.*//' | xargs)
			[ -z "$pkg" ] && continue

			sudo snap install $pkg
		done < packages/snap-pkgs.txt
	else
		echo "Нет команды snap или файл packages/snap-pkgs.txt не найден"
	fi

	echo "Устанавливаем rust"
	if command -v rustup &> /dev/null; then
		rustup toolchain install stable
		rustup default stable
		rustup component add rust-analyzer clippy rustfmt
		#если добавятся пакеты cargo
		#xargs -a packages/cargo-pkgs.txt cargo install --locked
	else
		echo "Команда rustup не найдена"
	fi

	if ! command -v pipx &> /dev/null; then
		echo "Устанавливаем pipx"
		python3 -m pip install --user pipx 
		python3 -m pipx ensurepath
	fi

	echo "Устанавливаем uv"
	pipx install uv
	pipx ensurepath

	if [ ! -d ~/.oh-my-zsh ]; then
		echo "Устанавливаем Oh-My-Zsh"
		RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
		sudo chsh -s $(which zsh) $USER
	else
		echo "Oh-My-Zsh уже установлен"
	fi

	echo "Копируем файлы конфигурации"
	cp -r ./home/* ~/ 2> /dev/null

	source ~/.zshrc

	echo "Установка завершена. Перезапустите терминал"
fi
