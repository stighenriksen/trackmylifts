  let
    pkgs = import <nixpkgs> {};
  in
  { stdenv ? pkgs.stdenv, python ? pkgs.python3, flask ? pkgs.python34Packages.flask }:
  
  stdenv.mkDerivation {
    name = "trackmylifts";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [ python flask ];
  }
