# Dotfiles

- [Dotfiles](#dotfiles)
  * [Mac OSX](#mac-osx)
    + [Requirements:](#requirements)
        * [Clone this repo:](#clone-this-repo)
        * [Run included script file:](#run-included-script-file)
    + [NTFS Compatibility](#ntfs-compatibility)
  * [Arch Linux](#arch-linux)
    + [Installation:](#installation)
      - [Connect to the internet and check the system clock:](#connect-to-the-internet-and-check-the-system-clock)
      - [Partition the drive(s):](#partition-the-drives)
      - [Installing base packages and confuguring language and time zone:](#installing-base-packages-and-confuguring-language-and-time-zone)
      - [Installation of bootloader](#installation-of-bootloader)
      - [Create a new user and setup sudoers file:](#create-a-new-user-and-setup-sudoers-file)
    + [Setup:](#setup)
      - [Requirements:](#requirements-1)
      - [Step 1, Install packages, dotfiles and scripts](#step-1-install-packages-dotfiles-and-scripts)
        * [Clone this repo:](#clone-this-repo-1)
        * [Run included script file and change to ssh:](#run-included-script-file-and-change-to-ssh)
      - [Step 2, Install yaourt](#step-2-install-yaourt)
      - [Step 3, Install i3blocks](#step-3-install-i3blocks)
      - [Step 4, Install font rendering and System San Francisco font:](#step-4-install-font-rendering-and-system-san-francisco-font)
        * [Infinality for better font rendering:](#infinality-for-better-font-rendering)
        * [System San Francisco font:](#system-san-francisco-font)
      - [Step 5, Install graphics drivers (Nvidia):](#step-5-install-graphics-drivers-nvidia)
      - [Step 5 (X220), Install graphics drivers (intel):](#step-5-x220-install-graphics-drivers-intel)
      - [Notes for X220](#notes-for-x220)

## Mac OSX

### Requirements:
<ul>
    <li>iTerm2 with font: Meslo LG M DZ Regular for Powerline 12pt for both Regular Font and Non-ASCII font (included in this repo)</li>
    <li>Git</li>
    <li>Xcode (For MacVim)</li>
</ul>

##### Clone this repo:
    $ git clone https://github.com/anddani/dotfiles.git ~/.dotfiles

##### Run included script file:
    $ chmod u+x ~/.dotfiles/install_dotfiles
    $ ~/.dotfiles/install_dotfiles

### NTFS Compatibility
This requires that csrutil is disabled. Disable it in recovery mode (cmd-r on startup):

    $ csrutil disable
https://gist.github.com/mrpatiwi/8bca2f20b140150f1cbd

## Arch Linux

### Installation:

Most of this information is based on the [Arch Beginners' Guide](https://wiki.archlinux.org/index.php/beginners'_guide).

#### Connect to the internet and check the system clock:

Start the dhcpcd daemon using systemctl:

    # systemctl start dhcpcd.service

Check if you have internet access:

    # ping -c 3 google.com

Check that EFI variables are loaded and that `/sys/firmware/efi` exists:

    # efivar -l

Check the system clock with:

    # timedatectl set-ntp true
    # timedatectl status

#### Partition the drive(s):

List out the devices using:

    # lsblk

Note the device name given by the output by `lsblk`. Partition the chosen disk using the `gdisk` tool (X is the letter corresponding the the chosen device):

    # gdisk /dev/sdX

Delete all the partitions currently on the drive.

WITHOUT SWAP:

| Type      | Diskname  | Size  | Filesystem |
| --------- | --------- | ----- | ---------- |
| /boot     | /dev/sdX1 | 512M  | EFI (EF00) |
| /         | /dev/sdX2 | 50G   | ext4       |
| /home     | /dev/sdX3 | REST  | ext4       |

WITH SWAP:

| Type      | Diskname  | Size  | Filesystem |
| --------- | --------- | ----- | ---------- |
| /boot     | /dev/sdX1 | 512M  | EFI (EF00) |
| swap      | /dev/sdX2 | 16G   | swap(8200) |
| /         | /dev/sdX3 | 30G   | ext4       |
| /home     | /dev/sdX4 | REST  | ext4       |

WITHOUT SWAP:
Write the changes and format to ext4:

    # mkfs.fat -F32 /dev/sdX1
    # mkfs.ext4 /dev/sdX2
    # mkfs.ext4 /dev/sdX3

Mount the partitions:

    # mount /dev/sdX2 /mnt
    # mkdir /mnt/boot /mnt/home
    # mount /dev/sdX1 /mnt/boot
    # mount /dev/sdX3 /mnt/home

WITH SWAP:
Write the changes and format to ext4:

    # mkfs.fat -F32 /dev/sdX1
    # mkswap /dev/sdX2
    # swapon /dev/sdX2
    # mkfs.ext4 /dev/sdX3
    # mkfs.ext4 /dev/sdX4

Mount the partitions:

    # mount /dev/sdX3 /mnt
    # mkdir /mnt/boot /mnt/home
    # mount /dev/sdX1 /mnt/boot
    # mount /dev/sdX4 /mnt/home


#### Installing base packages and confuguring language and time zone:

Install base packages (choose to install all packages):
    
    # pacstrap -i /mnt base base-devel

Create a file system table:
    
    # genfstab -U -p /mnt >> /mnt/etc/fstab

Change root to the mounted root:

    # arch-chroot /mnt /bin/bash

Edit `/etc/locale.gen` and un-comment `en_US.UTF-8` and `en_US ISO-8859-1` and run:

    # locale-gen
    # echo "LANG=en_US.UTF-8" > /etc/locale.conf

Set local time zone:
    
    # ln -s /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
    # hwclock --systohc --utc

Set a hostname for the computer:
    
    # echo <HOSTNAME> > /etc/hostname

Append the hostname to the localhost entries in `/etc/hosts` as well.

To make the dhcpcd daemon run at boot:

    # systemctl enable dhcpcd@<INTERFACE-ID>.service

Change the root password with:

    # passwd

#### Installation of bootloader

Check that efivarfs is mounted:

    # mount -t efivarfs efivarfs /sys/firmware/efi/efivars

Install `systemd-boot` bootloader using the following command:

    # bootctl --path=/boot install

Install `intel-ucode` for intel processors:

    # pacman -S intel-ucode

Check that EFI, initramfs, loader and vmlinuz is located in `/boot`

Edit `/boot/loader/entries/arch.conf` and enter the following text:

```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=/dev/sdX2 rw
```

For laptop (with root at /dev/sdX3), set the `options` parameters to (for power saving):

```
options root=/dev/sdX3 rw quiet pcie_aspm=force i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1 acpi_backlight=intel_backlight
```

Exit arch-chroot, unmount the disks and reboot the system:

    # exit
    # umount -R /mnt
    # reboot

#### Create a new user and setup sudoers file:

Refresh mirrors and install zsh, git and sudo:

    # pacman -Syy
    # pacman -S zsh git sudo

Create a new user and give it a password with:

    # useradd -m -G wheel -s $(which zsh) <USERNAME>
    # passwd <USERNAME>

Give group wheel access to run sudo command:

    # visudo

Un-comment the `%wheel ALL=(ALL) ALL` line.

### Setup:

#### Requirements:

<ul>
    <li>zsh</li>
    <li>git</li>
    <li>sudo (add user in sudoer) </li>
</ul>

#### Step 1, Install packages, dotfiles and scripts

##### Clone this repo:

    $ git clone https://github.com/anddani/dotfiles.git ~/.dotfiles

##### Run included script file and change to ssh:

    $ chmod u+x ~/.dotfiles/arch_dotfiles
    $ ~/.dotfiles/arch_dotfiles
    $ cd ~/.dotfiles
    $ git remote set-url git@github.com:anddani/dotfiles.git

#### Step 2, Install yaourt

Add the following to `/etc/pacman.conf`:

```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

[infinality-bundle]
Server = http://bohoomil.com/repo/$arch

[infinality-bundle-multilib]
Server = http://bohoomil.com/repo/multilib/$arch
```

Sign the outdated key:

    # pacman-key -r 962DDE58
    # pacman-key --lsign-key 962DDE58


And run:

    # pacman -Syy
    # pacman -S yaourt

If the key could not be signed, do the following:

```
pacman -Syu haveged
systemctl start haveged
systemctl enable haveged

rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux
```

#### Step 3, Install i3blocks

    # yaourt -S i3blocks

#### Step 4, Install font rendering and System San Francisco font:

##### Infinality for better font rendering:

Refresh the mirrors:

    # pacman -Syy

Download Infinality:

    # pacman -S infinality-bundle infinality-bundle-multilib

##### System San Francisco font:

Download the font package from [here](https://github.com/supermarin/YosemiteSanFranciscoFont). Unzip the archive:

    $ unzip /path/to/YosemiteSanFranciscoFont-master.zip

and move the fonts to the `.fonts` folder (create a folder called ~/.fonts if it doesn't exist).

#### Step 5, Install graphics drivers (Nvidia):

    # pacman -S nvidia nvidia-libgl lib32-nvidia-libgl lib32-nvidia-utils

#### Step 5 (X220), Install graphics drivers (intel):

    # pacman -S xf86-video-intel

#### Notes for X220
Enable tlp services `tlp.service` and `tlp-sleep.service` and disable `systemd-rfkill.service`
