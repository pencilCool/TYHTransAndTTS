//
//  TYHViewController.m
//  TYHTransAndTTS
//
//  Created by pencilCool on 06/19/2023.
//  Copyright (c) 2023 pencilCool. All rights reserved.
//

#import "TYHViewController.h"
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
    [self addCell:@"Hook LTUITranslationViewController" action:^{
//        LTUITranslationViewController *vc = [LTUITranslationViewController new];
//        [self presentViewController:vc animated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
