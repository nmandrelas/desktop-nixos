{ stdenv, pkgs, fetchFromGithub }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "v2.5";
    sha256 = "";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -aR $src/* $out/
  '';
  };
}
