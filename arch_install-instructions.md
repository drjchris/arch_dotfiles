# Notes for Installing Arch Linux with Qtile

## Connect to wi-fi

```sh
iwctl
```


for entering into the network 



That will lead to a `[iwd]` prompt. That’s where you enter the command to list and find the name of the wifi



```sh
[iwd]# device list
```


With the name (wlan0) it is then possible to connect.


```
[iwd]# station wlan0 connect [wifi name]
```

You need to do a scan if it doesn’t want to connect or says invalid network name

```
[iwd]# station wlan0 scan
```

you will then be asked for a password, and if it’s all good there will be no prompt at all.

Quit to go back to the terminal.

To check it’s all connected:

```
ping -c 5 google.com
```

## Format disk

First update package manager.

```
pacman -Sy
```

Find out the name of the drive your will delete.

```
lsblk
```

You are after the root name. In my case its `nvme0n1`.

Now this will NUKE the drive!

```
gdisk /dev/nvme0n1
```

Then press `x` to go to expert mode, then `z` to delete everything. Then Yes and Yes to the next two prompts. 


## Actual installation

```
archinstall
```



Follow the instructions and make your own choices.
The rest of the instructions assume qtile has been chosen.



### Additional Packages to install

```
zsh
neovim
gcc
nodejs
git
npm
alacritty
unzip
rofi
autopep8
xorg-xmodmap
noto-fonts
xclip 
```

Additional X11 suff if needed


```sh
sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font
```

## System Settings

remapping the capslock and swapping `Crt_L` with `Alt_L` for `.Xmodmap`.


```
keycode 66 = Escape
clear lock
clear control
clear mod1
keycode 37 = Alt_L Meta_L
keycode 64 = Control_L
add control = Control_L Control_R
add mod1 = Alt_L Meta_L
```

Sort out trackpad scrolling and everything else


```
sudo nvim /usr/share/X11/xorg.conf.d/40-libinput.conf
```

Then add the following lines to touchpad catchall

```
Option “NaturalScrolling” “on”
Option “Tapping” “on”
Option “ClickMethod” “clickfinger”
```

## Install Nerdfonts


Download `blexfonts.zip` to Downloads directory.

Create a font file in `.local` directory.

```
mkdir -p ~/.local/share/fonts/blex
```

Then move the zip file


```
mv ~/Download/blexfonts.zip ~/.local/share/fonts/blex
cd ~/.local/share/fonts/blex/
unzip blexfonts.zip
```

Now refresh the font cache

```
fc-cache -fv
```

## Sort out backlight


Create the file `/etc/udev/rules.d/backlight.rules` and then add the following line.

```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp jose $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```

Now install the `xbacklight` tool

```
sudo pacman -S acpilight
```

Then reboot.

Check if you can do this.

```
xbacklight -set 10
```

