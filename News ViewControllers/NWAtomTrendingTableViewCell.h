//
//  NWAtomTrendingTableViewCell.h
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface NWAtomTrendingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *trendingImage;
@property (weak, nonatomic) IBOutlet UILabel *statusText;
@property (weak, nonatomic) IBOutlet UILabel *AuthorName;
@property (weak, nonatomic) IBOutlet UILabel *dateAndTime;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;
@property (weak, nonatomic) IBOutlet UIView *hiddenShadowView;

@end
