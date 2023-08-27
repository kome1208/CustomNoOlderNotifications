TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
# THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CustomNoOlderNotifications

CustomNoOlderNotifications_FILES = CustomNoOlderNotificationsRootListController.m
CustomNoOlderNotifications_FRAMEWORKS = UIKit
CustomNoOlderNotifications_LIBRARIES = sparkcolourpicker
CustomNoOlderNotifications_PRIVATE_FRAMEWORKS = Preferences
CustomNoOlderNotifications_INSTALL_PATH = /Library/PreferenceBundles
CustomNoOlderNotifications_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
