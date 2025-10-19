{
  description = "Personal NixOS";

    inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.05";
        home-manager = {
          url =  "github:nix-community/home-manager/release-25.05";
          inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
      let
        system = "x86_64-linux";
      in
      { 
      
      nixosConfigurations= {
        desktop = nixpkgs.lib.nixosSystem { 
          specialArgs = {inherit inputs;};
	  modules = [
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
          {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.v014 = import ./home.nix;
            backupFileExtension = "backup";
            };
          }
        ];
      };
	devm = nixpkgs.lib.nixosSystem { 
          specialArgs = {inherit inputs;};
	  modules = [
            ./hosts/devm/configuration.nix
            home-manager.nixosModules.home-manager
          {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.v014 = import ./hosts/devm/home.nix;
            backupFileExtension = "backup";
            };
          }
        ];
      };
	laptop = nixpkgs.lib.nixosSystem { 
          specialArgs = {inherit inputs;};
	  modules = [
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
          {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.v014 = import ./home.nix;
            backupFileExtension = "backup";
            };
          }
        ];
      };
    };
  };
}
         
            

