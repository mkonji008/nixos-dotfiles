{
  description = "Personal NixOS";

    inputs = {
      nixpkgs.url = "nixpkgs/nixos-25.05";
        home-manager = {
          url =  "github:nix-community/home-manager/release-25.05";
          inputs.nixpkgs.follows = "nixpkgs";
      };

      zen-browser.url = "github:0xc000022070/zen-browser-flake";
    
    };

    outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs:
      let
        system = "x86_64-linux";
	overlays = [ (import ./overlays/default.nix) ];
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
            nixpkgs.overlays = overlays;
            
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
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
         
            

