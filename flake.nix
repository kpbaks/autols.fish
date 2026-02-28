{
  description = "autols.fish";

  inputs = {
    # keep-sorted start block=yes
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:cachix/git-hooks.nix";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
    # keep-sorted end
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks-nix.flakeModule
        inputs.treefmt-nix.flakeModule
      ];
      systems = [
        # keep-sorted start
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
        # keep-sorted end
      ];
      perSystem =
        {
          config,
          pkgs,
          lib,
          ...
        }:
        {
          pre-commit.settings = {
            package = pkgs.prek;
            hooks = {
              # keep-sorted start block=yes
              check-symlinks.enable = true;
              deadnix.enable = true;
              statix.enable = true;
              treefmt.enable = true;
              # keep-sorted end
            };
          };

          treefmt.programs = {
            # keep-sorted start block=yes
            fish_indent.enable = true;
            flake-edit.enable = true;
            keep-sorted.enable = true;
            nixfmt.enable = true;
            rumdl-check.enable = true;
            rumdl-format.enable = true;
            taplo.enable = true;
            typos.enable = true;
            # keep-sorted end
          };

          devShells.default = pkgs.mkShell {
            inherit (config.pre-commit) shellHook;

            packages = config.pre-commit.settings.enabledPackages ++ [
              pkgs.fish
            ];
          };

          packages.default = pkgs.fishPlugins.buildFishPlugin {
            pname = "autols.fish";
            version = "unknown";

            src = lib.cleanSource ./.;

            meta = {
              description = "autols.fish";
              homepage = "https://github.com/kpbaks/autols.fish";
              license = lib.licenses.mit;
              maintainers = with lib.maintainers; [ kpbaks ];
            };
          };
        };
      flake.overlays.default = final: prev: {
        fishPlugins = prev.fishPlugins // {
          autols-fish = self.packages.${final.stdenv.hostPlatform.system}.default;
        };
      };
    };
}
