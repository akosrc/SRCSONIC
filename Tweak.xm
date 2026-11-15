#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

// Substrate olmadan çalışması için sadece boş bir başlatıcı
__attribute__((constructor))
static void tweak_init() {
    NSLog(@"[M7MD] Tweak Substrate olmadan basariyla yuklendi!");
}
