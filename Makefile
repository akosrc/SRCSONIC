ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

TARGET = iphone:clang:latest:18.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = M7MD

# DİKKAT: substrate yerine ellekit kullanıyoruz
M7MD_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController WebKit Metal MetalKit ellekit

# Arama Yolları
M7MD_CFLAGS += -I. -ISDK -IESP -IESP/imgui -I/opt/theos/include

# Uyarıları hata olmaktan çıkar
M7MD_CCFLAGS = -w -std=gnu++17 -DNDEBUG -Wno-everything -Wno-error -Wno-deprecated-declarations -Wno-return-stack-address -Wno-unicode-whitespace -Wno-macro-redefined -Wno-int-to-pointer-cast -Wno-array-bounds -Wno-nontrivial-memcall -Wno-unused-variable
M7MD_CFLAGS = -w -fobjc-arc -Wno-everything -Wno-error -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

# Dosyalar
M7MD_FILES = Tweak.xm Bypass.mm Engine.mm Esp.mm Menu.mm \
             ESP/imgui/imgui.cpp ESP/imgui/imgui_draw.cpp \
             ESP/imgui/imgui_tables.cpp ESP/imgui/imgui_widgets.cpp \
             ESP/imgui/imgui_impl_metal.mm

include $(THEOS)/makefiles/tweak.mk
