#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <unistd.h>
#include <dlfcn.h>
#include <mach-o/dyld.h>
#include <string.h>

// ptrace fonksiyonu için extern deklarasyon
extern "C" int ptrace(int request, pid_t pid, caddr_t addr, int data);

// 1. PTRACE HOOK (Debugger engellemeyi kaldırır)
%hookf(int, ptrace, int request, pid_t pid, caddr_t addr, int data) {
    if (request == 31) { // PT_DENY_ATTACH
        return 0; 
    }
    return %orig;
}

// 2. SYSCTL HOOK (Dylib taramasını gizler)
%hookf(int, sysctl, int *name, u_int namelen, void *info, size_t *infosize, void *newinfo, size_t newinfosize) {
    int ret = %orig;
    if (name[0] == CTL_KERN && name[1] == KERN_PROC && namelen >= 3) {
        struct kinfo_proc *kp = (struct kinfo_proc *)info;
        kp->kp_proc.p_flag &= ~P_TRACED;
    }
    return ret;
}

// 3. DYLD HOOK (Kendi dylib'imizi gizler)
%hookf(const char *, _dyld_get_image_name, uint32_t image_index) {
    const char *name = %orig;
    if (name && strstr(name, "M7MD.dylib")) {
        return "/usr/lib/system/libsystem_kernel.dylib"; 
    }
    return name;
}

// Başlatıcı
%ctor {
    NSLog(@"[Bypass] Anti-Cheat Bypass basariyla yuklendi!");
}
