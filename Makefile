export THEOS_DEVICE_IP = 192.168.1.34
export ARCHS = armv7 arm64
# export TARGET = iphone:compiler:Base SDK:Deployment Target
export TARGET = iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = gamehub_tweak
gamehub_tweak_FILES = Tweak.xm
#gamehub_tweak_FRAMEWORKS = UIKit CoreTelephony CoreAudio
#gamehub_tweak_PRIVATE_FRAMEWORKS = AppSupport ChatKit IMCore
# gamehub_tweak_LDFLAGS = -lz -lsqlite3.0 -dylib1.o

###
# Private frameworks change a lot in each iOS version
# In this case, “weak linking” or dyld series functions 
# like dlopen(), dlsym() and dlclose() can solve this problem
###

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Gamehub"
