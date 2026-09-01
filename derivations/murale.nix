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
  pname = "murale";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "brenton-keller";
    repo = "murale";
    rev = "27f23af17bcd93cbafc2ad8176e9f626dbe8d503";
    hash = "sha256-jW0v3brKGc4xtQfrr/a/dtxxquWKAv3vVJc/L+fb1Is=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    libxkbcommon
    mpv
  ];

  cargoHash = "sha256-hAt25aOuQTMCBqBo/Jh0ssnhZe/KJOiqMOSFrAXH0nI=";

  meta = {
    description = "Lean, memory-safe video wallpaper player for Wayland compositors";
    homepage = "https://github.com/brenton-keller/murale";
    license = [ lib.licenses.mit ];
    maintainers = [ ];
  };
})

