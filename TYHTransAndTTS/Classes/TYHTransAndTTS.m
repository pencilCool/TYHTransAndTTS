//
//  TYHTransAndTTS.m
//  TYHTransAndTTS
//
//  Created by yuhua Tang on 2023/6/20.
//

#import "TYHTransAndTTS.h"
#include <dlfcn.h>

@implementation TYHTransAndTTS
+ (void)prcessText:(NSAttributedString *)text on:(UIViewController *)vc {
    static dispatch_once_t onceToken;
    static void *lib;
    dispatch_once(&onceToken, ^{
        lib = dlopen("/System/Library/PrivateFrameworks/TranslationUIServices.framework/TranslationUIServices", RTLD_LAZY);
    });
    
    if(!lib) return;
  
    Class cls = NSClassFromString(@"LTUITranslationViewController");
    UIViewController *privateVC = [cls new];
    if(!privateVC) return;
    [privateVC  setValue:text forKey:@"text"];
    [vc presentViewController:privateVC animated:YES completion:nil];
}
@end
