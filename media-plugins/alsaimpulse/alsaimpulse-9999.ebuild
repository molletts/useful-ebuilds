# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 multilib-minimal

DESCRIPTION="A convolver for ALSA"
HOMEPAGE="https://github.com/Artefact2/alsaimpulse"
EGIT_MIN_CLONE_TYPE="single"
EGIT_REPO_URI="https://github.com/Artefact2/alsaimpulse.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="clang"

DEPEND="sci-libs/fftw:3.0[${MULTILIB_USEDEP}]
    media-libs/alsa-lib[${MULTILIB_USEDEP}]
    clang? ( sys-devel/clang )"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
    "${FILESDIR}"/${PN}-Makefile-fixes.patch
)

src_prepare() {
    default
    multilib_copy_sources
}

multilib_src_compile() {
    if use clang ; then
        CC=clang
    else
        CC=gcc
    fi

    emake CC=${CC}
}

multilib_src_install() {
    insinto /usr/$(get_libdir)/alsa-lib
    doins *.so
}

multilib_src_install_all() {
    dodoc README.md
}
