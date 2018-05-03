//
//  NWAtomTrendingTableViewCell.m
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NWAtomTrendingTableViewCell.h"

@implementation NWAtomTrendingTableViewCell

@synthesize  trendingImage = _trendingImage;
@synthesize  statusText = _statusText;
@synthesize  AuthorName = _AuthorName;
@synthesize  dateAndTime = _dateAndTime;
@synthesize  descriptionText = _descriptionText;

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createHiddenView];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) createHiddenView {
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark ];
    
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    visualEffectView.frame = _hiddenShadowView.bounds;
    [_hiddenShadowView addSubview:visualEffectView];
}

@end
