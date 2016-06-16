//
//  LoadingImageView.m
//  LoadingImage
//
//  Created by Lycodes_Dong on 6/15/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "LoadingImageView.h"

@implementation LoadingImageView

#pragma mark Self init

- (id)initWithFrame:(CGRect)frame URL:(NSString *)urlstring {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.finished = false;
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.myActivityIndicatorView = [self createCustomActivityIndicatorViewWithView:self];
        
        [self addSubview:self.myActivityIndicatorView];
        
        [self.myActivityIndicatorView startAnimating];
        
        NSURL *url = [NSURL URLWithString:urlstring];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
            
            if (error == nil) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSData *data = [NSData dataWithContentsOfURL:location];
                    
                    UIImage *image = [UIImage imageWithData:data];
                    
                    UIImageView *imageview = [[UIImageView alloc]initWithImage:image];
                    
                    imageview.frame = frame;
                    
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"LoadingImage" object:imageview];
                    
                });
                
            }
            
        }];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(finishLoadingImageWith:) name:@"LoadingImage" object:nil];
        
        [downloadTask resume];
        
    }
    
    return self;

}

#pragma mark Finish Loading Image

- (void)finishLoadingImageWith:(NSNotification *)notification {
    
    [self.myActivityIndicatorView stopAnimating];
    
    for (UIView *view in self.subviews) {
        if (view == self.myActivityIndicatorView) {
            [view removeFromSuperview];
        }
    }
    
    UIImageView *imageview = [notification object];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
    [self addSubview:imageview];
    
    self.finished = true;

}

#pragma mark CustomActivityIndicatorView

- (UIActivityIndicatorView *)createCustomActivityIndicatorViewWithView:(UIView *)view {
    
    UIActivityIndicatorView *myActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)];
    myActivityIndicatorView.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height /2);
    myActivityIndicatorView.hidesWhenStopped = YES;
    myActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    myActivityIndicatorView.color = [UIColor blackColor];
    
    return myActivityIndicatorView;
    
}

@end
