//
//  NWAtomSignInViewController.m
//  News
//
//  Created by vijaythyagarajan on 27/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import "NWAtomSignInViewController.h"
#import "NAtomTrendingNewsRequest.h"
#import "NWAtomTrendingViewController.h"
#import "NAtomSportNewsRequest.h"
@interface NWAtomSignInViewController ()

@end

@implementation NWAtomSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailAddress.delegate = self;
    self.passcode.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    _activityIndicator.hidden = YES;
    _activityView.hidden = YES;
    NSString *userDict = [[NSUserDefaults standardUserDefaults] stringForKey:@"userKey"];
    NSString *userName = [userDict valueForKey:@"AtomUserName"];
    if(userName) {
        [self afterSignIn];
    }
}
#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"TABBARCONTROLLER"]) {
        UITabBarController *tabBar = (UITabBarController *)segue.destinationViewController;
        NWAtomTrendingViewController *trendingVC = (NWAtomTrendingViewController *)[tabBar.viewControllers objectAtIndex:0];
    }
}

-(void) afterSignIn {
    _activityView.hidden = NO;
    _activityIndicator.hidden = NO;
    [_activityIndicator startAnimating];
    BOOL trendingNewsRequest = [[NAtomTrendingNewsRequest sharedInstance] getAllNews];
    if(trendingNewsRequest) {
        NSLog(@"Request Successful");
        [self performSegueWithIdentifier:@"TABBARCONTROLLER" sender:nil];
    }
}

- (IBAction)SignInButton:(id)sender {
    if(!([_emailAddress.text isEqualToString:@""] && [_passcode.text isEqualToString:@""])){
    [[FIRAuth auth] signInWithEmail:_emailAddress.text password:_passcode.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if(user){
            NSLog(@"LoginSuccessful");
            NSMutableDictionary *userDictionary = [NSMutableDictionary new];
            [userDictionary setObject:self.emailAddress.text forKey:@"AtomUserName"];
            [userDictionary setObject:self.passcode.text forKey:@"AtomPasscode"];
            [[NSUserDefaults standardUserDefaults] setObject:userDictionary forKey:@"userKey"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self afterSignIn];
        }
        else if (error) {
            NSLog(@"FAILED TO SIGN IN ERROR: %@",error);
        }}];
    }
}

#pragma textField delegateMethods
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [self.view endEditing:YES];
    return YES;
}

#pragma Keyboard notifcation methods
- (void)keyboardDidShow:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
    }];
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.1 animations:^{
    }];
}

-(void) dismissKeyBoard {
    [self.view endEditing:YES];
}
@end
