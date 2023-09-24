# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Interactive adduser script."
HOMEPAGE="http://www.iii-lo.tarnow.pl/addu/"
SRC_URI="http://www.iii-lo.tarnow.pl/addu/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ppc sparc mips alpha hppa amd64"

DEPEND="app-arch/tar
	app-arch/gzip
	dev-lang/perl"

src_install() {
	sed 's\ADDUFILES=nothing\ADDUFILES='/etc/addu'\' addu.source > addu
	chmod +x addu
	dosbin addu
	dodir /etc/addu/locks
	insinto /etc/addu
	doins groups first.mail lock.msg
	dodoc README
	dodoc Changelog
	dodoc COPYING
	echo quit | mail quiet 2> /dev/null && ./install register
}
