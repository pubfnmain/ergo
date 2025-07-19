{
  description = "A minimal status bar for Wayland compositors";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "ergo";
        version = "0.0.4";

        src = self;

        nativeBuildInputs = with pkgs; [
          pkg-config
          wayland-scanner
        ];

        outputs = [ "out" ];

        makeFlags = [ "PREFIX=$(out)" ];

        buildInputs = with pkgs; [
          cairo
          pango
          wayland
          wayland-protocols
        ];
      };
    };
}

