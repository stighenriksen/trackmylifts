  let
    pkgs = import <nixpkgs> {};
    
  flask_sqlalchemy = pkgs.python34Packages.buildPythonPackage rec {
    name = "Flask-SQLAlchemy-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/F/Flask-SQLAlchemy/${name}.tar.gz";
      md5 = "dca034849ffcbaef7b848e8728d3668f";
    };
        buildInputs = with pkgs; [ pkgs.which python34Packages.flask python34Packages.sqlalchemy_1_0 ];
    };


   flask_script = pkgs.python34Packages.buildPythonPackage rec {
    name = "Flask-Script-2.0.5";
    src = pkgs.fetchurl {
        url = "https://pypi.python.org/packages/source/F/Flask-Script/${name}.tar.gz";
        md5 = "e5c73d3b7937f5b88942f342f9617029";
    };
      buildInputs = with pkgs; [ python34Packages.flask python34Packages.sqlalchemy_1_0 python34Packages.pytest  ];
    };

  in
  { stdenv ? pkgs.stdenv, python ? pkgs.python3,
  flask ? pkgs.python34Packages.flask,
  emacs ? pkgs.emacs,
  psycopg2 ? pkgs.python34Packages.psycopg2,
   gunicorn ? pkgs.python34Packages.gunicorn,
   sqlalchemy ? pkgs.python34Packages.sqlalchemy_1_0,
   postgresql ? pkgs.postgresql,
   zsh ? pkgs.zsh
  }:

  stdenv.mkDerivation {
    name = "trackmylifts";
    version = "0.1.0.0";
    src = ./.;
    buildInputs = [ python flask emacs gunicorn sqlalchemy flask_sqlalchemy psycopg2 postgresql zsh];
    APP_SETTINGS="config.DevelopmentConfig";
    DATABASE_URL="postgresql://localhost/trackmylifts";
  }
