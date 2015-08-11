//
//  CreateContactViewController.h
//  NEEV
//
//  Created by admin on 05/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *editView;

- (IBAction)btnEdit:(id)sender;

- (IBAction)btnCancel:(id)sender;

- (IBAction)btnCorrect:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnEdit;

@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

@property (weak, nonatomic) IBOutlet UIButton *btnCorrect;

// TextFields
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;

@property (weak, nonatomic) IBOutlet UITextField *txtLastName;

@property (weak, nonatomic) IBOutlet UITextField *txtMobileno;

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;



@property (weak, nonatomic) IBOutlet UITextField *txtMobileNumberFirst;

@property (weak, nonatomic) IBOutlet UITextField *txtSearchFirstname;

@property (weak, nonatomic) IBOutlet UITextField *txtSearchLastname;

- (IBAction)btnSearch:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnSearch;


@end
