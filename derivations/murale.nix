{ lib, fetchFromGitHub, rustPlatform, }:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ripgrep";

  src = fetchFromGitHub {
    owner = "brenton-keller";
    repo = "murale";
    rev = "8461aace00fbda96fbf3e988b314e9dbef1e1a4d";
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;

  meta = {
    description = "Lean, memory-safe video wallpaper player for Wayland compositors";
    homepage = "https://github.com/brenton-keller/murale";
    license = [ lib.licenses.mit ];
    maintainers = [ ];
  };
})

