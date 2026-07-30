{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  wayland,
  libxkbcommon,
  mpv,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ripgrep";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "brenton-keller";
    repo = "murale";
    rev = "8461aace00fbda96fbf3e988b314e9dbef1e1a4d";
    hash = "sha256-UUHIboFU4aES1zQ2RwuG4dIFSiVpyhy3+WVgbbCEteo=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    libxkbcommon
    mpv
  ];

  cargoHash = "sha256-+jlkV+umcbHpPYbwdx0qrzuMkxA7RkSQ2BoYy0xEkck=";

  meta = {
    description = "Lean, memory-safe video wallpaper player for Wayland compositors";
    homepage = "https://github.com/brenton-keller/murale";
    license = [ lib.licenses.mit ];
    maintainers = [ ];
  };
})

