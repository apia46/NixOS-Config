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
    rev = "30445b4816b84bc4ff93b577537b01376117ce10";
    hash = "sha256-1Ibjbx7jMVsh+Szx3O7gXDB/m+f2DfIqYafoDwlev60=";
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

