//
//  TYHViewController.m
//  TYHTransAndTTS
//
//  Created by pencilCool on 06/19/2023.
//  Copyright (c) 2023 pencilCool. All rights reserved.
//

#import "TYHViewController.h"
#include <dlfcn.h>
@import TYHTransAndTTS;
//@import TranslationUIServices;
//#import <TranslationUIServices/LTUITranslationViewController.h>
@interface TYHViewController ()

@end

@implementation TYHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // LTUITranslationViewController
    // https://github.com/lechium/iPhone_OS_15.5/blob/0f4def7da3cad33a6ea5a4224f4ec3526f3e73f8/System/Library/PrivateFrameworks/TranslationUIServices/LTUITranslationViewController.h#L14
    __weak typeof(self) ws = self;
    [self addCell:@"Hook LTUITranslationViewController" action:^{
        void *lib = dlopen("/System/Library/PrivateFrameworks/TranslationUIServices.framework/TranslationUIServices", RTLD_LAZY);
        if (lib) {
            
        }
        Class cls = NSClassFromString(@"LTUITranslationViewController");
        UIViewController *vc = [cls new];
        NSString *pureText = @"Suppose you want to build a computer network, one that has the potential to grow to global proportions and to support applications as diverse as teleconferencing, video on demand, electronic commerce, distributed computing, and digital libraries. What available technologies would serve as the underlying building blocks, and what kind of software architecture would you design to integrate these building blocks into an effective communication service? Answering this question is the overriding goal of this book—to describe the available building materials and then to show how they can be used to construct a network from the ground up.";
        NSAttributedString *text = [[NSAttributedString alloc] initWithString:pureText];
        [vc  setValue:text forKey:@"text"];
        [ws presentViewController:vc animated:YES completion:nil];
    }];
    
    [self addCell:@"" action:^{
        NSString *pureText = @"Suppose you want to build a computer network, one that has the potential to grow to global proportions and to support applications as diverse as teleconferencing, video on demand, electronic commerce, distributed computing, and digital libraries. What available technologies would serve as the underlying building blocks, and what kind of software architecture would you design to integrate these building blocks into an effective communication service? Answering this question is the overriding goal of this book—to describe the available building materials and then to show how they can be used to construct a network from the ground up.";
        NSAttributedString *text = [[NSAttributedString alloc] initWithString:pureText];
        [TYHTransAndTTS prcessText:text on:ws];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
