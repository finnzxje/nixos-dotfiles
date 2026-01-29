{
  description = "NixOS flake of finnzxje";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        shoukei =
          let
            username = "finnzxje";
            specialArgs = { inherit username inputs; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = [
              ./hosts/shoukei
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.${username} = import ./home;
                  backupFileExtension = "backup";
                  extraSpecialArgs = inputs // specialArgs;
                };
              }
            ];
          };
      };
    };

}
