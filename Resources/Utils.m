//
//  Utils.m
//  News
//
//  Created by vijaythyagarajan on 25/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "Utils.h"
#define BLUREFFECT_TAG 222

@implementation Utils

+(UIView *)createBlurEffectViewForFrame:(CGRect)frame {
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.tag = BLUREFFECT_TAG;
    visualEffectView.alpha = 0.7;
    visualEffectView.frame =frame;
    return visualEffectView;
}
@end
