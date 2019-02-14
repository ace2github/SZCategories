//
//  ViewController.m
//  SZCategories
//
//  Created by ChaohuiChen on 2019/2/12.
//  Copyright © 2019 ChaohuiChen. All rights reserved.
//

#import "ViewController.h"
#import "SZWorld.h"

@interface ViewController ()

@end

SZY_CONST_STRING kName = @"CCH";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
    NSString *name = @"CCH";
    NSLog(@"%@",SZDynamicCast(name, NSString));
    NSLog(@"%@",SZDynamicCast(@1, NSString));
    @weakify(self)
    @weakify(name)
    dispatch_async(dispatch_get_main_queue(), ^{
        @strongify(self)
        @strongify(name)
        NSLog(@"%@,%@",self, name);
    });
    
    NSLog(@"%@", [SZWorld defaultSingleton]);
    
    SZClangDiagnosticIgnoredUnusedVariable()
    NSString *unuseVar = @"";
    SZClangDiagnosticPod()
}


@end
