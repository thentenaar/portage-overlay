# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic multilib multilib-minimal toolchain-funcs

DESCRIPTION="A set of extensions to Tcl"
HOMEPAGE="https://github.com/flightaware"
SRC_URI="https://github.com/flightaware/${PN}/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="threads"
RESTRICT="test"

DEPEND="dev-lang/tcl:0="
RDEPEND="${DEPEND}"

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_configure() {
	econf \
		$(use_enable threads) \
		--enable-shared \
		--with-tcl="${EROOT}/usr/$(get_libdir)/"
}

multilib_src_compile() {
	append-flags -fPIC
	default
}

multilib_src_install() {
	default

	if multilib_is_native_abi; then
		doman doc/*.[n3]
	fi
}
