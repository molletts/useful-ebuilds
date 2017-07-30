# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="System Stability Tester"
HOMEPAGE="http://systester.sourceforge.net"
SRC_URI="mirror://sourceforge/systester/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=">=dev-qt/qtgui-4.5.3:4
    >=dev-libs/gmp-4.2.1"
DEPEND="${RDEPEND}"

src_configure() {
    ./configure \
	--prefix="${EPREFIX}/usr" \
	--bindir="${EPREFIX}/usr/bin"
}

src_install() {
    emake INSTALL_ROOT="${D}" install

    dodoc Changelog FAQ.txt
}
