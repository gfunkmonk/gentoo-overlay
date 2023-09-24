# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit unpacker gnome2-utils xdg-utils

DESCRIPTION="Elegant Facebook Messenger desktop app"
HOMEPAGE="https://sindresorhus.com/caprine/"
SRC_URI="
	amd64? ( https://github.com/sindresorhus/${PN}/releases/download/v${PV}/${PN}_${PV}_amd64.deb -> ${P}-amd64.deb )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	app-crypt/libsecret
"

S=${WORKDIR}

src_install () {
	dodir /
	cd "${ED}" || die
	unpacker
}

pkg_preinst() {
    gnome2_icon_savelist
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
