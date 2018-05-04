//
//  NWAtomTrendingViewController.m
//  News
//
//  Created by vijaythyagarajan on 23/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NWAtomTrendingViewController.h"
#import "NWAtomTrendingTableViewCell.h"
#import "NAtomTrendingNewsRequest.h"
#import "NAtomSportNewsRequest.h"
#import "TrendingNewsModel.h"
#import "NAtomYoutubeRequest.h"
#import "YTPlayerView.h"
#import "DetailView.h"

@interface NWAtomTrendingViewController ()
@property (weak, nonatomic) IBOutlet UITabBarItem *trending;
@property  BOOL requestStatus;
@property NSMutableDictionary *articlesRead;

@end

@implementation NWAtomTrendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _articlesRead = [NSMutableDictionary new];
    imageCache = [[NSCache alloc] init];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated {
   
    [super viewWillAppear:animated];
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    [self updateBadgeCount];
}
-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
    
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.activityIndicator startAnimating];
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.activityIndicator stopAnimating];
}
-(void) updateBadgeCount {
    
    NSDictionary *allArticles = [NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.articlesKey;
    NSInteger unReadCount = [allArticles count] - [_articlesRead count];
    if(unReadCount > 0){
        _trending.badgeValue = [NSString stringWithFormat:@"%ld",unReadCount];
    }
    else {
        _trending.badgeValue = 0;
        _trending.badgeColor = [UIColor clearColor];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TrendingCell";
    NWAtomTrendingTableViewCell *tableViewCell = (NWAtomTrendingTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(tableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TrendingNewsTableViewCell" owner:self options:nil];
        tableViewCell = [nib objectAtIndex:0];
    }
    
    if([NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.articlesKey.count > 0) {
        tableViewCell.statusText.text = [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.statusText objectAtIndex:indexPath.row];
        NSString* descrption =  [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.descriptionText objectAtIndex:indexPath.row];
        
        if ( ( ![descrption isEqual:[NSNull null]] ) && ( [descrption length] != 0 ) ) {
            tableViewCell.descriptionText.text =descrption;
        }
        else {
            tableViewCell.descriptionText.text = [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.statusText objectAtIndex:indexPath.row];
        }
        
        tableViewCell.dateAndTime.text =[TrendingNewsModel timeAndDate:[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.dateAndTime objectAtIndex:indexPath.row]];
        tableViewCell.AuthorName.text = [NSString stringWithFormat:@"Authored by %@",[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.authorName objectAtIndex:indexPath.row]];
        
        NSString *imageUrl = [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.trendingImage objectAtIndex:indexPath.row];
        if(![imageUrl isKindOfClass:[NSNull null]]){
        UIImage *image = [imageCache objectForKey:imageUrl];
        
        if(image) {
            tableViewCell.trendingImage.image = image;
        }
        else if ( ( ![imageUrl isEqual:[NSNull null]] ) && ( [imageUrl length] != 0 ) ) {
            
            UIImage *trendingImage = [ self publishImageForUrl:imageUrl];
            tableViewCell.trendingImage.image =trendingImage ;
            CGImageRef cgref = [trendingImage CGImage];
            if(!(trendingImage == nil && cgref == NULL)){
            [imageCache setObject:trendingImage forKey:[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.trendingImage objectAtIndex:indexPath.row]];
            }
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
    
    return tableViewCell;
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self createDetailViewForArticleIndex:indexPath.row];

}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return  [NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 375;
}

-(UIImage *)publishImageForUrl:(NSString *)imageURL {
    NSData* imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:imageURL]];
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    return image;
}

-(void) createDetailViewForArticleIndex:(NSInteger) index{
    
    [self.view addSubview:[Utils createBlurEffectViewForFrame:self.view.frame]];
    
    CGPoint centerScreen = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    
    DetailView *articleDetailView=[[DetailView alloc]initWithFrame:CGRectMake(centerScreen.x,centerScreen.y,self.view.frame.size.width,500)];
    articleDetailView.delegate = self;
    articleDetailView.playerView.delegate = self;
    articleDetailView.center = centerScreen;
    articleDetailView.layer.cornerRadius = 10.0f;
    [articleDetailView.layer setMasksToBounds:YES];
    [articleDetailView setBackgroundColor:[UIColor clearColor]];
    articleDetailView.tag = 1111;
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        articleDetailView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            articleDetailView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                articleDetailView.transform = CGAffineTransformIdentity;
                
                [self.view addSubview:articleDetailView];
               
                articleDetailView.authorName.text = [NSString stringWithFormat:@"Authored by %@",[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.authorName objectAtIndex:index]];
                [self->_articlesRead setValue:[NSString stringWithFormat:@"%ld",index] forKey:[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.statusText objectAtIndex:index]];
                NSString* descrption =  [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.descriptionText objectAtIndex:index];
                
                if ( ( ![descrption isEqual:[NSNull null]] ) && ( [descrption length] != 0 ) ) {
                    articleDetailView.detailNewsText.text =descrption;
                }
                articleDetailView.newsScourceUrl.text = [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.url objectAtIndex:index];
                [[NAtomYoutubeRequest sharedInstance] getVideoIdForText:[[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.statusText objectAtIndex:index]];

                if( !([NAtomYoutubeRequest sharedInstance].youtubeModel.videoId == nil)) {
                    articleDetailView.NewsImageView.hidden = YES;
                    NSDictionary *playerVars = @{
                                                 @"playsinline" : @1,
                                                 };
                    [UIView animateWithDuration:1.0 animations:^{
                        NSString *videoId = [NAtomYoutubeRequest sharedInstance].youtubeModel.videoId ;
                        [articleDetailView.playerView loadWithVideoId:videoId playerVars:playerVars];

                    }];
                }
                else{
                NSString *imageUrl = [[NAtomTrendingNewsRequest sharedInstance].trendingNewsModel.trendingImage objectAtIndex:index];
                
                if ( ( ![imageUrl isEqual:[NSNull null]] ) && ( [imageUrl length] != 0 ) ) {
                        articleDetailView.NewsImageView.image =[ self publishImageForUrl:imageUrl];
                    
                }
                }
            }];
        }];
    }];;
    
}

#pragma DetailView Delegate Method
- (BOOL)closeButtonDidPressed {
    [self updateBadgeCount];
    UIView *detailView = [self.view viewWithTag:1111];
    UIView *visualEffectView = [self.view viewWithTag:222];
    if([detailView isKindOfClass:[detailView class]]) {
        [UIView animateWithDuration:0.5 delay:0.5 options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             detailView.alpha = 0;
                             visualEffectView.alpha =0;
                         }
                         completion:^(BOOL finished) {
                             [detailView removeFromSuperview];
                             [visualEffectView removeFromSuperview];
                         }];
        return YES;
    }
    return NO;
}

-(void) didArticleofIndexRead:(NSInteger)index {
    
}

-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView {
    [playerView playVideo];
}
@end
