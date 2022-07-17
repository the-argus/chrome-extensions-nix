# this file is not a module, its a function that returns the set of all
# packages
{ pkgs, ... }:
let
  # this is the important stuff, copied from 
  # https://github.com/pimeys/nixos/blob/9c4306ceac36b7f69fd2ea5e2345200d7336be20/home.nix
  lib = pkgs.lib;
  createChromiumExtensionFor = browserVersion:
    { id, sha256, version }: {
      inherit id;
      crxPath = builtins.fetchurl {
        url =
          "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
        name = "${id}.crx";
        inherit sha256;
      };
      inherit version;
    };
  createChromiumExtension = createChromiumExtensionFor
    (lib.versions.major pkgs.ungoogled-chromium.version);
in
{
  ublock-origin = (createChromiumExtension {
    # ublock origin
    id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
    sha256 =
      "sha256:0izlm20b0bpjr98rw63c42zb04ky1mclg0da2xmj0kw3qichnpvg";
    version = "1.38.6";
  });
}
