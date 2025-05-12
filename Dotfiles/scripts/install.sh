#!/bin/bash
read -p "Qual o seu gerenciador de pacotes: " packager_manager

packages=("cmatrix" "htop") # Adicione o que você quiser, isso é só um exemplo de ferramentas

packager_managers=("pacman" "dnf" "yum" "apt" "zypper")

if [[ $packager_manager == "${packager_managers[0]}" ]]; then
	for i in "${packages[@]}"; do
		if ! pacman -Qs | grep -q "${i}"; then
			echo "$i não encontrado. Instalando..."
			sudo pacman -Syu --noconfirm "${i}"
		else
			echo "$i já está instalado"
		fi
	done
elif [[ $packager_manager == "${packager_managers[1]}" || $packager_manager == "${packager_managers[2]}" ]]; then
	for i in "${packages[@]}"; do
		if ! rpm -q "$i" &>/dev/null; then
			echo "$i não encontrado. Instalando..."
			sudo "${packager_manager}" install "${i}" -y
		else
			echo "$i já está instalado"
		fi
	done
elif [[ $packager_manager == "${packager_managers[3]}" ]]; then
	for i in "${packages[@]}"; do
		if ! dpkg -l | grep -wq "${i}"; then
			echo "$i não encontrado. Instalando..."
			sudo apt install "${i}" -y
		else
			echo "$i já está instalado"
		fi
	done
elif [[ $packager_manager == "${packager_managers[4]}" ]]; then
	for i in "${}packages[@]"; do
		if ! zypper search --installed-only "$i" &>/dev/null; then
			echo "$i não encontrado. Instalando..."
			sudo zypper install "${i}" -y
		else
			echo "$i já está instalado"
		fi
	done
else
	echo "ERRO: Gerenciador de pacotes não configurado ou não existente"
fi
