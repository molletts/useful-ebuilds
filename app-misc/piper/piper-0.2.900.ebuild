# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson eutils

DESCRIPTION="Configuration GUI for gaming mice supported by libratbag"
HOMEPAGE="https://github.com/libratbag/piper"
SRC_URI="https://github.com/libratbag/piper/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="x11-libs/gtk+:3
    dev-libs/libratbag
    dev-python/pygobject:3"
DEPEND="${RDEPEND}"

PATCHES=(
    # Fix python3 not found by meson
    "${FILESDIR}/${P}-meson-find-python.patch"
)

