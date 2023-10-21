# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="BBC iPlayer downloader"
HOMEPAGE="http://www.infradead.org/get_iplayer/html/get_iplayer.html"
SRC_URI="https://github.com/get-iplayer/get_iplayer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="web-pvr"

RDEPEND=">=dev-lang/perl-5.10.1
    dev-perl/LWP-Protocol-https
    dev-perl/Mojolicious
    dev-perl/XML-LibXML
    media-video/atomicparsley
    media-video/ffmpeg
    web-pvr? ( dev-perl/CGI )"
DEPEND="${RDEPEND}"

src_install() {
    dobin get_iplayer
    if use web-pvr; then
        dobin get_iplayer.cgi
    fi

    dodoc *.md CONTRIBUTORS *.txt
    doman get_iplayer.1
}
