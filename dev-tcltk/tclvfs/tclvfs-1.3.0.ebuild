# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic multilib multilib-minimal

MY_PV=b5e463e712

DESCRIPTION="Tcl Virtual Filesystem Extension"
HOMEPAGE="https://core.tcl-lang.org/tclvfs"
SRC_URI="https://core.tcl-lang.org/${PN}/tarball/${MY_PV}/${PN}-${MY_PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="test"

RDEPEND="
	dev-lang/tcl:0=
	dev-tcltk/tcllib
	"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_compile() {
	append-flags -fPIC
	emake
}
