//
//  LoadingImageView.m
//  LoadingImage
//
//  Created by Lycodes_Dong on 8/26/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "LoadingImageView.h"

@interface LoadingImageView()

@property UIActivityIndicatorView *myActivityIndicatorView;

@end

@implementation LoadingImageView

#pragma mark Self init

- (instancetype)initWithFrame:(CGRect)frame URL:(NSString *)urlstring {

    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self startWithURL:urlstring];
        
    }
    
    return self;

}

#pragma mark Self Start

- (void)startWithURL:(NSString *)urlstring {

    self.backgroundColor = [UIColor grayColor];
    
    _myActivityIndicatorView = [self createMyCustomUIActivityIndicatorViewWithframe:self.frame];
    
    [self addSubview:self.myActivityIndicatorView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.myActivityIndicatorView startAnimating];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self getImageWithURL:urlstring Completion:^(UIImage *image){
                
                [self finishedLoadingImage:image];
                
            }];
            
        });
        
    });

}

#pragma mark Finished Loading Image

- (void)finishedLoadingImage:(UIImage *)image {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.myActivityIndicatorView stopAnimating];
        
        [self.myActivityIndicatorView removeFromSuperview];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.image = image;
            
        });
        
    });
    
}

#pragma mark Get Image

- (void)getImageWithURL:(NSString *)urlstring Completion:(void(^)(UIImage *))completion {

    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
    
        NSData *data = [NSData dataWithContentsOfURL:location];
        
        UIImage *image = [UIImage imageWithData:data];
        
        completion(image);
    
    }];
    
    [downloadTask resume];

}

#pragma mark Create My Custom UIActivityIndicatorView

- (UIActivityIndicatorView *)createMyCustomUIActivityIndicatorViewWithframe:(CGRect)frame {
    
    UIActivityIndicatorView *myActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    myActivityIndicatorView.center = CGPointMake(CGRectGetWidth(frame) / 2.0f, CGRectGetHeight(frame) / 2.0f);
    myActivityIndicatorView.hidesWhenStopped = YES;
    myActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    myActivityIndicatorView.color = [UIColor blackColor];
    
    return myActivityIndicatorView;
    
}

@end
