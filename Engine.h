#ifndef Engine_h
#define Engine_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <vector>
#include <string>
#include <map>
#include <chrono>
#include <mutex>

// Düzeltilmiş Yollar
#import "SDK.hpp"
#include "ESP/imgui/imgui.h"

#include "esp.h"
#include "menu.h"

// Global değişkenler
extern ASTExtraPlayerCharacter *g_LocalPlayer;
extern ASTExtraPlayerController *g_PlayerController;
extern ASTExtraPlayerController *g_LocalController;

extern int screenWidth;
extern int screenHeight;
extern int glWidth;
extern int glHeight;

extern bool IsLogin;
extern bool MenDeal;

// Fontlar
extern UFont *tslFont;
extern UFont *robotoFont;
extern UFont *robotoTinyFont;

// Fonksiyon tanımları
UWorld *GetFullWorld();
TNameEntryArray *GetGNames();
void RenderESP(AHUD *HUD, int ScreenWidth, int ScreenHeight);
FVector GetBoneLocationByName(ASTExtraPlayerCharacter *Actor, const char *BoneName);
ASTExtraPlayerCharacter* GetTargetByCrossDist();
const char *GetVehicleName(ASTExtraVehicleBase *Vehicle);

// Yardımcı fonksiyonlar
bool WriteAddr(void *addr, void *buffer, size_t length);
kaddr getRealOffset(kaddr offset);

#endif /* Engine_h */
