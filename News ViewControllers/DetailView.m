//
//  DetailView.m
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView
@synthesize authorName = _authorName;
@synthesize detailNewsText = _detailNewsText;
@synthesize newsScourceUrl = _newsScourceUrl;
@synthesize NewsImageView = _NewsImageView;

@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // load view frame XIB
        [self commonSetup];
    }
    return self;
}

#pragma mark - setup view

- (void)commonSetup {
    DetailView *customView = [[[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:self options:nil] lastObject];
    self.bounds = customView.bounds;
    self.playerView.delegate = self;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.textDefineView.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.textDefineView.bounds;
    maskLayer.path  = maskPath.CGPath;
    _articlesRead = [[NSMutableArray alloc] init];
    self.textDefineView.layer.mask = maskLayer;
    [self addSubview:customView];
}


- (IBAction)closeButton:(id)sender {
    [delegate closeButtonDidPressed];
}

-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView {

}
@end
