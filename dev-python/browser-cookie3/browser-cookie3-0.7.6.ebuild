# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python{3_5,3_6,3_7})

inherit distutils-r1

DESCRIPTION="Module to import cookies from Firefox and Chrome"
HOMEPAGE="https://github.com/borisbabic/browser_cookie3"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="dev-python/keyring
         dev-python/pyaes
         dev-python/pbkdf2"
