# gamehub-tweak

* example for tweak gamehub app

* iphone 5 jb - ios 10.3.3

### learning

* write tweak app

* write make file: http://www.gnu.org/software/make/manual/html_node/Makefiles.html

* write tweak file:

* hook by Logos: http://iphonedevwiki.net/index.php/Logos#File_Extensions_for_Logos (Logos file)

* write control file: http://www.debian.org/doc/debian-policy/ch-controlfields.html (custom for cydia info)

### command

* init project:

`$THEOS/bin/nic.pl`

`choose iphone/tweak`

* compile project:

`make`

* package project:

`make package`

* clean project:

`make clean && rm -rf packages`

* install package:

`make package install`

or:

`scp packages/com.trustcircle.gamehub-tweak_0.0.1-2+debug_iphoneos-arm.deb root@192.168.1.34:~`

`ssh root@192.168.1.34`

`dpkg -i com.trustcircle.gamehub-tweak_0.0.1-2+debug_iphoneos-arm.deb`
