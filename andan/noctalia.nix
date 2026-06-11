{ pkgs, inputs, ... }:
{
  home-manager.users.apia = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = {
      enable = true;
    };
  };
}