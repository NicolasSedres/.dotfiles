#FRESH SETUP:

## DISK MANAGEMENT:
-create disk partitions:
-lsblk #list disk
-cfdisk /dev/<disk>
        Create 3 partitions Efi
                            swap
                            linux disk
-mkfs.fat -F 32 /dev/<efi partition>
-mkswap /dev/<swap partition>
-swapon /dev/<swap partition>
-mkfs.ext4 /dev/nvme0n1p3

-mount /dev/<linux disk> /mnt
-mkdir -p /mnt/boot
-mount /dev/<efi partition> /mnt/boot

## GENERATING CONFIG (ONLY NEEDED IF HARDWARE CHANGES)
-nixos-generate-config --root /mnt
-cp /mnt/etc/nixos/hardware-configuration.nix /<route to dotfiles>/nixos/hosts/default
## INSTALLING NIXOS
-nixos-install --flake /<route to dotfiles>/nixos/.#nixos
