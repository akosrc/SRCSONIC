#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <unistd.h>
#include <dlfcn.h>
#include <mach-o/dyld.h>
#include <sys/ptrace.h>      // ptrace için gerekli
#import <substrate.h>       // MSHookFunction için gerekli (Theos'ta varsayılan gelir)

// 1. PTRACE KORUMASINI ATLATMA
static int (*orig_ptrace)(int request, pid_t pid, caddr_t addr, int data);
int my_ptrace(int request, pid_t pid, caddr_t addr, int data) {
    if (request == 31) { // PT_DENY_ATTACH
        return 0; 
    }
    return orig_ptrace(request, pid, addr, data);
}

// 2. SYSCTL KORUMASINI ATLATMA
static int (*orig_sysctl)(int *name, u_int namelen, void *info, size_t *infosize, void *newinfo, size_t newinfosize);
int my_sysctl(int *name, u_int namelen, void *info, size_t *infosize, void *newinfo, size_t newinfosize) {
    int ret = orig_sysctl(name, namelen, info, infosize, newinfo, newinfosize);
    
    if (name[0] == CTL_KERN && name[1] == KERN_PROC && namelen >= 3) {
        struct kinfo_proc *kp = (struct kinfo_proc *)info;
        kp->kp_proc.p_flag &= ~P_TRACED;
    }
    return ret;
}

// 3. DYLIB GİZLEME
static const char *(*orig_dyld_get_image_name)(uint32_t image_index);
const char *my_dyld_get_image_name(uint32_t image_index) {
    const char *name = orig_dyld_get_image_name(image_index);
    if (name && strstr(name, "M7MD.dylib")) {
        return "/usr/lib/system/libsystem_kernel.dylib"; 
    }
    return name;
}

// C++ Constructor (Eski %ctor yerine)
__attribute__((constructor))
static void bypass_init() {
    @autoreleasepool {
        NSLog(@"[Bypass] Anti-Cheat Bypass basariyla yuklendi!");
        
        // Ptrace Hook'unu aktif et
        MSHookFunction((void *)ptrace, (void *)my_ptrace, (void **)&orig_ptrace);
        
        // Sysctl Hook'unu aktif et
        MSHookFunction((void *)sysctl, (void *)my_sysctl, (void **)&orig_sysctl);
        
        // Dylib Gizleme Hook'unu aktif et
        MSHookFunction((void *)&_dyld_get_image_name, (void *)my_dyld_get_image_name, (void **)&orig_dyld_get_image_name);
    }
}
