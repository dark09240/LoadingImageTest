//
//  LoadingImageView.h
//  LoadingImage
//
//  Created by Lycodes_Dong on 8/26/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingImageView : UIImageView

- (instancetype)initWithFrame:(CGRect)frame URL:(NSString *)urlstring;

- (void)startWithURL:(NSString *)urlstring;

@end
