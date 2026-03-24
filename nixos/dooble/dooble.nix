# dooble.nix
{
  stdenv,
  lib,
  kdePackages,
  libgcc, 
  gnumake,
  fetchzip
}:

stdenv.mkDerivation {
  name = "dooble";

  src = fetchzip {
    url = "https://github.com/textbrowser/dooble/archive/refs/tags/2026.03.09.tar.gz";
    hash = "sha256-+5KwnYbW3ifv/I9bi0wfU+Lf9Bkvf24zSj/VHDVPRiI=
";
  };
  buildInputs = [libgcc gnumake];
  
  nativeBuildInputs = with kdePackages; 
    [ 
      qmake
      qtbase
      qtcharts
      qtwebengine
      wrapQtAppsHook
    ];

  buildPhase ="";
  
  installPhase = ''
  qmake -o Makefile dooble.pro
  make -jk 4
  chmod +x ./dooble
  echo "DONE!"
  '';


}
