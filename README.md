# My Hyprland Rice

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/b7d7b268-10de-48eb-9ef5-50f26e9823fc" />

*CLIs used in this image: [pipesX.sh](https://github.com/pipeseroni/pipesX.sh), [clock-tui](https://github.com/race604/clock-tui), [fastfetch](https://github.com/fastfetch-cli/fastfetch) and [cmatrix](https://github.com/abishekvashok/cmatrix)*

> [!WARNING]
> Make sure that you have Hyprland and ML4W installed before you install these dotfiles
>
> To install: DO NOT paste [~`/com.ml4w.dotfiles.stable`](https://github.com/InternetBowser670/my-hyprland-rice/tree/main/com.ml4w.dotfiles.stable) into its corresponding folder. Look at the individual dotfiles and paste them into their respective folder in `~/.config`. Make sure you know what each config is for BEFORE you pate it.
>
> **In order to have the lock screen not show up as black, follow the installation instructions [here](https://github.com/InternetBowser670/wallpaper/tree/main) to put the required wallpaper (liquid2.jpg, though i would just clone the repo) into `~/Pictures/wallpaper`. If you really, *really* want the two anime wallpapers that came with this set, you can download them [here](https://github.com/mylinuxforwork/wallpaper) instead of from my repo.**

Want to shuffle the wallpaper?

1. Make sure you have the scripts `change_wallpaper_once.sh` and `shuffle_wallpaper.sh` from `https://github.com/InternetBowser670/my-hyprland-rice/tree/main/com.ml4w.dotfiles.stable/.config/hypr` in `~/.config/hypr` on your system
2. Run `mkdir -p ~/.local/bin && \
(echo $PATH | grep -q "$HOME/.local/bin" || (echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc && source ~/.zshrc)) && \
ln -sf ~/.config/hypr/change_wallpaper_once.sh ~/.local/bin/change_wallpaper_once && \
ln -sf ~/.config/hypr/shuffle_wallpaper.sh ~/.local/bin/shuffle_wallpaper && \
chmod +x ~/.config/hypr/change_wallpaper_once.sh ~/.config/hypr/shuffle_wallpaper.sh
`
3. Run `shuffle_wallpaper &`. The wallpaper will shuffle every 10 minutes.
4. Run `change_wallpaper_once` if you don't like the wallpaper that you have. You can only run it after the previous command has been run in the session.
