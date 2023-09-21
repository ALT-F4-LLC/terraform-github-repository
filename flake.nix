{
  description = "terraform-github-repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          terraform-github = pkgs.terraform-providers.mkProvider {
            homepage = "https://registry.terraform.io/providers/integrations/github";
            owner = "integrations";
            repo = "terraform-provider-github";
            rev = "v5.37.0";
            hash = "sha256-E53MbDM9ufQD0AnlIkdmNRcAlkGj+IACTwMPDUyNkqQ=";
            vendorHash = null;
          };
        in
        {
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
              buildInputs = with pkgs; [
                terraform
                terraform-docs
              ];
            };
          };
        };
    };
}
