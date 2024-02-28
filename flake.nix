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
        terraform = pkgs.terraform.withPlugins (p: [
          (pkgs.terraform-providers.mkProvider {
            hash = "sha256-y8DMpNSySMbe7E+sGVQcQdEyulq4Wnp5ryYD7FQO/fc=";
            homepage = "https://registry.terraform.io/providers/integrations/github";
            owner = "integrations";
            repo = "terraform-provider-github";
            rev = "v6.0.0";
            vendorHash = null;
          })
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

              ${terraform}/bin/terraform -chdir="$out" init
              ${terraform}/bin/terraform -chdir="$out" validate
            '';
        };
      };
    };
}
