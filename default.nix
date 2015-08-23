  let
    pkgs = import <nixpkgs> {};
    
  flask_sqlalchemy = pkgs.python34Packages.buildPythonPackage rec {
    name = "Flask-SQLAlchemy-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/F/Flask-SQLAlchemy/${name}.tar.gz";
      md5 = "dca034849ffcbaef7b848e8728d3668f";
    };

    buildInputs = with pkgs; [ python34Packages.flask python34Packages.sqlalchemy_1_0 ];
  };
  in
  { stdenv ? pkgs.stdenv, python ? pkgs.python3,
  flask ? pkgs.python34Packages.flask,
  emacs ? pkgs.emacs,
  psycopg2 ? pkgs.python34Packages.psycopg2,
   gunicorn ? pkgs.python34Packages.gunicorn,
   sqlalchemy ? pkgs.python34Packages.sqlalchemy_1_0
  }:

  stdenv.mkDerivation {
    name = "trackmylifts";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [ python flask emacs gunicorn sqlalchemy flask_sqlalchemy];
    APP_SETTINGS="config.DevelopmentConfig";
  }
