final: prev: {
  graphite-gtk-theme = final.stdenv.mkDerivation rec {
    pname = "Graphite-Light-Rimless";
    version = prev.graphite-gtk-theme.version;

    src = prev.graphite-gtk-theme.src;

    installPhase = ''
      ./install.sh -c light --tweaks rimless --dest $out/share/themes
    '';
  };
}
