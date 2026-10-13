{
  description = "Animal Crossing decompilation development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      devShells.x86_64-linux.default = (pkgs.buildFHSEnv {
        name = "ac-decomp-shell";
        targetPkgs = pkgs: [ pkgs.python3 pkgs.ninja ];
        # The downloaded tools need Linux loaders, including 32-bit support for wibo.
        multiPkgs = pkgs: [ pkgs.zlib ];
        runScript = "bash";
      }).env;
    };
}
