ARCHS = armv7 armv7s arm64

THEOS_DEVICE_IP = 192.168.0.15

TARGET = iphone:clang:latest:9.0

export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = revealMenu
revealMenu_CFLAGS = -fobjc-arc
revealMenu_FILES = revealMenu.xm revealMenuHelper.m
revealMenu_FRAMEWORKS = Foundation UIKit AudioToolbox
revealMenu_PRIVATE_FRAMEWORKS = PowerlogLiteOperators

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
