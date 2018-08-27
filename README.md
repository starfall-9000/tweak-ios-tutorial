# gamehub-tweak

* example for tweak gamehub app

* iphone 5 jb - ios 10.3.3

* from iOSAppReverseEngineering.pdf: https://github.com/iosre/iOSAppReverseEngineering

* office forum: http://bbs.iosre.com/

### learning

* use openSSH to ssh from macos to iphone ***

* use class-dump for dumping class information ***

* write tweak app

* write make file: http://www.gnu.org/software/make/manual/html_node/Makefiles.html

* write tweak file:

* hook by Logos: http://iphonedevwiki.net/index.php/Logos#File_Extensions_for_Logos (Logos file)

* write control file: http://www.debian.org/doc/debian-policy/ch-controlfields.html (custom for cydia info)

* use Reveal to see view hierarchy of target App

* use IDA and iFunBox for diassembler and debugger

* use cycript to connect application to the shell and debug ***

* use debugserver and lldb to dynamic debug and analysis (base on arm assembly debug)

* use dumpdecrypted to decrypt app from AppStore

* learn how to find library contains function (using grep, decached dyld_shared_cache_armv7s) ***

* learn how to analytic library by finding these base class (using class-dump) ***

* learn how to discover file by keyword (using grep, plutil) ***

### dir

* target binary

`/Library/MobileSubstrate/DynamicLibraries`

`/var/containers/Bundle/Application`

`/var/mobile/Containers/Data/Application`

`/Applications`

`/System/Library/Frameworks`

`/System/Library/PrivateFrameworks`

`/System/Library/LaunchDaemons`

`/Library/LaunchDaemons`

`/Library/LaunchAgents`

`/System/Library/PreferenceBundles/` *system preferences*

* target functions

### command

* class-dump:

`class-dump -sSH Gamehub.app/Gamehub -o Gamehub/`

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

* cycript:

get PID:

`ps -e | grep Gamehub`

PID = 4567

`cycript -p 4567`

or

`cycript -p Gamehub`

* debugserver and lldb:

`debugserver -x backboard *:1234 Gamehub.app/Gamehub`

or

`debugserver 192.168.1.56:1234 -a "MobileSMS"`

in client side:

`lldb`

`process connect connect://192.168.1.34:1234`

find address

`image list -o -f`

`image base address with offset = image base address without offset + ASLR offset`

set breakpoint

`b function`

`br s -a address`

`br s -a 'ASLROffset+address'`

* find AppStore directory

`ps -e | grep -i Gamehub`

or

`cycript -p Gamehub`

* decrypt App from AppStore:

modify binary file, generates SHA1 hashes for binary signature

`ldid -S dumpdecrypted.dylib`

`DYLD_INSERT_LIBRARIES=/var/mobile/Containers/Data/Application/A2D6B9BA-BDB0-4BB2-9785-94D040D53314/Documents/dumpdecrypted.dylib /var/containers/Bundle/Application/60237C57-505B-4589-AD19-153E3ED73C34/Gamehub.app/Gamehub`

* use cycrypt to find the process:

`[[UIApp keyWindow] recursiveDescription]`

`[UIResponder nextResponder]`