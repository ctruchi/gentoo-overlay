# gentoo-overlay
This repository contains an overlay to expose net-im/slack ebuild

To add repository to your Gentoo just create a text file with any name in directory /etc/portage/repos.conf/ (for example, /etc/portage/repos.conf/goltia.conf) with the following content:
```[goltia]
location = /var/lib/layman/goltia
sync-type = git
sync-uri = https://github.com/ctruchi/gentoo-overlay.git
auto-sync = yes
```
Then type ```emerge --sync && emerge -av slack``` to install slack.
