ARCHS = arm64
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = ShadowTrackerExtra

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = M7MD

# Gerekli Frameworkler
M7MD_FRAMEWORKS = UIKit Foundation Security Metal MetalKit QuartzCore AVFoundation

# Arama Yolları (SDK, ESP ve ImGui klasörlerini tanıtıyoruz)
M7MD_CFLAGS = -fobjc-arc -I. -ISDK -IESP -IESP/imgui -I/opt/theos/include
M7MD_CCFLAGS = -std=gnu++17 -DNDEBUG

# Projedeki TÜM dosyalar (Görsellerdeki yapıya göre)
M7MD_FILES = Tweak.xm Engine.mm Esp.mm Menu.mm ESP/imgui/imgui.cpp ESP/imgui/imgui_draw.cpp ESP/imgui/imgui_tables.cpp ESP/imgui/imgui_widgets.cpp ESP/imgui/imgui_impl_metal.mm

include $(THEOS)/makefiles/tweak.mk
