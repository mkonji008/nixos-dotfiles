# overlays/default.nix

final: prev: {
} // (import ./theming/graphite.nix final prev)
