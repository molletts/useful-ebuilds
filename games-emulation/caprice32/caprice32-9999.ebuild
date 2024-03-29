# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 desktop

DESCRIPTION="Amstrad CPC emulator"
HOMEPAGE="https://github.com/ColinPitrat/caprice32"
EGIT_MIN_CLONE_TYPE="single"
EGIT_REPO_URI="https://github.com/ColinPitrat/caprice32.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="media-libs/libsdl2
    media-libs/freetype:2
    media-libs/libpng
    sys-libs/zlib"
DEPEND="${RDEPEND}"
# TODO: add any deps that aren't explicitly mentioned in INSTALL.md

src_compile() {
    emake prefix=/usr APP_PATH=/usr/share/caprice32 \
          ARCH=linux RELEASE=1 RELEASE_FLAGS="${CFLAGS}" cap32

    # Fix the config file to use our specified prefix
    sed -i -e "s:__SHARE_PATH__:/usr/share/caprice32:" cap32.cfg.tmpl \
    || die "Fixing paths in cap32.cfg.tmpl failed!"
}

src_install() {
    emake prefix=/usr APP_PATH=/usr/share/caprice32 \
          ARCH=linux RELEASE=1 DESTDIR="${D}" install

    dodoc COPYING.txt HISTORY.txt INSTALL.md README.md doc/man.html

    doicon "${FILESDIR}/cpc.png"
    make_desktop_entry /usr/bin/cap32 Caprice32 cpc Game
}

