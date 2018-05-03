//
//  NWAtomSportViewController.m
//  News
//
//  Created by vijaythyagarajan on 24/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NWAtomSportViewController.h"

@interface NWAtomSportViewController ()
@property (weak, nonatomic) IBOutlet UIView *activityView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation NWAtomSportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.headerViewLabel.text = @"Sports";
    imageCache = [[NSCache alloc] init];
    _activityView.hidden = YES;
    
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _activityView.hidden = NO;
    [_activityIndicator startAnimating];
    BOOL sportRequestStatus =  [NAtomSportNewsRequest sharedInstance].getAllSportNews;
    if(sportRequestStatus){
        _activityView.hidden = YES;
        [_activityIndicator stopAnimating];
    }
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NAtomSportTableViewCell *sportCell = [tableView dequeueReusableCellWithIdentifier:@"SPORTTABLECELL"];
    if(sportCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SportTableViewCell" owner:self options:nil];
        sportCell = [nib objectAtIndex:0];
    }
    if([NAtomSportNewsRequest sharedInstance].sportNewsModel.count > 0) {
        sportCell.statusMessageLabel.text = [[NAtomSportNewsRequest sharedInstance].sportNewsModel.statusTitle objectAtIndex:indexPath.row];
        NSString* descrption =  [[NAtomSportNewsRequest sharedInstance].sportNewsModel.descrptionText objectAtIndex:indexPath.row];
        
        if ( ( ![descrption isEqual:[NSNull null]] ) && ( [descrption length] != 0 ) ) {
            sportCell.detailMessageLabel.text =descrption;
        }
        else {
            sportCell.detailMessageLabel.text = [[NAtomSportNewsRequest sharedInstance].sportNewsModel.statusTitle objectAtIndex:indexPath.row];
        }
        
        NSString *imageUrl = [[NAtomSportNewsRequest sharedInstance].sportNewsModel.DisplayImage objectAtIndex:indexPath.row];
        if(![imageUrl isKindOfClass:[NSNull null]]){
            UIImage *image = [imageCache objectForKey:imageUrl];
            
            if(image) {
                sportCell.displayImage.image = image;
            }
            else if ( ( ![imageUrl isEqual:[NSNull null]] ) && ( [imageUrl length] != 0 ) ) {
                
                UIImage *trendingImage = [ self publishImageForUrl:imageUrl];
                sportCell.displayImage.image =trendingImage ;
                CGImageRef cgref = [trendingImage CGImage];
                if(!(trendingImage == nil && cgref == NULL)){
                    [imageCache setObject:trendingImage forKey:[[NAtomSportNewsRequest sharedInstance].sportNewsModel.DisplayImage objectAtIndex:indexPath.row]];
                }
            }
        }
    else {
        
        self.tableView.hidden = YES;
        UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        noDataLabel.text = @"No data available";
        noDataLabel.textColor = [UIColor blackColor];
        noDataLabel.textAlignment= NSTextAlignmentCenter;
        self.tableView.backgroundView = noDataLabel;
        [self.view addSubview:self.tableView.backgroundView];
    }
    }
    return sportCell;
}



-(UIImage *)publishImageForUrl:(NSString *)imageURL {
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:imageURL]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
}
//
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [NAtomSportNewsRequest sharedInstance].sportNewsModel.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (IBAction)update:(id)sender {
    _activityView.hidden = NO;
    [_activityIndicator startAnimating];
    BOOL sportRequestStatus =  [NAtomSportNewsRequest sharedInstance].getAllSportNews;
    if(sportRequestStatus){
        _activityView.hidden = YES;
        [_activityIndicator stopAnimating];
        _activityView.hidden = YES;
    }
    [self.tableView reloadData];
}

@end
