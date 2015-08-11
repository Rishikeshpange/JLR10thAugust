//
//  LoginViewController.h
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "positionlist.h"
#import "AppDelegate.h"
#import "DYAlertPickView.h"
#import "GlobalDetails.h"
#import <MessageUI/MessageUI.h>

@interface LoginViewController : UIViewController <UIActionSheetDelegate,DYAlertPickViewDataSource, DYAlertPickViewDelegate,MFMailComposeViewControllerDelegate>
{
 //position_LIST *positionlist;
   AppDelegate *appdelegate;
  GlobalDetails *userDetailsVal_;
    
}

- (IBAction)loginScreeb:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *LoginButton;

@property (weak, nonatomic) IBOutlet UIButton *remembermeButton;

@property (weak, nonatomic) IBOutlet UIImageView *rememberImage;


@property NSMutableArray *item;


- (IBAction)forgetPassword:(id)sender;

@end
