{ pkgs, ... }: {
  users.users.dudos = {
    isNormalUser = true;
    description = "dudos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };
}
