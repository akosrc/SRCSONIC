#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

// Oyunun içine girmek için gerekli temel hook
%hook UIViewController

- (void)viewDidLoad {
    %orig;
    
    // Oyunun ana ekranı yüklendiğinde ImGui'yi başlat
    NSLog(@"[M7MD] Tweak basariyla yuklendi ve oyun acildi!");
}

%end
