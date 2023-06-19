//
//  UIViewController+TYHAdd.m
//  TYHTransAndTTS_Example
//
//  Created by yuhua Tang on 2023/6/19.
//  Copyright © 2023 pencilCool. All rights reserved.
//

#import "UIViewController+TYHAdd.h"
@import ObjectiveC;
@implementation UIViewController(TYHAdd)

+ (void)load {
    [UIViewController tyhadd_swizzleInstanceMethod:@selector(presentViewController:animated:completion:) with:@selector(tyhadd_presentViewController:animated:completion:)];
    [UIViewController tyhadd_swizzleInstanceMethod:@selector(dismissViewControllerAnimated:completion:) with:@selector(tyhadd_dismissViewControllerAnimated:completion:)];
}

+ (BOOL)tyhadd_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

- (void)tyhadd_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion  {
    NSString *vcClassName = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"present vc class name:%@",vcClassName);
    [self tyhadd_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)tyhadd_dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {

    [self tyhadd_dismissViewControllerAnimated:flag completion:completion];
}

@end
