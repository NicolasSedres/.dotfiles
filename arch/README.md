#Arch Instalation Guide

##Pre Requisites

first check if the current systm is uefi or bios, and if the partition is gpt or mbr
create the usb with the arch iso and rufus following it is bios/uefi and gpt/mbr
disable secure boot and if is there rapid storage.
boot the usb and then run the following commands:

##-------------------------KICKSTART--------------------------------------------------
setfont ter-232n                                ##to increase the font size
cat /sys/firmware/efi/fw_platform_size          ##to verify the boot mode :64 UEFI 64bit :32 UEFI 32bit :if the file doesnt exist BIOS mode
ping archlinux.org -c 5                         ##to check if the pc has connection
timedatectl list-timezones                      ##to list the time zones
timedatectl set-timezone America/Montevideo     ##to set the timezone
timedatectl status                              ##to check the timsezone
##--------------------------FORMAT-AND-MOUNT-------------------------------------------
lsblk                                           ##to list the disk and the partitions
cfdisk /dev/{the_disk_to_be_partitioned}          ##to create the partitions for arch.
                                                create 3 partitions from free space
                                                    -one for root (minimum 10gb)
                                                    -one for home (minimum 10gb)
                                                    -one for swap (minimum 4gb)
mkfs.ext4 /dev/{root_partition}                 ## to format the partition
mkfs.ext4 /dev/{home_partition}                 ## to format the partition
mkswap /dev/{swap_partition}                    ## to format the partition
swapon /dev/{swap_partition}                    ## to enable swap partition
mount /dev/{root_partition} /mnt                ## to mount the root volume to /mnt
mkdir /mnt/home
mount /dev/{home_partition} /mnt/home           ## to mount the home volume to /mnt/home
##-------------------------INSTALLATION------------------------------------------------
cp /ect/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp        ##make a backupfile for the mirrorlist
pacman -Sy                                      ## update pacman database
pacman -S pacman-contrib                        ## to install rank tool
rankmirrors -n 10 /etc/pacman.d/mirrorlist.bkp > /etc/pacman.d/mirrorlist       ##update the mirror file with the 10 best mirror
pacstrap -i /mnt base linux linux-firmware base-devel linux-lts linux-headers intel-ucode sudo git neofetch networkmanager dhcpcd pulseaudio neovim vim                 ##command to install the necesarie packages for arch
##-------------------------CONFIGURATION-----------------------------------------------
genfstab -U /mnt >> /mnt/etc/fstab              ## to automaticaly mount the partition as we did.
arch-chroot /mnt                                ## change root into the new system
passwd                                          ## to update the root password
useradd -m username
passwd username
usermod -aG wheel username        ## to add the username to the groups
EDITOR=nvim visudo                              ## uncomment ## %wheel ALL=(ALL) ALL
nvim /etc/locale.gen                            ## uncomment #en_US.UTF8-8 UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo nameOfThePc > /etc/hostname
nvim /etc/hosts                                 ##add the following lines 
                                                    127.0.0.1       localhost
                                                    ::1             localhost
                                                    127.0.1.1       nameOfThePc.localdomain     localhost
ln -sf /usr/share/zoneinfo/America/Montevideo /etc/localtime        ##create a symbolic link to the time
hwclock --systohc
mkdir /boot/efi
mount /dev/{efi_partition} /boot/efi/           ## mount the efi partition to the efi folder that we create
pacman -S grub efibootmgr dosfstools mtools
nvim /etc/default/grub                          ##uncomment last line #GRUB_DISABLE_OS_PROBER=fale
pacman -S os-prober
pacman -S ntfs-3g
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg            ##generate the grub file
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
exit
umount -lR /mnt
reboot
mount /dev/{windows_efi_partition} /mnt                ## to recognize the windows bootloader instalation, to know the partition search for cmd on windows and run bcdedit look for windows boot loader 
grub-mkconfig -o /boot/grub/grub.cfg            ##generate the grub file

##---------------------------POST-CONFIGURATION---------------------------------------------
sudo timedatectl set-ntp true       ##to synchronize the time
git clone https://aur.archlinux.org/yay-bin.git  ## to install yay
    makepkg -si
