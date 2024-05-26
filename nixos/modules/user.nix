{ pkgs, ... }: {
  users.users.dudos = {
    isNormalUser = true;
    description = "dudos";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
