//
//  ViewController.m
//  LoadingImage
//
//  Created by Lycodes_Dong on 6/15/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMyLoadingImageView];
    
}

- (void)createMyLoadingImageView {
    
    NSString *urlstring = @"";

    [_myLoadingImageView startWithURL:urlstring];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
