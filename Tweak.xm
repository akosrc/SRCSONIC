#import <Foundation/Foundation.h>

__attribute__((constructor))
static void tweak_init() {
    NSLog(@"[M7MD] Substrate olmadan yuklendi!");
}
