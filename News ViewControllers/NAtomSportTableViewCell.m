//
//  NAtomSportTableViewCell.m
//  News
//
//  Created by vijaythyagarajan on 01/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomSportTableViewCell.h"

@implementation NAtomSportTableViewCell

@synthesize displayImage = _displayImage;
@synthesize detailTextLabel = _detailTextLabel;
@synthesize statusMessageLabel = _statusMessageLabel;



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initialSettings];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initialSettings {
    
}

@end
