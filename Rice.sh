#!/usr/bin/zsh

cd ~
clear
echo -e "\033[1;36m"  # set color to cyan

cat << "EOF"
|     █████╗ ██████╗  ██████╗██╗  ██╗      ██████╗ █████╗ ███████╗███████╗██████╗  |
|    ██╔══██╗██╔══██╗██╔════╝██║  ██║      ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗|
|    ███████║██████╔╝██║     ███████║ ████ █████╔╝███████║███████╗█████╗  ██║  ██║ |
|    ██╔══██║██╔══██╗██║     ██╔══██║ ╚══╝ ██╔══██╗██╔══██║╚════██║██╔══╝  ██║  ██║|
|    ██║  ██║██║  ██║╚██████╗██║  ██║      ██████╔╝██║  ██║███████║███████╗██████╔╝|
|    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ |
EOF
echo -e "\033[1;35m"  # set color to magenta
cat << "EOF"
|                _____          ______                                             |
|                |  __ \       |____  |                                            |
|                | |  | |  __ _    / / _ __ ___    __ _ _ __                       |
|                | |  | | / _` |  / / | '_ ` _ \  / _` || '_ \                     |
|                | |__| || (_| | / /  | | | | | || (_| || | | |                    |
|                |_____/  \__,_|/_/   |_| |_| |_| \__,_||_| |_|                    |
EOF
echo -e "\033[1;33m"  # set color to yellow
echo "|==================================================================================|"
echo "|                Arch-Based  niggaland installation Script by Da7man               |"
echo "|==================================================================================|"
echo -e "\033[0m"  # reset color
sleep 2

ask_yes_no() {
    echo -n "$1 (y/n): "                                 # print question without a newline
    read answer                                          # get the user input
    case ${answer:l} in                                  # convert answer to lowercase with :l
        y|yes) return 0 ;;                               # return 0 (success) for yes
        n|no) return 1 ;;                                # return 1 (failure) for no
        *) echo "nigga answer and damn question"         # invalid response
           ask_yes_no "$1" ;;                            # ask the question again
    esac
}
if ask_yes_no "Do you want to run this shit on ur system?"; then
    echo "I gotchu..."
    # Add your installation commands here
else
    echo "Nigga get out of here."
    exit 0
fi


echo "Starting the sys setup process..."





echo "==> Updating ur system packages"
sudo pacman -Syu --noconfirm

echo "==> Setup the damn terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "==> Make the some shit u don't know executable"
sudo chmod +x ~/dotfiles/.config/viegphunt/*

echo "==> Download niggas wallpaper"
git clone --depth 1 https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/Pictures/Wallpapers
mv ~/Wallpaper-Collection/Wallpapers/* ~/Pictures/Wallpapers
rm -rf ~/Wallpaper-Collection

echo "==> Install virus i mean package"
~/dotfiles/.config/viegphunt/install_archpkg.sh

echo "==> Enable niggatooth"
sudo systemctl enable --now bluetooth

echo "==> Enable niggaworkmanager"
sudo systemctl enable --now NetworkManager

echo "==> Set Ghostty as the default terminal emulator for Nemo"
gsettings set org.cinnamon.desktop.default-applications.terminal exec ghostty

echo "==> Apply the niggas fonts"
fc-cache -fv

echo "==> Set a nigger cursor"
~/dotfiles/.config/viegphunt/setcursor.sh

echo "==> Stow the damn fdotfiles"
cd ~/dotfiles
stow -t ~ .
cd ~

echo "==> Check display manager"
if [[ ! -e /etc/systemd/system/display-manager.service ]]; then
    sudo systemctl enable sddm
    echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee -a /etc/sddm.conf
    echo "sddm has been enabled."
fi


clear


echo "*********************************************************************"
echo "*                    Niggaland setup is complete!                   *"
echo "*                                                                   *"
echo "*              REBOOT your damn system to apply all changes.        *"
echo "*                                                                   *"
echo "*                            Enjoy nigga!!                          *"
echo "*********************************************************************"







