{
  description = "terraform-github-repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          inherit (pkgs) just terraform terraform-docs;
          terraform-github = pkgs.terraform-providers.mkProvider {
            homepage = "https://registry.terraform.io/providers/integrations/github";
            owner = "integrations";
            repo = "terraform-provider-github";
            rev = "v5.41.0";
            hash = "sha256-fWxWcHy3TWFEpkU9uDSsHbUu+dnQKfvquN63eZH+Qf0=";
            vendorHash = null;
          };
        in
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          packages = {
            terraform-with-plugins = pkgs.terraform.withPlugins (ps: [
              terraform-github
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
              buildInputs = [
                just
                terraform
                terraform-docs
              ];
            };
          };
        };
    };
}
