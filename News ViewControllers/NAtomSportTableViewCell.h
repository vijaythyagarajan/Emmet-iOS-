//
//  NAtomSportTableViewCell.h
//  News
//
//  Created by vijaythyagarajan on 01/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NAtomSportTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UILabel *statusMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailMessageLabel;
@property (weak, nonatomic) IBOutlet UIView *hiddenView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *doubleTapGesture;

@end
