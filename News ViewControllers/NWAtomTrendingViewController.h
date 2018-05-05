//
//  NWAtomTrendingViewController.h
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DetailView.h"
#import "Utils.h"
#import "YTPlayerView.h"

@interface NWAtomTrendingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,detailViewDelegate,YTPlayerViewDelegate>
{
    NSCache *imageCache;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeightLayoutConstraint;

-(UIImage *)publishImageForUrl:(NSString *)imageURL;
@end
