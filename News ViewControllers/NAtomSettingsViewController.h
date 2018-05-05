//
//  NAtomSettingsViewController.h
//  News
//
//  Created by vijaythyagarajan on 04/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NAtomSettingsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *smallHeaderLabel;
@property (weak, nonatomic) IBOutlet UIView *largeHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