sudo pacman -S sddm 
sudo systemctl enable sddm                  ##enable graphic login
install https://wiki.hyprland.org/Getting-Started/Installation/
    yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio
    git clone --recursive https://github.com/hyprwm/Hyprland
    cd Hyprland
    sudo make install
pacman -S kitty     ##Terminal
pacman -S waybar    ##task bar
pacman -S hyprpaper ##wallpapers
pacman -S wl-clipboard      ##clipboard
pacman -S cliphist  ##clipmanager
yay -S rofi-lbonn-wayland-git   ##app launcher
pacman -S mako      ##notifications
pacman -S pipewire wireplumber ##to sharescreen
pacman -S xdg-desktop-portal-hyprland   ##also to screensharing and app comunication
pacman -S polkit-kde-agent  ##to popup windows asking for privilegis
pacman -S qt5-wayland qt6-wayland
pacman -S dolphin   ##file explorer
pacman -S hyprpicker ##color picker
pacman -S ttf-jetbrains-mono-nerd
pacman -S ttf-nerd-fonts-symbols
pacman -S noto-fonts-cjk
pacman -S noto-fonts-emoji
pacman -S qt5ct     ##aldo add this line to /etc/environment  QT_QPA_PLATFORMTHEME=qt5ct
pacman -S pavucontrol   ##to manage audio
pacman -S pamixer       ##also to manage audio
yay -S wlogout          ##to logout restart..
pacman -S bluez bluez-utils ##bluetooth manager
yay -S swaync   ##notification daemon
yay -S swaylock-effects-git  ##to lock the computer
yay -S chili-sddm-theme     ##theme for sddm login
                            modify the file /usr/lib/sddm/sddm.conf.d/sddm.config
                            and set the line of Current=chili
sudo pacman -S grim swappy slurp  ##to take screenshots
##------------------------SYMBOLIC-LINKS---------------------------------------------
ln -s ~/.dotfiles/arch/fontconfig ~/.config/fontconfig
ln -s ~/.dotfiles/arch/firefox ~/.config/firefox
ln -s ~/.dotfiles/arch/gtk-3.0 ~/.config/gtk-3.0
ln -s ~/.dotfiles/arch/hypr ~/.config/hypr
ln -s ~/.dotfiles/arch/kitty ~/.config/kitty
ln -s ~/.dotfiles/arch/neofetch ~/.config/neofetch
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/arch/rofi ~/.config/rofi
ln -s ~/.dotfiles/arch/swaylock ~/.config/swaylock
ln -s ~/.dotfiles/arch/swaync ~/.config/swaync
ln -s ~/.dotfiles/arch/waybar ~/.config/waybar
ln -s ~/.dotfiles/arch/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
##------------------------FIREFOX----------------------------------------------------
Type about:profiles into your urlbar and go to the page
Open the root directory folder specified on the page
Inside this folder,Create a simbolic link from firefox/chrome 
Type about:config into your urlbar and go to the page
Paste toolkit.legacyUserProfileCustomizations.stylesheets into the bar and set its value to true
Go back to about:profiles and click the restart normally buton
##-------------------------NVIDIA-SUPPORT----------------------------------------------
-determine and install nvidia driver: *run neofetch and check the kernel(linux,lts,other) *check driver need according to archwebsite
-pacman -S nvidia-utils nvidia-settings
-Remove kms from the HOOKS array in /etc/mkinitcpio.conf
-sudo mkinitcpio -P
---------------------------NVIDIA-HYPRLAND---------------------------------------------
-for people using grub you can do this by adding nvidia_drm.modeset=1 to the end of GRUB_CMDLINE_LINUX_DEFAULT= in /etc/default/grub
-sudo grub-mkconfig -o /boot/grub/grub.cfg
-in /etc/mkinitcpio.conf add nvidia nvidia_modeset nvidia_uvm nvidia_drm to your MODULES
-sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
-add a new line to /etc/modprobe.d/nvidia.conf (make it if it does not exist) and add the lines above
                                                                                options nvidia-drm modeset=1
                                                                                options nvidia "NVreg_UsePageAttributeTable=1"
                                                                                options nvidia "NVreg_PreserveVideoMemoryAllocations=1"
                                                                                options nvidia "NVreg_TemporaryFilePath=/var/tmp"
                                                                                options nvidia "NVreg_EnableS0ixPowerManagement=1"

