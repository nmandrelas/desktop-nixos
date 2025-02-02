{ stdenv, pkgs, fetchFromGithub }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "2.5";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "6f25b2739684389ca69ea8229386c098c566c408";
    sha256 = "";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -aR $src/* $out/
  '';
  };
}
