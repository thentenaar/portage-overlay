# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="Web Services for Tcl"
HOMEPAGE="http://core.tcl.tk/tclws"
SRC_URI="https://core.tcl.tk/tclws/tarball/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-lang/tcl:0=
	dev-tcltk/tcllib
	dev-tcltk/tls
	"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-client-parse-all-bindings.patch"
	"${FILESDIR}/${P}-client-keep-stub-args-order.patch"
	"${FILESDIR}/${P}-client-async-stubs.patch"
	"${FILESDIR}/${P}-client-bound-operations-url-fix.patch"
)

HTML_DOCS=(docs)

src_prepare() {
	default
	local dest=$(echo 'puts [file dirname [info library]]' | tclsh)
	sed -i -e "s@^TARGETDIR=.*@TARGETDIR=\$(DESTDIR)${dest}/${PN}${PV}@" Makefile
}

src_compile() {
	return
}
