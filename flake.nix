{
  description = ''Domain Name System (DNS) protocol for Nim programming language'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."dnsprotocol-main".dir   = "main";
  inputs."dnsprotocol-main".owner = "nim-nix-pkgs";
  inputs."dnsprotocol-main".ref   = "master";
  inputs."dnsprotocol-main".repo  = "dnsprotocol";
  inputs."dnsprotocol-main".type  = "github";
  inputs."dnsprotocol-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."dnsprotocol-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}