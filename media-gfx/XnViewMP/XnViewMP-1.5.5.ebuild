# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_VER="glibc2.17-x86_64"
DESCRIPTION="XnView MP is a versatile and powerful photo viewer, image management, image resizer. XnView is one of the most stable, easy-to-use, and comprehensive photo editors."
HOMEPAGE="https://www.xnview.com/en/xnviewmp/"

SRC_URI="https://download.xnview.com/XnView_MP.${MY_VER}.AppImage"
KEYWORDS="amd64"

LICENSE="GPL-3"
SLOT="0"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"

QA_PREBUILT="*"

src_install() {
	newbin "${DISTDIR}/XnView_MP.${MY_VER}.AppImage" XnViewMP
}
