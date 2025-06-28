# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Utilities for transferring data to and from Casio graphic calculators"
HOMEPAGE="https://cahuteproject.org/"
SRC_URI="https://ftp.cahuteproject.org/releases/cahute-0.6.tar.gz"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cli cli-experimental libusb sdl"
REQUIRED_USE="cli-experimental? ( cli )"

DEPEND="
    libusb? ( dev-libs/libusb )
    sdl? ( media-libs/libsdl2 )"
RDEPEND="${DEPEND}"
BDEPEND="
    dev-python/toml"

src_configure() {
    local mycmakeargs=(
        -DCAHUTE_CLI=$(usex cli)
        -DCAHUTE_CLI_EXPERIMENTAL=$(usex cli-experimental)
        -DCAHUTE_LIBUSB=$(usex libusb)
        -DCAHUTE_SDL=$(usex sdl)
    )

    cmake_src_configure
}
