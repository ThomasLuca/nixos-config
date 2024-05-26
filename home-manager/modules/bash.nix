{
  programs.bash = {
    enable = true;

    shellOptions = [
      "autocd"
      "cdspell"
      "dotglob"
      "histappend"
      "expand_aliases"
    ];
    
    initExtra = ''
      if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        exec tmux
      fi

      [[ $- != *i* ]] && return

      if [ -d "$HOME/.bin" ]; then
        PATH="$HOME/.bin:$PATH"
      fi

      if [ -d "/usr/local/bin" ]; then
        PATH="/usr/local/bin:$PATH"
      fi

      if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
      fi

      eval "$(starship init bash)"
      export CDPATH=~/School/Informatica:~/School/Informatica/Sem4:~/
    '';

    shellAliases = {
      ls="ls --color=auto";
      ll="ls -l";
      la="ls -la";
      grep="grep --color=auto";
      fgrep="fgrep --color=auto";
      egrep="egrep --color=auto";
      listdir="ls -d */ > list";
      df="df -h";
      # Git
      gs="git status";
      gf="git fetch";
      gc="git clone";
      gd="git pull";
      ga="git add";
      gm="git commit -m";
      gp="git push";
      glog="git log --decorate --oneline --graph";
      gloog="git log --graph --pretty='''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'";
      grh="git reset --soft HEAD~1";
      gap="git commit --amend --no-edit";
      gblame="git blame -w -C -C -C -L";
      # Utils
      nf="fastfetch";
      c="clear";
      q="exit";
      clock="tty-clock";
      doom="~/.config/emacs/bin/doom";
      open="xdg-open";
      wireshark="xdg-su -c wireshark";
      # Flatpaks
      discord="flatpak run com.discordapp.discord";
      spotify="flatpak run com.spotify.Client";
      insomnia="flatpak run rest.insomnia.insomnia";
      intellij="flatpak run com.jetbrains.IntelliJ-IDEA-Community";
      idea="flatpak run com.jetbrains.IntelliJ-IDEA-Community";
      # microphone
      mic-playback-on="pactl load-module module-loopback latency_msec=1000";
      mic-playback-off="pactl unload-module module-loopback";
      #keyboard
      give-me-azerty-be="sudo localectl set-x11-keymap be";
      give-me-qwerty-us="sudo localectl set-x11-keymap us";
      #userlist
      userlist="cut -d: -f1 /etc/passwd | sort";
      #hardware info --short
      hw="hwinfo --short";
      #youtube download
      yta-aac="yt-dlp --extract-audio --audio-format aac ";
      yta-best="yt-dlp --extract-audio --audio-format best ";
      yta-flac="yt-dlp --extract-audio --audio-format flac ";
      yta-mp3="yt-dlp --extract-audio --audio-format mp3 ";
      ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 ";
      # Fuzzy stuff
      fcd="cd $(find * -type d | fzf)";
      h="history | fzf";
      # Nix
      nx-rebuild="sudo nixos-rebuild switch --flake ~/nix#default";
      nx-rebuild-home="home-manager switch --flake ~/nix#dudos";
      nx-update="nix flake update && sudo nixos-rebuild switch --flake ~/nix#default";
      nx-search-="nix search nixpkgs#";
      nx-store-clean="nix-store --gc";
    };
  };
}
