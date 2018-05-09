//
//  NWAtomSignInViewController.h
//  News
//
//  Created by vijaythyagarajan on 27/04/18.
//  Copyright © 2018 vijaythyagarajan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface NWAtomSignInViewController : UIViewController <UITextFieldDelegate,UIGestureRecognizerDelegate>
- (IBAction)SignInButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *visualEffectView;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *passcode;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIView *activityView;
- (IBAction)showPassword:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showPasscode;
- (IBAction)signInOption:(id)sender;
- (IBAction)signUpOption:(id)sender;

@end
