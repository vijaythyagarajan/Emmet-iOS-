//
//  DetailView.h
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@protocol detailViewDelegate;

@interface DetailView : UIView <YTPlayerViewDelegate>
{
    id <detailViewDelegate> delegate;
}
@property (strong,nonatomic) UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *NewsImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *detailNewsText;
@property (weak, nonatomic) IBOutlet UILabel *newsScourceUrl;
@property (weak, nonatomic) IBOutlet UIView *textDefineView;
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@property (strong,nonatomic) NSMutableArray *articlesRead;

- (IBAction)closeButton:(id)sender;

+(void) playVideos;

@property (nonatomic,retain) id <detailViewDelegate> delegate;

@end

@protocol detailViewDelegate

-(BOOL) closeButtonDidPressed;

-(void) articlesRead;

@end
