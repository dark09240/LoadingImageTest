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

    CGRect frame;
    
    NSString *urlstring = @"http://122.146.84.65:8081/phpqrcode/temp/test.png";
    
//    _myLoadingImageView = [[LoadingImageView alloc]initWithFrame:frame URL:urlstring];

    [_myLoadingImageView startWithURL:urlstring];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
