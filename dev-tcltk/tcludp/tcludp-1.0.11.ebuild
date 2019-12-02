# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic multilib multilib-minimal

DESCRIPTION="UDP for Tcl"
HOMEPAGE="https://sourceforge.net/projects/tcludp"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-lang/tcl:0=
	dev-tcltk/tcllib
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}"

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_compile() {
	append-flags -fPIC
	default
}

multilib_src_install() {
	default

	if multilib_is_native_abi; then
		doman doc/udp.n
	fi
}
