# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

MY_PV=c62e762c5d

DESCRIPTION="Tk Standard Library"
HOMEPAGE="http://www.tcl.tk/software/tklib"
SRC_URI="https://core.tcl-lang.org/${PN}/tarball/${MY_PV}/${PN}-${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="test"

RDEPEND="
	dev-lang/tk:0=
	dev-tcltk/tcllib
	"
DEPEND="${RDEPEND}"
HTML_DOCS=(embedded/www)
S="${WORKDIR}/${PN}-${MY_PV}"
