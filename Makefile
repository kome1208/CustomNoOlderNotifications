TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
# THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomNoOlderNotifications

CustomNoOlderNotifications_LIBRARIES = sparkcolourpicker
CustomNoOlderNotifications_FILES = Tweak.x
CustomNoOlderNotifications_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += customnooldernotifications
include $(THEOS_MAKE_PATH)/aggregate.mk
