//
//  ViewController.m
//  LoadingImage
//
//  Created by Lycodes_Dong on 6/15/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "ViewController.h"
#import "LoadingImageView.h"

@interface ViewController ()

@property (strong, nonatomic) LoadingImageView *myLoadingImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createLoadingImageView];
    
}

- (void)createLoadingImageView {
    
    for (UIView *view in self.view.subviews) {
        if (view == self.myLoadingImageView) {
            [view removeFromSuperview];
        }
    }
    
    self.myLoadingImageView = nil;
    
    if (!self.myLoadingImageView) {
        self.myLoadingImageView = [[LoadingImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300) URL:@""];
    }else {
        NSLog(@"LoadingImageView is not nil...");
    }
    
    [self.view addSubview:self.myLoadingImageView];

}

- (IBAction)buttonClick:(id)sender {

    if (self.myLoadingImageView.finished) {
        [self createLoadingImageView];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
