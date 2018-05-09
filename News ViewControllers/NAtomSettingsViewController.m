//
//  NAtomSettingsViewController.m
//  News
//
//  Created by vijaythyagarajan on 04/05/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NAtomSettingsViewController.h"
#import "NWAtomSignInViewController.h"

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
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *settingsCell = [tableView dequeueReusableCellWithIdentifier:@"settings"];
    if(indexPath.section == 0){
        settingsCell.textLabel.text = @"Trending";
    }
    else if (indexPath.section == 1) {
        settingsCell.textLabel.text = @"Sign Out";
    }
    return settingsCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
       
        NWAtomSignInViewController *add = [self.storyboard instantiateViewControllerWithIdentifier:@"SIGIN"];
        [self presentViewController:add animated:YES completion:nil];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0 || section == 1){
        return 1;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

@end
