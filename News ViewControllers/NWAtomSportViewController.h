//
//  NWAtomSportViewController.h
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAtomSportTableViewCell.h"
#import "NAtomSportNewsRequest.h"

@interface NWAtomSportViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSCache *imageCache;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *headerViewLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *sportItem;
@property (strong, nonatomic) NSMutableArray *expandedCells;
- (IBAction)update:(id)sender;

@end
