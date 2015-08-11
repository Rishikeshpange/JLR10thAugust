//
//  TestDrvieViewController.h
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "GlobalDetails.h"
@interface CreateOpportunityViewController : UIViewController<UISplitViewControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate>

///Common outlets
{
GlobalDetails *userDetailsVal_;
}
@property (assign) CGPoint originalCenter;
@property (weak, nonatomic) IBOutlet UIImageView *createContactImage;

@property (weak, nonatomic) IBOutlet UIImageView *contactaccountLinkerImage;


@property (weak, nonatomic) IBOutlet UIImageView *createaccountImage;

@property (weak, nonatomic) IBOutlet UIImageView *accountleadlinkerimage;



@property (weak, nonatomic) IBOutlet UIImageView *createleadimage;




- (IBAction)BUTTONTYPE:(id)sender;



//////CREATE CONTACT

@property (weak, nonatomic) IBOutlet UIView *Ceatecontactview;




@property (weak, nonatomic) IBOutlet UIButton *createbuttonoutlet;

- (IBAction)createbuttonaction:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *firstnametxtfld;

@property (weak, nonatomic) IBOutlet UITextField *mobilenumbertxtfield;

@property (weak, nonatomic) IBOutlet UITextField *txtfldlastname;


@property (weak, nonatomic) IBOutlet UITextField *txtfldemailid;











////CREATE ACCOUNT////


@property (weak, nonatomic) IBOutlet UIView *createaccount;



@property (weak, nonatomic) IBOutlet UITextField *txtfldName;



@property (weak, nonatomic) IBOutlet UITextField *txtfldAccountType;


@property (weak, nonatomic) IBOutlet UITextField *txtfldmobilenumber;


@property (weak, nonatomic) IBOutlet UITextField *txtfldsite;


@property (weak, nonatomic) IBOutlet UIButton *btncreateaccount;


- (IBAction)createaccountaction:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnskip;

- (IBAction)skipaction:(id)sender;





//////////////////Create Lead Fields



@property (weak, nonatomic) IBOutlet UIView *createLeadview;



@property (weak, nonatomic) IBOutlet UITextField *txtfldcustomerType;

- (IBAction)btncustomerType:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletcustomerType;



@property (weak, nonatomic) IBOutlet UITextField *txtfldfinancierName;

- (IBAction)btnfinancierName:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletfinancierName;




@property (weak, nonatomic) IBOutlet UITextField *txtfldppl;

- (IBAction)btnppl:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletppl;






@property (weak, nonatomic) IBOutlet UITextField *txtfldapp;

- (IBAction)btnapp:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletapp;






@property (weak, nonatomic) IBOutlet UITextField *txtfldsource;

- (IBAction)btnsource:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletasource;




@property (weak, nonatomic) IBOutlet UITextField *txtfldlob;

- (IBAction)btnlob:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletlob;



@property (weak, nonatomic) IBOutlet UITextField *txtfldpl;

- (IBAction)btnpl:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *outletpl;
@property (weak, nonatomic) IBOutlet UIButton *outletcreateLead;
- (IBAction)btncreatelead:(id)sender;



@property(strong,nonatomic)NSMutableArray *accountstatus;

@end
