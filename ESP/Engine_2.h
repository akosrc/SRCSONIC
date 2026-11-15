// HMOOD__TG@i_8_f
#pragma once

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#include <mach-o/dyld.h>
#include <string>
#include <atomic>

#ifndef HMOOD_METALBIEW_IMPLEMENTATION
#error "metalbiew_private.h must only be included by metalbiew.mm"
#endif

// HATA ÇÖZÜMÜ: metalbiew ana sınıf tanımı buraya eklendi.
// Bu tanım olmadan derleyici metalbiew'in UIViewController'dan türediğini bilemez.
@interface metalbiew : UIViewController <MTKViewDelegate>
@end

float Z = 0.5f;
static std::atomic<float> aimDisplayWidth{0.f}, aimDisplayHeight{0.f};

// Kategori (Class Extension) - Mevcut kodunuz
@interface metalbiew () <MTKViewDelegate>
@property(nonatomic, strong) IBOutlet MTKView* mtkView;
@property(nonatomic, strong) id<MTLDevice> device;
@property(nonatomic, strong) id<MTLCommandQueue> commandQueue;
@property(nonatomic, weak) NSTimer* timer;
@property(nonatomic, assign) NSInteger aimcir;
@property(nonatomic, assign) NSInteger rpr;

@end

// HMOOD__TG@i_8_f
static uintptr_t Get_module_base() {
    uint32_t count = _dyld_image_count();
    for (int i = 0; i < count; i++) {
        std::string path = (const char*)_dyld_get_image_name(i);
        if (path.find("ShadowTrackerExtra.app/ShadowTrackerExtra") != path.npos) {
            return (uintptr_t)_dyld_get_image_vmaddr_slide(i);
        }
    }
    return 0;
}

// HMOOD__TG@i_8_f
bool IsValidAddress(kaddr addr) {
    return addr > 0x100000000 && addr < 0x2000000000;
}

extern bool aPVQRIF;
extern bool zQkX8A;
extern bool MxVsd;
extern bool MXValQy;

extern UIView* menuIconView;
extern float menuIconAlpha;

// ÇAKIŞMA ÇÖZÜMÜ: Tüm değişkenler extern yapıldı
extern bool hideNameKillMsg;
extern float strokeIntensity;
extern ASTExtraPlayerController* g_LocalController;
extern ASTExtraPlayerController* localPlayerController;
extern ASTExtraPlayerCharacter* localPlayer;
extern ImFont* mainFont;
extern float globalHpAlphaF;
extern ImU32 COLOR_Distance;
extern ImColor borderColor;
extern ImColor bgColor;
extern bool ifismembotenable;

namespace Settings {
    extern bool isVisibilityCheck;
    extern bool ifismembotenable;
    extern bool BypassMode;
    
    namespace SettingsTab {
        extern bool BypassMode;
    }

    namespace Aimbot {
        extern bool Enable;
        extern bool Tick;
        extern int AimMethod;
        extern std::atomic<int> TriggerMode;
        extern float FOV;
        extern bool MemoryAimbot;
        extern bool SilentAim;

        namespace SilentAimSettings {
            extern bool Enable;
            extern bool AimKnocked;
            extern bool Highprecisiontracking;
            extern int Aimpositon;
            extern bool Prediction;
            extern bool EnableFov;
            extern bool BypassFOVLimit;
            extern bool AimingLine;
            extern float MaxStepDeg;
            extern int LegitTrackSwitchrate;
        }
    }
}

extern float ESPMaxDistance;
extern float AlertRadius;
extern float SilentAimMaxDistance;
extern int IsStyle;

namespace imgui {
    extern bool ESP;
    extern bool Boxes;
    extern bool HideBot;
    extern bool Health;
    extern bool Line;
    extern bool Name;
    extern bool TeamID;
    extern bool Distance;
    extern bool EnemyCount;
    extern bool Weapon;
    extern bool Bone;
    extern bool GameInfo;
    extern bool Alert360;
    extern bool EnemyAiming;
    extern bool Items;
    extern bool Lootbox;
    extern bool Vehicle;
    extern bool Grenade;
}

