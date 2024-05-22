{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Nix stuff
    nix-ld
    nix-index
    home-manager
    patchelf
    alejandra
    # Text editors
    vim
    neovim
    vscode
    helix

    # Terminals and multiplexers
    kitty
    tmux

    # Desktop apps
    firefox
    wpsoffice
    chromium
    tor-browser
    spotify
    discord
    obs-studio
    lunatask
    obsidian
    pdfarranger
    gparted
    okular
    qbittorrent

    # Dev
    python3
    python311Packages.pip
    nodejs
    git
    clang
    libgcc  # Start interactive shell: nix-shell -p libgcc
    gcc
    pyright
    gnumake
    cmake
    gdb

    # Utils
    mpv
    feh
    wget
    unzip
    fd
    bat
    fzf
    wl-clipboard
    fastfetch
    pfetch
    lazygit
    ranger
    nmap
    openvpn
    ripgrep
    gnupg
    tree
    tor
    unzip
    ffmpeg
    ranger
    zip
    yt-dlp
    btop
    htop
    starship

    # Docker
    docker
    docker-compose
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
  ];
}
