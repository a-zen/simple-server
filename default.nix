let pkgs = import <nixpkgs> {};

in pkgs.mkShell rec {
  name = "simple-server";

  buildInputs = with pkgs; [
    nodePackages.npm
    nodejs-slim-16_x
  ];
}
