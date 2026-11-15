#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <mach/mach_traps.h>

// ... geri kalan Tweak.xm kodunuz ...

// Oyunun içine girmek için gerekli temel hook
%hook UIViewController

- (void)viewDidLoad {
    %orig;
    
    // Oyunun ana ekranı yüklendiğinde ImGui'yi başlat
    NSLog(@"[M7MD] Tweak basariyla yuklendi ve oyun acildi!");
}

%end
