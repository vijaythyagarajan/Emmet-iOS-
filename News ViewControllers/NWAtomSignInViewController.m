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

#define form_Default_height 400
#define form_compact_height 325
@interface NWAtomSignInViewController ()
@property (weak, nonatomic) IBOutlet UIView *reEnterPasswordView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *formViewHeightLayoutConstrait;
@property (weak, nonatomic) IBOutlet UIButton *forgotPassword;

@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property BOOL showPassword;
@property (weak, nonatomic) IBOutlet UIView *signInView;
@end

@implementation NWAtomSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailAddress.delegate = self;
    self.passcode.delegate = self;
    
    self.reEnterPasswordView.hidden = YES;
    _formViewHeightLayoutConstrait.constant = form_compact_height;
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
    _showPassword = NO;
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
//    if(!([_emailAddress.text isEqualToString:@""] && [_passcode.text isEqualToString:@""])){
//    [[FIRAuth auth] signInWithEmail:_emailAddress.text password:_passcode.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
//        if(user){
//            NSLog(@"LoginSuccessful");
//            NSMutableDictionary *userDictionary = [NSMutableDictionary new];
//            [userDictionary setObject:self.emailAddress.text forKey:@"AtomUserName"];
//            [userDictionary setObject:self.passcode.text forKey:@"AtomPasscode"];
//            [[NSUserDefaults standardUserDefaults] setObject:userDictionary forKey:@"userKey"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            [self afterSignIn];
//        }
//        else if (error) {
//            NSLog(@"FAILED TO SIGN IN ERROR: %@",error);
//        }}];
//    }
    [self afterSignIn];
}

#pragma textField delegateMethods
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.alpha = 1.0;
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
- (IBAction)showPassword:(id)sender {
    _showPassword = ! _showPassword;
    if(_showPassword) {
        [_passcode setSecureTextEntry:NO];
        UIImage *open_eye = [UIImage imageNamed:@"eye_open"];
        [_showPasscode setImage:open_eye forState:UIControlStateNormal];
    }
    else {
        [_passcode setSecureTextEntry:YES];
        UIImage *open_close = [UIImage imageNamed:@"eye_close"];
        [_showPasscode setImage:open_close forState:UIControlStateNormal];
    }
}
- (IBAction)signInOption:(id)sender {
    [UIView animateWithDuration:0.1 animations:^{
        self.reEnterPasswordView.hidden = YES;
        self.showPasscode.hidden = NO;
        self.forgotPassword.hidden = NO;
        self.formViewHeightLayoutConstrait.constant = form_compact_height;
        self.signUpView.backgroundColor = [UIColor clearColor];
        self.signInView.backgroundColor = [UIColor whiteColor];
    }];
    
}

- (IBAction)signUpOption:(id)sender {
    [UIView animateWithDuration:0.1 animations:^{
        self.reEnterPasswordView.hidden = NO;
        self.showPasscode.hidden = YES;
        self.forgotPassword.hidden = YES;
        self.formViewHeightLayoutConstrait.constant = form_Default_height;
        self.signInView.backgroundColor = [UIColor clearColor];
        self.signUpView.backgroundColor = [UIColor whiteColor];
    }];
}
@end