namespace itemesp {
    extern bool Enable;
    extern bool Vehicles;
    extern float MaxDistance;
}

extern bool IsEnglish;
extern bool ShowFov;
extern int 玩家, 人机;
extern bool 坐标追;
extern bool 自动开火;
extern const float offset;
extern bool 下雨;
extern float 巨人;
extern bool 人物变大;
extern bool 重置游客;
extern int 打击圈;
extern int CL;
extern bool 瞄准线;
extern bool AimBot;
extern int AimF;
extern int value;
extern int Aim;
extern float 追踪概率;
extern bool FixShoot;
extern float Cross;
extern float g_disstance;
extern bool IgnoreKnocked;
extern bool VisCheck;
extern bool IgnoreBot;
extern float RadarX;
extern float RadarY;
extern bool 对局信息;
extern bool IsLogin;
extern bool Enable;
extern float crosshairSizeSlider;
extern bool IsCrossHair;
extern bool IsNocamerashake;
extern bool IsFastshoot;
extern bool IsFastSwitch;
extern bool IsNorecoil2;
extern bool IsFastDrop;
extern bool IsHitXPL;
extern bool InstantHit;
extern float carx;
extern float cary;
extern float carz;
extern bool CarFly;
extern bool tudongnhay;
extern bool chaynhanhv2;
extern float tocdoquay;
extern bool isSpinning;
extern float DanceValue;
extern float DancerValue;
extern float rainbowSpeed;
extern bool MaxStep;
extern bool good;
extern bool Blacksky;
extern bool 枪械变大;
extern bool HitX;
extern bool ReCo;
extern float magicX;
extern float magicY;
extern float magicZ;
extern bool MagicSDK;
extern bool Magic;
extern bool textBorder;
extern bool IsLaunch;
extern bool ResetGuest;
extern int SX;
extern float Gun_Size;
extern bool 人物自杀;
extern bool 据点;
extern int currentLanguage;
extern bool WideView;
extern bool MemoryFastScope;
extern bool MemoryZoom;
extern bool MemoryDamage;
extern bool MemoryRainbow;
extern bool MemoryCrossSpin;
extern float MemoryZoomFov;
extern float MemoryRainbowSpeed;
extern float MemoryCrossSpinSpeed;
extern int WideValue;
extern bool initialized;

void InitializeMemoryProtection();

#include <iostream>
#include <chrono>
#include <thread>
#include <cmath>

extern bool hideHacker;
extern HeeeNoScreenShotView* hideesp;
extern kaddr module;

namespace YN {
    extern int boxtype;
    extern int healthbartype;
    extern int Nationtype;
    extern int DirectionLineSize;
    extern int VehicleDirectionLineSize;
    extern int offscreen_range;
    extern int max_distance_offscreen;
    extern int playersdistancessize;
    extern bool esp_Outline;
    extern int distance_Radar;
}

extern long l2;
using namespace std;
using namespace SDK;
using namespace ImGui;

extern int Radar;
extern bool 下雪特效;

struct sConfig {
    struct sESPMenu {
        bool Health;
        bool Name;
        bool Distance;
        bool TeamID;
        bool 对局信息;
        bool Weapon;
        bool Vehicle;
        bool IgnoreBot;
    };
    sESPMenu ESPMenu{false};
};
extern sConfig Config;

extern UISlider* Auto1;
extern int Interval;
extern int counter;
extern float AimSmooth;
extern int boxtype;
extern int healthbartype;
extern int Nationtype;
extern int DirectionLineSize;
extern int VehicleDirectionLineSize;
extern int offscreen_range;
extern int max_distance_offscreen;
extern int playersdistancessize;
extern bool esp_Outline;
extern int distance_Radar;

#define SLEEP_TIME 1000LL / 120LL
#define TORAD(x) ((x) * (M_PI / 180.f))

extern int screenWidth;
extern int screenHeight;
extern char extra[30];
extern float density;

#define PI 3.14159265358979323846
#define __fastcall
