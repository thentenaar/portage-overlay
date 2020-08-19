# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils flag-o-matic multilib multilib-minimal toolchain-funcs

DESCRIPTION="C Runtime In Tcl"
HOMEPAGE="http://andreas-kupries.github.io/critcl"
SRC_URI="https://github.com/andreas-kupries/critcl/archive/${PV}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="amd64 ~arm64"

DEPEND="
	>=dev-lang/tcl-8.6:0=
	dev-tcltk/tcllib
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-build.patch"
	"${FILESDIR}/${P}-fix_tests.patch"
)

HTML_DOC="embedded/www"

src_prepare() {
	default
	multilib_copy_sources
}

src_compile() {
	return
}

multilib_src_configure() {
	return
}

multilib_src_install() {
	append-flags -fPIC
	sed -i -e "s;@LIBDIR@;${EROOT}/usr/$(get_libdir)/${P};" build.tcl
	tclsh build.tcl install "${D}"
	sed -i -e "s;${D};;" "${D}/usr/bin/critcl"
	mv "${D}/usr/bin/critcl" "${D}/usr/bin/critcl.${ARCH}"
	insinto "/usr/$(get_libdir)/${P}"
	doins "${FILESDIR}/pkgIndex.tcl"
}

multilib_src_install_all() {
	mv "${D}/usr/bin/critcl.${ARCH}" "${D}/usr/bin/critcl"
	rm -f "${D}/usr/bin/critcl.*"
	doman embedded/man/files/critcl*.n
	einstalldocs
}

multilib_src_test() {
	# md5.test requires installation before it will run
	rm -f test/md5.test
	tclsh build.tcl test
}
