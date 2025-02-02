{ stdenv, pkgs, fetchFromGithub }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "2.5";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "sha256-w/ZRxWxuU/ECq3ntkXek5BgJiBcUCBOjrvNBc4U94V4=";
    sha256 = "";
  };

  installPhase = ''
    # Fetch the whole repo and put it in $out
    mkdir $out
    cp -aR $src/* $out/
  '';
  };
}
