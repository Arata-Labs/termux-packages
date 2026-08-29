TERMUX_PKG_HOMEPAGE=https://github.com/Arata-Labs/AuraStudio
TERMUX_PKG_DESCRIPTION="AuraStudio CLI — Android development tool suite for Termux"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Arata Labs <github.com/Arata-Labs>"
TERMUX_PKG_VERSION=1.5
TERMUX_PKG_SRCURL=https://github.com/Arata-Labs/AuraStudio/archive/refs/tags/v1.5.tar.gz
TERMUX_PKG_SHA256=b09226a390e938b1c55a7b984d6a95a971a432b2b04727af8f5b0075e25377b7
TERMUX_PKG_DEPENDS="bash, curl, git, unzip, tar, findutils, sed, grep, gawk, which"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=false

termux_step_make_install() {
  mkdir -p "$TERMUX_PREFIX/opt/aurastudio"
  mkdir -p "$TERMUX_PREFIX/bin"
  mkdir -p "$TERMUX_PREFIX/share/bash-completion/completions"

  cp -r aurastudio config lib modules "$TERMUX_PREFIX/opt/aurastudio/"
  chmod +x "$TERMUX_PREFIX/opt/aurastudio/aurastudio"

  ln -sf "$TERMUX_PREFIX/opt/aurastudio/aurastudio" "$TERMUX_PREFIX/bin/aurastudio"

  if [ -f lib/aurastudio-completion.bash ]; then
    cp lib/aurastudio-completion.bash "$TERMUX_PREFIX/share/bash-completion/completions/aurastudio"
  fi
}
