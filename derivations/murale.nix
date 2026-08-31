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
    rev = "f7e57869b0748202882e8c4390334eb544254193";
    hash = "sha256-V5ZpsDgHLDy2wk9N9eRdoNkOUnXVBkPONmi/7jKKyYo=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    libxkbcommon
    mpv
  ];

  cargoHash = "sha256-i5DMAUfgDnrQSPNwTwToseNHu0iFHObvaZ6Fn++fTS4=";

  meta = {
    description = "Lean, memory-safe video wallpaper player for Wayland compositors";
    homepage = "https://github.com/brenton-keller/murale";
    license = [ lib.licenses.mit ];
    maintainers = [ ];
  };
})

