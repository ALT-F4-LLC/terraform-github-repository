{
  description = "terraform-github-repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        inherit (pkgs) just terraform-docs;
        terraform = pkgs.terraform.withPlugins (ps: [
          ps.github
        ]);
      in {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = [
              just
              terraform
              terraform-docs
            ];
          };
        };

        packages = {
          default =
            pkgs.runCommand "default"
            {
              src = ./.;
            } ''
              mkdir -p $out
              cp -R $src/*.tf $out

              ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" init
              ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" validate
            '';
        };
      };
    };
}
