# Guide for Arch Linux on Samsung Galaxy Book3 Pro 360

## Introduction
This guide is designed to assist users in setting up Arch Linux on the Samsung Galaxy Book3 Pro 360. It draws inspiration from an existing guide for the Galaxy Book2 Pro ([source](https://github.com/joshuagrisham/galaxy-book2-pro-linux)). However, due to significant firmware differences between models and the unique characteristics of the 360 model, many of the fixes from the original guide required additional workarounds or adaptations. Therefore, this guide aims to provide tailored solutions for the specific challenges encountered with the Samsung Galaxy Book3 Pro 360 model.

### Notable Differences and Adaptations
- **Firmware Variations**: The Samsung Galaxy Book3 Pro 360 has different firmware compared to the regular model, necessitating distinct approaches.
- **Model-Specific Challenges**: The 360 model's unique features require specific attention, especially regarding hardware compatibility and functionality under Arch Linux.

### Hyprdots Configuration
In this setup, I have utilized Hyprdots for optimizing system configuration. This includes:
- Custom scripts for dynamic hardware detection.
- Enhanced settings for performance and usability.
- Integration with Hyprland and other related tools to ensure a seamless user experience.

## Package List and Descriptions

### Kernel Headers
- `linux-headers`: Main kernel headers (auto detected from `/usr/lib/modules/`).
- `linux-zen-headers`: Zen kernel headers (auto detected from `/usr/lib/modules/`).
- `linux-lts-headers`: LTS kernel headers (auto detected from `/usr/lib/modules/`).

### NVIDIA Drivers
- `nvidia-dkms`: NVIDIA drivers (auto detected from `lspci -k | grep -A 2 -E "(VGA|3D)"`).
- `nvidia-utils`: NVIDIA utilities (auto detected from `lspci -k | grep -A 2 -E "(VGA|3D)"`).

### Pipewire (Audio and Video)
- `pipewire`: Audio and video server.
- `pipewire-alsa`: For audio.
- `pipewire-audio`: For audio.
- `pipewire-jack`: For audio.
- `pipewire-pulse`: For audio.
- `gst-plugin-pipewire`: For audio.
- `wireplumber`: Audio and video session manager.

### Networking
- `networkmanager`: Network manager.
- `network-manager-applet`: Network manager tray.

### Bluetooth
- `bluez`: For Bluetooth.
- `bluez-utils`: Bluetooth utilities.
- `blueman`: Bluetooth tray.

### Display Manager (Login)
- `sddm-git`: Display manager for login.
- `qt5-wayland`: For QT Wayland XDP.
- `qt6-wayland`: For QT Wayland XDP.
- `qt5-quickcontrols`: For SDDM theme.
- `qt5-quickcontrols2`: For SDDM theme.
- `qt5-graphicaleffects`: For SDDM theme.

### Hyprland (Window Manager)
- `hyprland-git`: Main window manager (`hyprland-nvidia-git` if NVIDIA card is detected).
- `dunst`: Graphical notification daemon.
- `rofi-lbonn-wayland-git`: App launcher.
- `waybar-hyprland-git`: Status bar.
- `swww`: Wallpaper app.
- `swaylock-effects-git`: Lockscreen.
- `wlogout`: Logout screen.
- `grimblast-git`: Screenshot tool.
- `slurp`: Selects region for screenshot/screenshare.
- `swappy`: Screenshot editor.
- `cliphist`: Clipboard manager.

### Dependencies
- `polkit-kde-agent`: Authentication agent.
- `xdg-desktop-portal-hyprland`: XDG Desktop Portal.
- `pacman-contrib`: For system update check.
- `python-pyamdgpuinfo`: For AMD GPU info.
- `parallel`: For parallel processing.
- `jq`: To read JSON.
- `imagemagick`: For image processing.
- `qt5-imageformats`: For Dolphin image thumbnails.
- `ffmpegthumbs`: For Dolphin video thumbnails.
- `kde-cli-tools`: For Dolphin open with option.
- `brightnessctl`: Brightness control for laptops.
- `pavucontrol`: Audio settings GUI.
- `pamixer`: For Waybar audio.

### Theme
- `nwg-look`: Theming GTK apps.
- `kvantum`: Theming QT apps.
- `qt5ct`: Theming QT5 apps.

### Applications
- `firefox`: Browser.
- `kitty`: Terminal.
- `neofetch`: Fetch tool.
- `dolphin`: KDE file manager.
- `visual-studio-code-bin`: GUI code editor.
- `vim`: Text editor.
- `ark`: KDE file archiver.

### Shell
- `zsh`: Main shell.
- `eza`: Colorful file lister.
- `oh-my-zsh-git`: For Zsh plugins.
- `zsh-theme-powerlevel10k-git`: Theme for Zsh.

# Installation of Fixes for Galaxy Book3 Pro 360 on Arch Linux

This guide provides steps to set up various fixes for your Samsung Galaxy Book3 Pro 360 running Arch Linux, including an automatic screen rotation feature and audio fixes.

### Prerequisites

Before proceeding with the installation, ensure you have `git` installed to clone the repository. If not, you can install it using:

```bash
sudo pacman -S git
```

## Audio Fix

Out-of-the-box, the audio might not work properly on some Samsung Galaxy laptops. Follow these steps to apply the audio fix:

### Steps to Install Audio Fix

1. **Clone the repository**:
   ```bash
   git clone https://github.com/TahlonBrahic/Galaxy-Book3-Pro-360-Arch-Linux.git
   ```

2. **Change directories**:
   ```bash
   cd Galaxy-Book3-Pro-360-Arch-Linux/audio
   ```

3. **Make the installation script executable and run it**
   ```bash
   chmod +x install-audio.sh
   ./audio-fix-service-installer.sh
   ```
   
## Screen Rotation Fix

To enable automatic screen rotation on your Galaxy Book3 Pro 360, you can install a script that manages this functionality.

### Steps to Install Screen Rotation Fix

1. **Navigate to the Screen Rotation Script Directory:**
   ```bash
   cd ..
   cd screen-rotation
   ```

2. **Make the Installation Script Executable and Run It:**
   ```bash
   chmod +x install-rotation.sh
   ./auto-rotate-service-installer.sh
   ```

## Resources

Below are some valuable resources that can assist in troubleshooting and enhancing the setup for Galaxy Book3 Pro 360 on Arch Linux:

- [Galaxy Book Pro 360 Issues with Linux (Reddit Discussion)](https://www.reddit.com/r/linuxquestions/comments/p4zz2u/galaxy_book_pro_360_issues_with_linux/)
- [Issues with Linux on the Samsung Book Pro 360 (Samsung Community Discussion)](https://eu.community.samsung.com/t5/computers-it/issues-with-linux-on-the-samsung-book-pro-360/m-p/4243492#M4184)
- [Galaxy Book2 Pro Linux GitHub Repository](https://github.com/joshuagrisham/galaxy-book2-pro-linux) - Inspiration for this project.
