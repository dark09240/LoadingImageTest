//
//  LoadingImageView.h
//  LoadingImage
//
//  Created by Lycodes_Dong on 6/15/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingImageView : UIView

@property (strong, nonatomic) UIActivityIndicatorView *myActivityIndicatorView;

@property (nonatomic) BOOL finished;

- (id)initWithFrame:(CGRect)frame URL:(NSString *)urlstring;

@end
