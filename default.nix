  let
    pkgs = import <nixpkgs> {};
  in
  { stdenv ? pkgs.stdenv, python ? pkgs.python3, flask ? pkgs.python34Packages.flask, emacs ? pkgs.emacs , psycopg2 ? pkgs.python34Packages.psycopg2,
    gunicorn ? pkgs.python34Packages.gunicorn
 }:
  
  stdenv.mkDerivation {
    name = "trackmylifts";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [ python flask emacs];
  }
