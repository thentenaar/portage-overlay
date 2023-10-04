# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic multilib multilib-minimal

MY_PN="tcllib"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="C Accelerators for the Tcl Standard Library"
HOMEPAGE="http://www.tcl.tk/software/tcllib/"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_PN}/${PV}/${MY_P}.tar.xz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64"
RESTRICT="test"

RDEPEND="
	dev-lang/tcl:0=
	~dev-tcltk/tcllib-${PV}
	dev-tcltk/critcl
	"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	sed -i -e 's/ critcl/ critcl -debug symbols/' Makefile.in
	multilib_copy_sources
}

multilib_src_compile() {
	append-flags -fPIC -Wno-implicit-function-declaration
	emake critcl
}

multilib_src_install() {
	insinto "/usr/$(get_libdir)/${PN}${PV}"
	doins -r modules/tcllibc/*
}
