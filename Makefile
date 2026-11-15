ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

TARGET = iphone:clang:latest:18.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = M7MD

# Substrate veya ellekit YOK
M7MD_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController WebKit Metal MetalKit

# Kütüphane bağımlılığı YOK
# M7MD_LIBRARIES = substrate (SİLİNDİ)

M7MD_CFLAGS += -I. -ISDK -IESP -IESP/imgui -I/opt/theos/include

M7MD_CCFLAGS = -w -std=gnu++17 -DNDEBUG -Wno-everything -Wno-error -Wno-deprecated-declarations -Wno-return-stack-address -Wno-unicode-whitespace -Wno-macro-redefined -Wno-int-to-pointer-cast -Wno-array-bounds -Wno-nontrivial-memcall -Wno-unused-variable
M7MD_CFLAGS = -w -fobjc-arc -Wno-everything -Wno-error -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

# Bypass.mm listeden çıkarıldı (Substrate bağımlılığını kaldırmak için)
M7MD_FILES = Tweak.xm Engine.mm Esp.mm Menu.mm \
             $(wildcard SDK/*.cpp) \
             ESP/ini_rw.cpp ESP/HideFunsion.m \
             ESP/HeeeNoScreenShotView.m \
             $(wildcard ESP/Tools.mm) $(wildcard ESP/Tools.cpp) \
             ESP/imgui/imgui.cpp ESP/imgui/imgui_draw.cpp \
             ESP/imgui/imgui_tables.cpp ESP/imgui/imgui_widgets.cpp \
             ESP/imgui/imgui_impl_metal.mm

include $(THEOS)/makefiles/tweak.mk
