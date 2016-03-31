# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit gnome2-utils unpacker

DESCRIPTION="Desktop application for Slack webapp"
SLOT="0"
HOMEPAGE="https://slack.com/apps"
SRC_BASE="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${PV}"
SRC_URI="amd64? ( ${SRC_BASE}-amd64.deb )
			x86? ( ${SRC_BASE}-i386.deb )"
LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
S=${WORKDIR}/

QA_PREBUILT="opt/slack/slack"

DEPEND="gnome-base/gconf"

src_install() {	
	SLACK_PKG_HOME=usr/share/slack

	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/*.png

	dolib.so usr/lib/slack/*.so*

	insinto /usr/lib/slack
	doins -r usr/lib/slack/*

	fperms +x /usr/lib/slack/slack
	dosym /usr/lib/slack/slack /usr/bin/slack
	
	newicon -s 512 "${S}usr/share/pixmaps/slack.png" "slack.png"
	domenu "${S}usr/share/applications/slack.desktop"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

