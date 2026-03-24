# dooble.nix
{
  stdenv,
  qmake,
  make,
  fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "dooble";
  version = "2026.03.09";

  src = fetchFromGitHub {
    owner = "textbrowser";
    repo = "dooble";
    rev = "f336128c163c081ab011d00607848edb39320814";
    sha256 = "sha256-UCqUuhcLY/VbdSpbTCC/IvplEJaWzej/Zx0dBBVslEk=
";
  };
  
  buildInputs = [ qmake make ];

  installphase = ''
  mkdir -p $out/bin
  qmake -o Makefile dooble.pro
  make
  cp ./dooble $out/bin
  '';
}
