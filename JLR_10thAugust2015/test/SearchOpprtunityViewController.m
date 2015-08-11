//
//  SearchOpprtunityViewController.m
//  NEEV
//
//  Created by Sachin Sharma on 20/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//
#import "ActivityViewController.h"
#import "ActivityListViewController.h"
#import "LoginViewController.h"
#import "ManageOpportunity.h"
#import "SearchOpprtunityViewController.h"
#import "searchopportynityresultviewcontroller.h"

@interface SearchOpprtunityViewController ()
{
     UIAlertView *alert;
}
@end

@implementation SearchOpprtunityViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
   

    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_strip.png"] forBarMetrics:UIBarMetricsDefault];
    
    // Navigation bar button on right side
    UIButton *btnInfo =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnInfo setImage:[UIImage imageNamed:@"icon_info.png"] forState:UIControlStateNormal];
    [btnInfo addTarget:self action:@selector(info_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnInfo setFrame:CGRectMake(-15, -5, 40, 40)];
    
    UIButton *btnLogout =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogout setImage:[UIImage imageNamed:@"icon_logout.png"] forState:UIControlStateNormal];
    [btnLogout addTarget:self action:@selector(logOut_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnLogout setFrame:CGRectMake(44, -5, 40, 40)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(10,10,90,40)];
    [rightBarButtonItems addSubview:btnInfo];
    [rightBarButtonItems addSubview:btnLogout];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    
 
    
// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.textDate.text=@"";
    self.texttoDate.text=@"";
    self.textPpl.text=@"";
    self.textsalesstages.text=@"";
   
    
    
    
    
    
    
    [self placeholdertext];

}



-(void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
}
-(void)logOut_btn
{
    alert = [[UIAlertView alloc] initWithTitle:@"NEEV"
                                       message:@"Do you want to Logout ?"
                                      delegate:self
                             cancelButtonTitle:@"No"
                             otherButtonTitles:@"Yes",nil];
    [alert show];
    
    
    NSLog(@"Home biscuit from Sanfrancisco");
}
// delegate mehod for uialertView

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        
        NSLog(@"David Miller");
    }
    if (buttonIndex==1) {
        NSLog(@"Glen Maxwell");
        LoginViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        //[self.navigationController pushViewController:secondViewController animated:YES];
        [self presentViewController:secondViewController animated:YES completion:nil ];
        //  [self.navigationController popToRootViewControllerAnimated:TRUE];
        // [self dismissViewControllerAnimated:YES completion:nil];
        //  [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
        //  [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)frmDatetext:(id)sender {
    
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(200, self.view.bounds.size.height-250-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(200, self.view.bounds.size.height-250, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor whiteColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)] ;
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] ;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
    
    
    
    
   
    
}



/////////////


- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
}

- (void)removeViews:(id)object {
    [[self.view viewWithTag:9] removeFromSuperview];
    [[self.view viewWithTag:10] removeFromSuperview];
    [[self.view viewWithTag:11] removeFromSuperview];
}

- (void)dismissDatePicker:(id)sender {
    CGRect toolbarTargetFrame = CGRectMake(0, self.view.bounds.size.height, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(0, self.view.bounds.size.height+44, 320, 216);
    [UIView beginAnimations:@"MoveOut" context:nil];
    [self.view viewWithTag:9].alpha = 0;
    [self.view viewWithTag:10].frame = datePickerTargetFrame;
    [self.view viewWithTag:11].frame = toolbarTargetFrame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeViews:)];
    [UIView commitAnimations];
}




- (IBAction)todatetext:(id)sender {
    
    if ([self.view viewWithTag:9]) {
        return;
    }
    CGRect toolbarTargetFrame = CGRectMake(200, self.view.bounds.size.height-250-44, 320, 44);
    CGRect datePickerTargetFrame = CGRectMake(200, self.view.bounds.size.height-250, 320, 216);
    
    UIView *darkView = [[UIView alloc] initWithFrame:self.view.bounds];
    darkView.alpha = 0;
    darkView.backgroundColor = [UIColor whiteColor];
    darkView.tag = 9;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDatePicker:)];
    [darkView addGestureRecognizer:tapGesture];
    [self.view addSubview:darkView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+44, 320, 216)];
    datePicker.tag = 10;
    [datePicker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)] ;
    toolBar.tag = 11;
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] ;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissDatePicker:)];
    [toolBar setItems:[NSArray arrayWithObjects:spacer, doneButton, nil]];
    [self.view addSubview:toolBar];
    
    [UIView beginAnimations:@"MoveIn" context:nil];
    toolBar.frame = toolbarTargetFrame;
    datePicker.frame = datePickerTargetFrame;
    darkView.alpha = 0.5;
    [UIView commitAnimations];
}

- (IBAction)salestext:(id)sender {
    
    
    
    
UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"A"
                                                             delegate:self
                                                    cancelButtonTitle:@"B"
                                               destructiveButtonTitle:@"D"
                                                    otherButtonTitles:@"C", @"F", @"E", nil];
    
    
   
        
        [actionSheet showInView:self.view];
        
}

- (IBAction)ppltext:(id)sender {

    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"A"
                                                             delegate:self
                                                    cancelButtonTitle:@"B"
                                               destructiveButtonTitle:@"D"
                                                    otherButtonTitles:@"C", @"F", @"E", nil];
    
    

    [actionSheet showInView:self.view];

}
- (IBAction)SearchBtn:(id)sender {
    
         searchopportynityresultviewcontroller* searchOpportunityResult_VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Search_Opportunity_Result_VCViewController"];
    
    [self.navigationController pushViewController:searchOpportunityResult_VC animated:YES];

}


-(void)placeholdertext{
    
    
    
    UIColor *color=[UIColor colorWithRed:131/255 green:131/255 blue:131/255 alpha:1];
    
    
    
    
    self.textsalesstages.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Sales Stages" attributes:@{NSForegroundColorAttributeName:color}];
    
    
    self.textPpl.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"Select PPL" attributes:@{NSForegroundColorAttributeName:color}];
    
    self.texttoDate.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select to  date" attributes:@{NSForegroundColorAttributeName:color}];
    self.textDate.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"Select from date " attributes:@{NSForegroundColorAttributeName:color}];
    
    
}



@end
