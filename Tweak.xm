#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#include "imgui.h"
#include "imgui_impl_metal.h"

// Oyun açıldığında çalışacak test kodu
%hook UIViewController
- (void)viewDidLoad {
    %orig;
    NSLog(@"[M7MD] Tweak basariyla yuklendi!");
}
%end
