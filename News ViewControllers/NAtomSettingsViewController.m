//
//  NAtomSettingsViewController.m
//  News
//
//  Created by vijaythyagarajan on 04/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomSettingsViewController.h"

@interface NAtomSettingsViewController ()

@end

@implementation NAtomSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect thePosition =  _largeHeaderView.frame;
    CGRect container = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, scrollView.frame.size.width, scrollView.frame.size.height);
    if(CGRectIntersectsRect(thePosition, container))
    {
        _smallHeaderLabel.text = @"";
    }
    else
    {
        _smallHeaderLabel.text = @"Settings";
    }
}
//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
