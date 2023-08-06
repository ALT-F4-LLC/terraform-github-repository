{
  description = "terraform-github-repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          terraform-with-plugins = pkgs.terraform.withPlugins (ps: with ps; [
            github
          ]);

          default = pkgs.runCommand "default"
            {
              src = ./.;
            } ''
            mkdir -p $out
            cp -R $src/*.tf $out

            ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" init
            ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" validate
          '';
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              terraform
              terraform-docs
            ];
          };
        };
      };
    };
}
