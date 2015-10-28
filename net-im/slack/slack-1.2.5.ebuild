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

src_install() {	
	SLACK_PKG_HOME=usr/share/slack
	SLACK_HOME=/usr/share/slack

	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/*.png

	insinto ${SLACK_HOME}
	doins -r ${SLACK_PKG_HOME}/*
	fperms +x ${SLACK_HOME}/slack
	dosym ${SLACK_HOME}/slack /usr/bin/slack

	newicon -s 512 "${S}usr/share/pixmaps/slack.png" "slack.png"
	domenu "${S}usr/share/applications/slack.desktop"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}
