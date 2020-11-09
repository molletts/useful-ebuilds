# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=7
PYTHON_COMPAT=( python3_7 )

inherit eutils git-r3 distutils-r1 desktop

DESCRIPTION="Folding@home Client Control"
HOMEPAGE="http://folding.stanford.edu/"
EGIT_MIN_CLONE_TYPE="single"
EGIT_REPO_URI="https://github.com/cdberkstresser/fah-control.git"

LICENSE="GPL-3+"
SLOT="0"

KEYWORDS=""

IUSE=""

RDEPEND="dev-python/pygobject:3[${PYTHON_USEDEP}]
	${PYTHON_DEPS}"

DEPEND="!sci-biology/fahcontrol
	${RDEPEND}"

DOC=( README.md CHANGELOG.md )

python_install_all() {
	make_desktop_entry /usr/bin/FAHControl FAHControl FAHControl Science \
		"StartupNotify=false\nTerminal=false"

	distutils-r1_python_install_all
}
