//
//  ViewController.m
//  SZCategories
//
//  Created by ChaohuiChen on 2019/2/12.
//  Copyright © 2019 ChaohuiChen. All rights reserved.
//

#import "ViewController.h"
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
}


@end
