//
//  DetailViewController.m
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "dashboardTodaysActivity_Cell_VC.h"
#import "dasboard_Email_tableCell_VC.h"
#import "Dashboard_Leads_tablecell_VC.h"
#import "RequestDelegate.h"
#import "countdetails.h"
#import "TBXML.h"
#import "TodaysActivityCell.h"
#import "leadcell.h"
#import "GlobalDetails.h"
#import "UserDetails.h"
#import "Leads.h"



@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation DetailViewController
{
    UIAlertView *alert;
    NSMutableArray *optyidArray,*activityIdarray,*salesstageorderarray,*salesstageenquiryformarray,*salesstageallotment,*salesstagequotation,*salesstageretail,*salesstagelost,*acttestdrive,*actfollowup,*actretest,*others,*todaysactivity,*sevenActTestdrive,*sevenActFollowup,*SevenActRetest,*SevenOthers,*fifteenActTestdrive,*fifteenActFollowup,*fifteenActRetest,*fifteenOthers,*ThirtyActTestdrive,*ThirtyActFollowup,*ThirtyActRetest,*ThirtyOthers;
    NSMutableArray *activityType_PickerArr;
    int flagset;
    
}
@synthesize pieChartLeft = _pieChartCopy;

NSMutableArray *testArray;






NSMutableArray *testLeadsArray;
NSString *leadsState;
int *flag;
//*leadstage1,*leadstage2,*leadstage3,*leadstage4,*leadstage5,*leadstage6;
//float *counter;
int lead1,lead2,lead3,lead4,lead5,lead6,leadcount,actcount;

float perSumC0,perSumC1,perSumC2,perSumC3,perSumC4,perSumC4,perSumC5,perSumC6,actcounter,actperSum1,actperSum2,actperSum3,actperSu4,SevenActcounter,FifteenActcounter,ThirtyActcounter;

//  @synthesize pieChartLeft = _pieChartCopy;
@synthesize todaysActivities_TV,enquiryformLabel,QuotationLabel,salesorderLabel,allottmentLabel,retailLabel,lostLabel;

@synthesize Leads_TV,searchleadTxtfld;
@synthesize percentageLabel = _percentageLabel;

NSMutableArray *testLeadsArray,*hotleadArray,*warmleadArray,*coldleadArray,*AllLeadsArray;
NSString *leadsState;
#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.txt_SerchLead.text = @"All";
    
    
    //  leadsState = @"all";
    //   userDetailsVal_ = [GlobalDetails sharedmanager];
    
    hotleadArray = [[NSMutableArray alloc]init]; // Hot lead array //abhishek
    warmleadArray = [[NSMutableArray alloc]init]; // Warm lead array //abhishek
    coldleadArray = [[NSMutableArray alloc]init]; // cold lead array //abhishek
    AllLeadsArray = [[NSMutableArray alloc]init]; //for all lead //Abhishek
    activityType_PickerArr=[[NSMutableArray alloc]init];
    
    activityIdarray=[[NSMutableArray alloc]init];
    salesstageorderarray=[[NSMutableArray alloc]init];
    salesstageenquiryformarray=[[NSMutableArray alloc]init];
    salesstageallotment=[[NSMutableArray alloc]init];
    salesstagequotation=[[NSMutableArray alloc]init];
    salesstageretail=[[NSMutableArray alloc]init];
    salesstagelost=[[NSMutableArray alloc]init];
    actretest=[[NSMutableArray alloc]init];
    actfollowup=[[NSMutableArray alloc]init];
    acttestdrive=[[NSMutableArray alloc]init];
    others=[[NSMutableArray alloc]init];
    
    SevenActRetest=[[NSMutableArray alloc]init];
    sevenActFollowup=[[NSMutableArray alloc]init];
    sevenActTestdrive=[[NSMutableArray alloc]init];
    SevenOthers=[[NSMutableArray alloc]init];
    
    fifteenActRetest=[[NSMutableArray alloc]init];
    fifteenActFollowup=[[NSMutableArray alloc]init];
    fifteenActTestdrive=[[NSMutableArray alloc]init];
    fifteenOthers=[[NSMutableArray alloc]init];
    
    ThirtyActRetest=[[NSMutableArray alloc]init];
    ThirtyActFollowup=[[NSMutableArray alloc]init];
    ThirtyActTestdrive=[[NSMutableArray alloc]init];
    ThirtyOthers=[[NSMutableArray alloc]init];
    
    todaysactivity=[[NSMutableArray alloc]init];
    
    userDetailsVal_ = [GlobalDetails sharedmanager];
    
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
    
    self.originalCenter = self.view.center;
    searchleadTxtfld.delegate=self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
    NSLog(@"%@",app_delegate.Array1);
    //  NSLog(@"%@", [[app_delegate.Array1 objectAtIndex:0] valueForKey:@"positionName"]);
    
    
    [self callcount];
    
    
    //  [self callleadchart];
    
    
    [self.activitiestb setSeparatorColor:[UIColor colorWithRed:240/255.0 green:206/255.0 blue:205/255.0 alpha:0.04]];
    
    
    
    
    
    [self.leadTableview setSeparatorColor:[UIColor colorWithRed:240/255.0 green:206/255.0 blue:205/255.0 alpha:0.04]];
    
    
    [self.chartView.layer setBorderWidth:2.0];
    [self.chartView.layer setBorderColor:[UIColor grayColor].CGColor];
    
    self.mnthlyLeadButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:39/255.0 blue:46/255.0 alpha:1];
    
    self.mnthlyActivitiesButton.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    
    [self.mnthlyLeadButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.mnthlyLeadButton.layer setBorderWidth:2.0];
    [self.mnthlyLeadButton.layer setCornerRadius:0.0f];
    
    [self.mnthlyActivitiesButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.mnthlyActivitiesButton.layer setBorderWidth:2.0];
    [self.mnthlyActivitiesButton.layer setCornerRadius:0.0f];
    
    activityType_PickerArr=[[NSMutableArray alloc] initWithObjects:@"All",@"Hot",@"Warm",@"Cold",nil];
    
//    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day2.png"] forState:UIControlStateNormal];
//    
//    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day1.png"] forState:UIControlStateNormal];
//    
//    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day1.png"] forState:UIControlStateNormal];
    
    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day_1.png"] forState:UIControlStateNormal];
    
    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day1.png"] forState:UIControlStateNormal];
    
    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day2.png"] forState:UIControlStateNormal];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.activitiestb.dataSource = self;
    self.activitiestb.delegate = self;
    self.leadTableview.delegate =self;
    self.leadTableview.dataSource =self;
    
    
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(countfound:) name:@"countfound" object:nil];
    
    
    testArray = [NSMutableArray arrayWithObjects:@"test1",@"test 2",@"test 3",@"test 4",@"test 5",@"test 6", nil]; // For Activity Tab
    
    testLeadsArray = [NSMutableArray arrayWithObjects:@"test1",@"test 2",@"test 3",@"test 4",@"test 5", nil];
    
    //    self.todaysActivities_TV.dataSource = self;
    //    self.todaysActivities_TV.delegate = self;
    //    self.todaysActivities_TV.backgroundColor = [UIColor clearColor];
    //
    //    self.Leads_TV.dataSource = self;
    //    self.Leads_TV.delegate = self;
    
    
    
    
    
    
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [self.pieChartLeft reloadData];
    
    [self.pieChartRight reloadData];
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    
    
    
    
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"countfound" object:nil];//abhishek // For opportunity Count
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
    [self performSegueWithIdentifier:@"infoView" sender:self];

}
-(void)logOut_btn
{
    // flag=true;
    alert = [[UIAlertView alloc] initWithTitle:@"JLR"
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
        
    }
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{if (self.leadTableview )
{
    NSLog(@"Leads...!!! ");
    return 1;
}else{
    return 1 ;
}
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([tableView isEqual:self.activitiestb]) {
        
        //      return [activityIdarray count];
        return [todaysactivity count];
        
    }
    else if ([tableView isEqual:self.leadTableview])
    {
        
        if ([self.txt_SerchLead.text isEqualToString:@"Hot"]) {
            NSLog(@"\n\n hot..");
            return [hotleadArray count];
            
        }
        else if ([self.txt_SerchLead.text isEqualToString:@"Warm"]) {
            
            NSLog(@"\n\n Warm..");
            return [warmleadArray count];
        }
        else if ([self.txt_SerchLead.text isEqualToString:@"Cold"]) {
            
            NSLog(@"\n\n Cold..");
            return [coldleadArray count];
        }
        
        else if  ([self.txt_SerchLead.text isEqualToString:@"All"])       {
            NSLog(@"\n\n all Leads..");
            return [AllLeadsArray count];
        }
        
        return 0;
    }
    
    
    else{
        
        
        return 100;
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView isEqual:self.activitiestb]) {
        // Do something
        
        static NSString *MyIdentifier = @"MyIdentifier";
        
        //static NSString *CellIdentifier = @"namen";
        TodaysActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        // Create the cell if it could not be dequeued
        if (cell == nil)
            cell = [[TodaysActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        // Configure the cell...
        // cell.textLabel.text = @"My Text";
        cell.backgroundColor=[UIColor clearColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        //NSLog(@"%@",[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Name"]);
        //        cell.Name.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Name"];
        //        cell.ActivityStatus.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Status"];
        //        cell.PPL.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_PPL"];
        //        cell.PlannedTime.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Time"];
        
        cell.Name.text=[[todaysactivity objectAtIndex:indexPath.row] valueForKey:@"_Name"];
        cell.ActivityStatus.text=[[todaysactivity objectAtIndex:indexPath.row] valueForKey:@"_Status"];
        cell.PPL.text=[[todaysactivity objectAtIndex:indexPath.row] valueForKey:@"_PPL"];
        cell.PlannedTime.text=[[todaysactivity objectAtIndex:indexPath.row] valueForKey:@"_Time"];
        
        return cell;
    }
    
    else if([tableView isEqual:self.leadTableview])
    {
        
        NSLog(@"SECOND CELL");
        //NSLog(@"..........................%@",self.txt_SerchLead.text);
        
        static NSString *MyIdentifier = @"mylead";
        
        //static NSString *CellIdentifier = @"namen";
        leadcell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        leads = nil;
        
        if ([self.txt_SerchLead.text isEqualToString:@"Hot"]) {
            NSLog(@"\n\n hot..");
            
            leads = [hotleadArray objectAtIndex:indexPath.row];
            cell.imgCell.image=[UIImage imageNamed:@"lead_hot.png"];
            
        }
        else if ([self.txt_SerchLead.text isEqualToString:@"Warm"]) {
            
            NSLog(@"\n\n Warm..");
            leads = [warmleadArray objectAtIndex:indexPath.row];
            cell.imgCell.image=[UIImage imageNamed:@"lead_warm.png"];
            
            
        }
        else if ([self.txt_SerchLead.text isEqualToString:@"Cold"]) {
            
            NSLog(@"\n\n Cold..");
            leads = [coldleadArray objectAtIndex:indexPath.row];
            cell.imgCell.image=[UIImage imageNamed:@"lead_cold.png"];
            
        }
        
        else if ([self.txt_SerchLead.text isEqualToString:@"All"]){
            
            NSLog(@"Log check..");
            leads = [AllLeadsArray objectAtIndex:indexPath.row];
            if([leads.Quality isEqual:@"Hot"])
            {
                cell.imgCell.image=[UIImage imageNamed:@"lead_hot.png"];
                
            }else if([leads.Quality isEqual:@"Warm"])
            {
                cell.imgCell.image=[UIImage imageNamed:@"lead_warm.png"];
                
            }else if ([leads.Quality isEqual:@"Cold"])
            {
                cell.imgCell.image=[UIImage imageNamed:@"lead_cold.png"];
            }
        }
        
        
        
        //        leads = [hotleadArray objectAtIndex:indexPath.row];
        
        
        // Create the cell if it could not be dequeued
        if (cell == nil)
            cell = [[leadcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        
        //        // Configure the cell...
        //        // cell.textLabel.text = @"My Text";
        cell.backgroundColor=[UIColor clearColor];
        //        //NSLog(@"%@",[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Name"]);
        //        cell.Name.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Name"];
        //        cell.ActivityStatus.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Status"];
        //        cell.PPL.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_PPL"];
        //        cell.PlannedTime.text=[[activityIdarray objectAtIndex:indexPath.row] valueForKey:@"_Time"];
        
        
        
        NSString *myString = leads.CreatedDate;
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"MM/dd/yyyy HH:mm:ss";
        NSDate *yourDate = [dateFormatter dateFromString:myString];
        dateFormatter.dateFormat = @"dd-MMM-yyyy";
        NSLog(@"date...!!   %@",[dateFormatter stringFromDate:yourDate]);
        
        
        
        
        cell.Name.text = leads.FullName;
        
        cell.PPL.text =  leads.AppendString; //leads.SalesStage;
        
        //cell.PlannedTime.text = leads.CreatedDate;
        
        cell.PlannedTime.text = [dateFormatter stringFromDate:yourDate];
        
        //cell.ActivityStatus.text = leads.SalesStage;
        
        return cell;
    }
    
    
    
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
    
}

- (UIColor*)pieChart:(XYPieChart*)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
    
    NSLog(@"will select slice at index %d",index);
    
    if(flagset==1)
    {
        
        if(index==0)
        {
            
        }else if (index==1)
        {
            
        }else if (index==2)
        {
            
        }else if (index==3)
        {
            
        }else
        {
            
        }
        
        
    }else
    {
        if(index==0)
        {
        }else if (index==1)
        {
        }else if (index==2)
        {
        }else if (index==3)
        {
            
        }else if (index==4)
        {
            
        }else if (index==5)
        {
            
        }
        else
        {
            
        }
    }

}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}







- (IBAction)btnallleads:(id)sender {
    
    leadsState=@"all";
    
    NSLog(@"state %@",leadsState);
    
    self.allleads.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.openleads.backgroundColor=[UIColor clearColor];
    
    self.leadsassigned.backgroundColor=[UIColor clearColor];
    
    [Leads_TV reloadData];
}

- (IBAction)btnleadsassigned:(id)sender {
    
    
    leadsState=@"assigned";
    
    NSLog(@"state %@",leadsState);
    self.leadsassigned.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.openleads.backgroundColor=[UIColor clearColor];
    
    self.allleads.backgroundColor=[UIColor clearColor];
    
    [Leads_TV reloadData];
}

- (IBAction)btnopenleads:(id)sender {
    
    leadsState=@"open";
    
    
    NSLog(@"state %@",leadsState);
    
    
    
    self.openleads.backgroundColor=[UIColor colorWithRed:21/255.0 green:183/255.0 blue:174/255.0 alpha:1];
    
    self.allleads.backgroundColor=[UIColor clearColor];
    
    self.leadsassigned.backgroundColor=[UIColor clearColor];
    
    [Leads_TV  reloadData];
}



-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:searchleadTxtfld])
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.center = CGPointMake(self.view.center.x,80.0);
        [UIView commitAnimations];
    }
    
}
-(void)keyboardWillHide {
    
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.center =  CGPointMake(self.view.center.x, 385.0);
    [UIView commitAnimations];
    
}

- (void)keyboardDidShow:(NSNotification *)note
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.center = CGPointMake(self.view.center.x, 100.0);
    [UIView commitAnimations];
}

- (void)keyboardDidHide:(NSNotification *)note
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[note.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.center =  CGPointMake(self.view.center.x, self.originalCenter.y);
    [UIView commitAnimations];
    
}

- (IBAction)leadBtnaction:(id)sender {
    
    
    [self.mnthlyLeadButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.mnthlyLeadButton.layer setBorderWidth:2.0];
    [self.mnthlyLeadButton.layer setCornerRadius:0.0f];
    
    [self.mnthlyActivitiesButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.mnthlyActivitiesButton.layer setBorderWidth:2.0];
    [self.mnthlyActivitiesButton.layer setCornerRadius:0.0f];
    
    self.monthlyactivitychartView.hidden=YES;
    
    self.monthlyleadchartView.hidden=NO;
    
    
    self.mnthlyLeadButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:39/255.0 blue:46/255.0 alpha:1];
    
    self.mnthlyActivitiesButton.backgroundColor=[UIColor clearColor];
    
    [self callleadchart];
    
    
}

- (IBAction)activitiesBtnAction:(id)sender {
    
     flagset=1;
    
    self.monthlyleadchartView.hidden=YES;
    
    self.monthlyactivitychartView.hidden=NO;
    
    
    self.mnthlyActivitiesButton.backgroundColor=[UIColor colorWithRed:31/255.0 green:39/255.0 blue:46/255.0 alpha:1];
    
    self.mnthlyLeadButton.backgroundColor=[UIColor clearColor];
    
    [self.mnthlyActivitiesButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.mnthlyActivitiesButton.layer setBorderWidth:2.0];
    [self.mnthlyActivitiesButton.layer setCornerRadius:0.0f];
    
    
    [self.mnthlyLeadButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.mnthlyLeadButton.layer setBorderWidth:2.0];
    [self.mnthlyLeadButton.layer setCornerRadius:0.0f];
    
    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day_1.png"] forState:UIControlStateNormal];
    
    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day1.png"] forState:UIControlStateNormal];
    
    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day2.png"] forState:UIControlStateNormal];
    
    
    float z = [ThirtyActFollowup count];
    float x = [ThirtyActTestdrive count];
    
    float f = [ThirtyActRetest count];
    float g = [ThirtyOthers count];
    
    
    
    
    self.fallowLabel.text=[NSString stringWithFormat:@"%d",[ThirtyActFollowup count]];
    self.testdrivelabel.text=[NSString stringWithFormat:@"%d",[ThirtyActTestdrive count]];
    self.retestLabel.text=[NSString stringWithFormat:@"%d",[ThirtyActRetest count]];
    self.otherLabel.text=[NSString stringWithFormat:@"%d",[ThirtyOthers count]];
    
    
    actperSum1 =0;
    float devidesumC0=0;
    
    devidesumC0 = (float)z/ThirtyActcounter;
    NSLog(@".... %f",devidesumC0);
    
    actperSum1=devidesumC0*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum1);
    
    
    actperSum2 =0;
    float devidesumC1=0;
    
    devidesumC1 = (float)x/ThirtyActcounter;
    NSLog(@".... %f",devidesumC1);
    
    actperSum2=devidesumC1*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum2);
    
    
    
    actperSum3 =0;
    float devidesumC2=0;
    
    devidesumC2 = (float)f/ThirtyActcounter;
    NSLog(@".... %f",devidesumC2);
    
    actperSum3=devidesumC2*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum3);
    
    
    actperSu4 =0;
    float devidesumC3=0;
    
    devidesumC3 = (float)g/ThirtyActcounter;
    NSLog(@".... %f",devidesumC3);
    
    actperSu4=devidesumC3*100.0f;
    NSLog(@"percent calculation C0 %f",actperSu4);
    
    
    actcount = (int) ThirtyActcounter;
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",actcount];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * c0count =[NSNumber numberWithFloat:actperSum1];
    NSNumber * c1count = [NSNumber numberWithFloat:actperSum2];
    NSNumber * c1Acount =[NSNumber numberWithFloat:actperSum3];
    NSNumber * c2count = [NSNumber numberWithFloat:actperSu4];
    
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:YES];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:78/255.0 green:170/255.0 blue:150/255.0 alpha:1],
                       [UIColor colorWithRed:77/255.0 green:52/255.0 blue:176/255.0 alpha:1],
                       [UIColor colorWithRed:159/255.0 green:51/255.0 blue:174/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];
    
   /* float z = [actfollowup count];
    float x = [acttestdrive count];
    
    float f = [actretest count];
    float g = [others count];
    
    
    
    
    self.fallowLabel.text=[NSString stringWithFormat:@"%d",[actfollowup count]];
    self.testdrivelabel.text=[NSString stringWithFormat:@"%d",[acttestdrive count]];
    self.retestLabel.text=[NSString stringWithFormat:@"%d",[actretest count]];
    self.otherLabel.text=[NSString stringWithFormat:@"%d",[others count]];
    
    
    actperSum1 =0;
    float devidesumC0=0;
    
    devidesumC0 = (float)z/actcounter;
    NSLog(@".... %f",devidesumC0);
    
    actperSum1=devidesumC0*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum1);
    
    
    actperSum2 =0;
    float devidesumC1=0;
    
    devidesumC1 = (float)x/actcounter;
    NSLog(@".... %f",devidesumC1);
    
    actperSum2=devidesumC1*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum2);
    
    
    
    actperSum3 =0;
    float devidesumC2=0;
    
    devidesumC2 = (float)f/actcounter;
    NSLog(@".... %f",devidesumC2);
    
    actperSum3=devidesumC2*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum3);
    
    
    actperSu4 =0;
    float devidesumC3=0;
    
    devidesumC3 = (float)g/actcounter;
    NSLog(@".... %f",devidesumC3);
    
    actperSu4=devidesumC3*100.0f;
    NSLog(@"percent calculation C0 %f",actperSu4);
    
    
    actcount = (int) actcounter;
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",actcount];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * c0count =[NSNumber numberWithFloat:actperSum1];
    NSNumber * c1count = [NSNumber numberWithFloat:actperSum2];
    NSNumber * c1Acount =[NSNumber numberWithFloat:actperSum3];
    NSNumber * c2count = [NSNumber numberWithFloat:actperSu4];
    
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:YES];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:78/255.0 green:170/255.0 blue:150/255.0 alpha:1],
                       [UIColor colorWithRed:77/255.0 green:52/255.0 blue:176/255.0 alpha:1],
                       [UIColor colorWithRed:159/255.0 green:51/255.0 blue:174/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];*/
}
- (IBAction)sevendayBtn:(id)sender {
    
    //UIImage *buttonImage1 = [UIImage imageNamed:@"7_day2.png"];

    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day2.png"] forState:UIControlStateNormal];
    //[self.sevendayact setBackgroundImage:buttonImage1 forState:UIControlStateNormal];

    
    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day1@2x.png"] forState:UIControlStateNormal];
    
    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day1@2x.png"] forState:UIControlStateNormal];
    
    float z = [sevenActFollowup count];
    float x = [sevenActTestdrive count];
    
    float f = [SevenActRetest count];
    float g = [SevenOthers count];
    
    
    
    
    self.fallowLabel.text=[NSString stringWithFormat:@"%d",[sevenActFollowup count]];
    self.testdrivelabel.text=[NSString stringWithFormat:@"%d",[sevenActTestdrive count]];
    self.retestLabel.text=[NSString stringWithFormat:@"%d",[SevenActRetest count]];
    self.otherLabel.text=[NSString stringWithFormat:@"%d",[SevenOthers count]];
    
    
    actperSum1 =0;
    float devidesumC0=0;
    
    devidesumC0 = (float)z/SevenActcounter;
    NSLog(@".... %f",devidesumC0);
    
    actperSum1=devidesumC0*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum1);
    
    
    actperSum2 =0;
    float devidesumC1=0;
    
    devidesumC1 = (float)x/SevenActcounter;
    NSLog(@".... %f",devidesumC1);
    
    actperSum2=devidesumC1*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum2);
    
    
    
    actperSum3 =0;
    float devidesumC2=0;
    
    devidesumC2 = (float)f/SevenActcounter;
    NSLog(@".... %f",devidesumC2);
    
    actperSum3=devidesumC2*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum3);
    
    
    actperSu4 =0;
    float devidesumC3=0;
    
    devidesumC3 = (float)g/SevenActcounter;
    NSLog(@".... %f",devidesumC3);
    
    actperSu4=devidesumC3*100.0f;
    NSLog(@"percent calculation C0 %f",actperSu4);
    
    
    actcount = (int) SevenActcounter;
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",actcount];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * c0count =[NSNumber numberWithFloat:actperSum1];
    NSNumber * c1count = [NSNumber numberWithFloat:actperSum2];
    NSNumber * c1Acount =[NSNumber numberWithFloat:actperSum3];
    NSNumber * c2count = [NSNumber numberWithFloat:actperSu4];
    
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:NO];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:78/255.0 green:170/255.0 blue:150/255.0 alpha:1],
                       [UIColor colorWithRed:77/255.0 green:52/255.0 blue:176/255.0 alpha:1],
                       [UIColor colorWithRed:159/255.0 green:51/255.0 blue:174/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];
    
    
    
}
- (IBAction)fifteendayBtn:(id)sender {
    
    
    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day_1.png"] forState:UIControlStateNormal];
    
    //[self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day2.png"] forState:UIControlStateNormal];

    
    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day2@2x.png"] forState:UIControlStateNormal];
    
    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day1@2x.png"] forState:UIControlStateNormal];
    
    float z = [fifteenActFollowup count];
    float x = [fifteenActTestdrive count];
    
    float f = [fifteenActRetest count];
    float g = [fifteenOthers count];
    
    
    
    
    self.fallowLabel.text=[NSString stringWithFormat:@"%d",[fifteenActFollowup count]];
    self.testdrivelabel.text=[NSString stringWithFormat:@"%d",[fifteenActTestdrive count]];
    self.retestLabel.text=[NSString stringWithFormat:@"%d",[fifteenActRetest count]];
    self.otherLabel.text=[NSString stringWithFormat:@"%d",[fifteenOthers count]];
    
    
    
    actperSum1 =0;
    float devidesumC0=0;
    
    devidesumC0 = (float)z/FifteenActcounter;
    NSLog(@".... %f",devidesumC0);
    
    actperSum1=devidesumC0*100.0f;
    NSLog(@"percent calculation C0 for 15 %f",actperSum1);
    
    
    actperSum2 =0;
    float devidesumC1=0;
    
    devidesumC1 = (float)x/FifteenActcounter;
    NSLog(@".... %f",devidesumC1);
    
    actperSum2=devidesumC1*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum2);
    
    
    
    actperSum3 =0;
    float devidesumC2=0;
    
    devidesumC2 = (float)f/FifteenActcounter;
    NSLog(@".... %f",devidesumC2);
    
    actperSum3=devidesumC2*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum3);
    
    
    actperSu4 =0;
    float devidesumC3=0;
    
    devidesumC3 = (float)g/FifteenActcounter;
    NSLog(@".... %f",devidesumC3);
    
    actperSu4=devidesumC3*100.0f;
    NSLog(@"percent calculation C0 %f",actperSu4);
    
    
    actcount = (int) FifteenActcounter;
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",actcount];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * c0count =[NSNumber numberWithFloat:actperSum1];
    NSNumber * c1count = [NSNumber numberWithFloat:actperSum2];
    NSNumber * c1Acount =[NSNumber numberWithFloat:actperSum3];
    NSNumber * c2count = [NSNumber numberWithFloat:actperSu4];
    
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:YES];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:78/255.0 green:170/255.0 blue:150/255.0 alpha:1],
                       [UIColor colorWithRed:77/255.0 green:52/255.0 blue:176/255.0 alpha:1],
                       [UIColor colorWithRed:159/255.0 green:51/255.0 blue:174/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];
    
    
    
    
    
}
- (IBAction)thirtydayBtn:(id)sender {
    
    
    [self.sevendayact setBackgroundImage: [UIImage imageNamed:@"7_day_1.png"] forState:UIControlStateNormal];
    
    [self.fifteendayact setBackgroundImage: [UIImage imageNamed:@"15_day1@2x.png"] forState:UIControlStateNormal];
    
    [self.thirtydayact setBackgroundImage: [UIImage imageNamed:@"30_day2@2x.png"] forState:UIControlStateNormal];
    
    float z = [ThirtyActFollowup count];
    float x = [ThirtyActTestdrive count];
    
    float f = [ThirtyActRetest count];
    float g = [ThirtyOthers count];
    
    
    
    
    self.fallowLabel.text=[NSString stringWithFormat:@"%d",[ThirtyActFollowup count]];
    self.testdrivelabel.text=[NSString stringWithFormat:@"%d",[ThirtyActTestdrive count]];
    self.retestLabel.text=[NSString stringWithFormat:@"%d",[ThirtyActRetest count]];
    self.otherLabel.text=[NSString stringWithFormat:@"%d",[ThirtyOthers count]];
    
    
    actperSum1 =0;
    float devidesumC0=0;
    
    devidesumC0 = (float)z/ThirtyActcounter;
    NSLog(@".... %f",devidesumC0);
    
    actperSum1=devidesumC0*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum1);
    
    
    actperSum2 =0;
    float devidesumC1=0;
    
    devidesumC1 = (float)x/ThirtyActcounter;
    NSLog(@".... %f",devidesumC1);
    
    actperSum2=devidesumC1*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum2);
    
    
    
    actperSum3 =0;
    float devidesumC2=0;
    
    devidesumC2 = (float)f/ThirtyActcounter;
    NSLog(@".... %f",devidesumC2);
    
    actperSum3=devidesumC2*100.0f;
    NSLog(@"percent calculation C0 %f",actperSum3);
    
    
    actperSu4 =0;
    float devidesumC3=0;
    
    devidesumC3 = (float)g/ThirtyActcounter;
    NSLog(@".... %f",devidesumC3);
    
    actperSu4=devidesumC3*100.0f;
    NSLog(@"percent calculation C0 %f",actperSu4);
    
    
    actcount = (int) ThirtyActcounter;
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",actcount];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:4];
    
    NSNumber * c0count =[NSNumber numberWithFloat:actperSum1];
    NSNumber * c1count = [NSNumber numberWithFloat:actperSum2];
    NSNumber * c1Acount =[NSNumber numberWithFloat:actperSum3];
    NSNumber * c2count = [NSNumber numberWithFloat:actperSu4];
    
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:YES];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:78/255.0 green:170/255.0 blue:150/255.0 alpha:1],
                       [UIColor colorWithRed:77/255.0 green:52/255.0 blue:176/255.0 alpha:1],
                       [UIColor colorWithRed:159/255.0 green:51/255.0 blue:174/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];
}




-(void)callcount
{
    //    SJAIN_10102
    NSLog(@"\n\n ");//Abhishek
    
    
    [self  showAlert];
    
    
    NSString *envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:cus=\"http://siebel.com/customWf\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<soapenv:Header>"
                              @"<UsernameToken xmlns=\"http://siebel.com/webservices\">%@</UsernameToken>"
                              @"<PasswordText xmlns=\"http://siebel.com/webservices\">%@</PasswordText>"
                              @"</soapenv:Header>"
                              @"<soapenv:Body>"
                              @"<cus:Run soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<Process_spcInstance_spcId xsi:type=\"xsd:string\"/>"
                              @"<Object_spcId xsi:type=\"xsd:string\"/>"
                              @"<_XML_spcMsg xsi:type=\"jlr:ListOfJlrOpportunitySiebelIoTopElmt\" xmlns:jlr=\"http://www.siebel.com/xml/JLR%%20Opportunity%%20Siebel%%20IO\">"
                              @"<ListOfJlrOpportunitySiebelIo xsi:type=\"jlr:ListOfJlrOpportunitySiebelIo\">"
                              @"<Opportunity xsi:type=\"jlr:ArrayOfOpportunity\" soapenc:arrayType=\"jlr:Opportunity[]\"/>"
                              @"</ListOfJlrOpportunitySiebelIo>"
                              @"</_XML_spcMsg>"
                              @"<Siebel_spcOperation_spcObject_spcId xsi:type=\"xsd:string\"/>"
                              @"<Error_spcCode xsi:type=\"xsd:string\"/>"
                              @"<To_spcDt xsi:type=\"xsd:string\">10/08/2015</To_spcDt>"
                              @"<Postnid xsi:type=\"xsd:string\">%@</Postnid>"
                              @"<From_spcDt xsi:type=\"xsd:string\">07/08/2015</From_spcDt>"
                              @"<Error_spcMessage xsi:type=\"xsd:string\"/>"
                              @"</cus:Run>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",userDetailsVal_.USERNAME,userDetailsVal_.PASSWORD,userDetailsVal_.POSTN];
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    //  NSURL *theurl = [NSURL URLWithString:@" http://172.22.100.146:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    
    
    
    
    
    
    
    
    NSLog(@"URL IS %@",theurl);
    NSLog(@"REQUEST IS %@",envelopeText);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"countrequest"];
    
}







-(void)countfound:(NSNotification*)notification
{
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    [salesstageallotment removeAllObjects];
    [salesstageenquiryformarray removeAllObjects];
    [salesstagelost removeAllObjects];
    [salesstageorderarray removeAllObjects];
    [salesstagequotation removeAllObjects];
    [salesstageretail removeAllObjects];
    [acttestdrive removeAllObjects];
    [acttestdrive removeAllObjects];
    [actfollowup removeAllObjects];
    [others removeAllObjects];
    
    [sevenActTestdrive removeAllObjects];
    [SevenActRetest removeAllObjects];
    [sevenActFollowup removeAllObjects];
    [SevenOthers removeAllObjects];
    
    [fifteenActTestdrive removeAllObjects];
    [fifteenActRetest removeAllObjects];
    [fifteenActFollowup removeAllObjects];
    [fifteenOthers removeAllObjects];
    
    if ([response rangeOfString:@"SOAP-ENV:Fault"].location != NSNotFound )
    {
        // [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Something Went Wrong. Please try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
        app_delegate.Array1=[[NSMutableArray alloc]init];
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *soapBody = [TBXML childElementNamed:@"SOAP-ENV:Body" parentElement:tbxml.rootXMLElement];
        TBXMLElement *container = [TBXML childElementNamed:@"rpc:RunResponse" parentElement:soapBody];
        if(container)
        {
            
            TBXMLElement *SiebelMessage = [TBXML childElementNamed:@"_XML_spcMsg" parentElement:container];
            TBXMLElement *ListOfEmployeeInterface = [TBXML childElementNamed:@"ListOfJlrOpportunitySiebelIo" parentElement:SiebelMessage];
            TBXMLElement *opportunity = [TBXML childElementNamed:@"Opportunity" parentElement:ListOfEmployeeInterface];
            TBXMLElement *opportunity1 = [TBXML childElementNamed:@"Opportunity" parentElement:opportunity];
            if (opportunity1)
            {
                do {
                    
                    count=nil;
                    searchOpportunity_list=nil;
                    count=[[countdetails alloc] init];
                    
                    
                    //For Lead on dashboard //Abhishek
                    leads = nil;
                    leads = [[Leads alloc]init]; // leads Genration
                    
                    
                    
                    TBXMLElement *salesstage = [TBXML childElementNamed:@"SalesStage" parentElement:opportunity1];
                    count._salesstages=[TBXML textForElement:salesstage];
                    leads.SalesStage = [TBXML textForElement:salesstage];
                    
                    
                    TBXMLElement *Quality = [TBXML childElementNamed:@"Quality" parentElement:opportunity1];
                    NSString *quality_ = [TBXML textForElement:Quality]; //
                    leads.Quality = [TBXML textForElement:Quality]; // Leads sort //eg: cold,hot,warm, // Abhishek
                    
                    
                    TBXMLElement *CreatedDate = [TBXML childElementNamed:@"CreatedDate" parentElement:opportunity1];
                    NSString *CreatedDate_ = [TBXML textForElement:CreatedDate]; //
                    leads.CreatedDate = [TBXML textForElement:CreatedDate];
                    
                    NSLog(@"sales stages %@",count._salesstages);
                    
                    
                    if ([count._salesstages isEqualToString:@"Lost"]){
                        
                        
                        [salesstagelost addObject:count._salesstages];
                        
                        
                    }
                    else if ([count._salesstages isEqualToString:@"Retail"]){
                        
                        
                        [salesstageretail addObject:count._salesstages];
                        
                    }
                    else if ([count._salesstages isEqualToString:@"Enquiry Form"])
                    {
                        
                        [salesstageenquiryformarray addObject:count._salesstages];
                        
                    }
                    else if ([count._salesstages isEqualToString:@"Allotment"])
                    {
                        
                        [salesstageallotment addObject:count._salesstages];
                        
                    }
                    else if ([count._salesstages isEqualToString:@"Quotation"])
                    {
                        
                        [salesstagequotation addObject:count._salesstages];
                        
                    }
                    else
                    {
                        
                        [salesstageorderarray addObject:count._salesstages];
                        
                    }
                    
                    
                    
                    
                    //Sales Order
                    
                    
                    
                    
                    NSString *name=[[TBXML textForElement:[TBXML childElementNamed:@"TMIContactFirstName" parentElement:opportunity1]] stringByAppendingString:[NSString stringWithFormat:@" %@",
                                                                                                                                                                [TBXML textForElement:[TBXML childElementNamed:@"TMIContactLastName" parentElement:opportunity1]]]];
                    
                    NSString *ppLAppendString=[[TBXML textForElement:[TBXML childElementNamed:@"TMILOB" parentElement:opportunity1]] stringByAppendingString:[NSString stringWithFormat:@"/%@",[TBXML textForElement:[TBXML childElementNamed:@"TMIParentProductLine" parentElement:opportunity1]]]];
                    
                    
                    
                    count._Name=name;
                    leads.FullName = name;
                    
                    
                    
                    count._PPL=ppLAppendString;
                    NSLog(@"Name:%@",count._Name);
                    
                    leads.TMIParentProductLine = ppLAppendString;
                    
                    NSLog(@"%@ %@",[TBXML textForElement:[TBXML childElementNamed:@"TMIContactFirstName" parentElement:opportunity1]],[TBXML textForElement:[TBXML childElementNamed:@"TMIContactLastName" parentElement:opportunity1]]);
                    //searchOpportunity_list=[[countdetails alloc] init];
                    
                    //leads.AppendString = ppLAppendString;
                    
                    NSLog(@"\n _Test Qulaity.. %@ ",quality_); //Quality Test
                    
                    
                    NSString *ppLAppendString_ = [ppLAppendString stringByAppendingString:[NSString stringWithFormat:@" ,%@",leads.SalesStage]];
                    
                    NSLog(@"\n ppLAppendString_ %@ ",ppLAppendString_); //Quality Test
                    leads.AppendString = ppLAppendString_;
                   // [AllLeadsArray addObject:leads];
                    
                    if ([leads.Quality isEqualToString:@"Hot"]) {
                        
                        NSLog(@" HOT ... quality Lead ");
                        
                        hotleadcount_++;
                        totalLeadCount_ += totalLeadCount_;
                        
                        [hotleadArray addObject:leads];
                    }
                    else if ([leads.Quality isEqualToString:@"Warm"])
                    {
                        NSLog(@"HOT ... quality Lead");
                        warmleadcount_ ++;
                        totalLeadCount_ += totalLeadCount_;
                        [warmleadArray addObject:leads];
                        
                    }
                    else if ([leads.Quality isEqualToString:@"Cold"])
                    {
                        NSLog(@"HOT ... quality Lead ");
                        coldleadcount_ ++;
                        totalLeadCount_ += totalLeadCount_;
                        [coldleadArray addObject:leads];
                    }
                    
                    //adding all object to array //abhi
                    [AllLeadsArray addObject:leads];
                    
                    
                    //     UNCOMMENT FROM HERE
                    TBXMLElement *ListOfRelatedPosition = [TBXML childElementNamed:@"ListOfOpportunity_OpportunityProduct" parentElement:opportunity1];
                    TBXMLElement *RelatedPosition = [TBXML childElementNamed:@"Opportunity_OpportunityProduct" parentElement:ListOfRelatedPosition];
                    TBXMLElement *RelatedPosition1 = [TBXML childElementNamed:@"Opportunity_OpportunityProduct" parentElement:RelatedPosition];
                    
                    //                    if (RelatedPosition1) {
                    //
                    //                        do{
                    //
                    //                        }
                    //                        while ((RelatedPosition1 = RelatedPosition1->nextSibling)) ;
                    //                        {
                    //
                    //
                    //
                    //                        }
                    //
                    //                    }
                    
                    TBXMLElement *optyposition = [TBXML childElementNamed:@"ListOfOpportunity_Position" parentElement:opportunity1];
                    TBXMLElement *Position = [TBXML childElementNamed:@"Opportunity_Position" parentElement:optyposition];
                    TBXMLElement *Position1 = [TBXML childElementNamed:@"Opportunity_Position" parentElement:Position];
                    
                    
                    //                    if (Position1) {
                    //
                    //                        do{
                    //
                    //
                    //                        }
                    //                        while ((Position1 = Position1->nextSibling)) ;
                    //                        {
                    //                            \
                    //
                    //                        }
                    //
                    //                    }
                    
                    
                    
                    TBXMLElement *actionlist = [TBXML childElementNamed:@"ListOfAction" parentElement:opportunity1];
                    TBXMLElement *action = [TBXML childElementNamed:@"Action" parentElement:actionlist];
                    TBXMLElement *action1 = [TBXML childElementNamed:@"Action" parentElement:action];
                    
                    if (action1) {
                        
                        do{
                            
                            
                            
                            TBXMLElement *activityID = [TBXML childElementNamed:@"ActivityId" parentElement:action1];
                            count._ActivityId=[TBXML textForElement:activityID];
                            NSLog(@"ActivityId:%@",count._ActivityId);
                            
                            //><Type xsi:type="ns0:string">Follow-Up</Type>
                            
                            
                            TBXMLElement *ActivityType = [TBXML childElementNamed:@"Type" parentElement:action1];
                            count._ActivityType=[TBXML textForElement:ActivityType];
                            
                            NSLog(@"activity type %@",count._ActivityType);
                            
                            
                            //                            if ([count._ActivityType isEqualToString:@"Test Drive"]){
                            //
                            //
                            //                                [acttestdrive addObject:count._salesstages];
                            //
                            //
                            //                            }
                            //                            else if ([count._ActivityType isEqualToString:@"Follow Up"]){
                            //
                            //
                            //                                [actfollowup addObject:count._salesstages];
                            //
                            //                            }
                            //                            else if ([count._ActivityType isEqualToString:@"Re Test Drive"])
                            //                            {
                            //
                            //                                [actretest addObject:count._salesstages];
                            //
                            //                            }
                            //                            else
                            //                            {
                            //
                            //                                [others addObject:count._salesstages];
                            //
                            //                            }
                            //
                            
                            
                            
                            TBXMLElement *optyId = [TBXML childElementNamed:@"OpportunityId" parentElement:action1];
                            count._OpportunityId=[TBXML textForElement:optyId];
                            NSLog(@"OpportunityId:%@",count._OpportunityId);
                            TBXMLElement *Status = [TBXML childElementNamed:@"Status" parentElement:action1];
                            count._Status=[TBXML textForElement:Status];
                            NSLog(@"Status:%@",count._Status);
                            
                            
                            //Rishikesh code added for date sort
                            NSString *timeString=[TBXML textForElement:[TBXML childElementNamed:@"Planned" parentElement:action1]];
                            NSLog(@"timeString:%@",timeString);
                            //NSString *dateString = @"14/01/2015 01:12:34";
                            //                            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                            //                            // this is imporant - we set our input date format to match our input string
                            //                            // if format doesn't match you'll get nil from your string, so be careful
                            //                            [dateFormatter setDateFormat:@"MM/dd/yyyy HH:mm"];
                            //                            [dateFormatter setLocale:[NSLocale currentLocale]];
                            //                            NSDate *dateFromString = [[NSDate alloc] init];
                            //                            // voila!
                            //                            dateFromString = [dateFormatter dateFromString:timeString];
                            //                            NSLog(@"dateFromString:%@",dateFromString);
                            NSDateFormatter* myFormatter = [[NSDateFormatter alloc] init];
                            [myFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            [myFormatter setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
                            NSDate* myDate = [myFormatter dateFromString:timeString];
                            NSLog(@"%@", myDate);
                            
                            ///Testing
                            NSDate *const date = NSDate.date;
                            NSCalendar *const calendar123 = NSCalendar.currentCalendar;
                            NSCalendarUnit const preservedComponents = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay);
                            NSDateComponents *const components123 = [calendar123 components:preservedComponents fromDate:date];
                            NSDate *const normalizedDate = [calendar123 dateFromComponents:components123];
                            NSLog(@"normalizedDate:%@", normalizedDate);
                            ///Testing ends
                            
                            NSLog(@"%@",[NSDate date]);
                            
                            unsigned int flags1 = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
                            NSCalendar* calendar1 = [NSCalendar currentCalendar];
                            //
                            NSDateComponents* components0 = [calendar1 components:flags1 fromDate:myDate];
                            NSDateComponents* components2 = [calendar1 components:flags1 fromDate:[NSDate date]];
                            //
                            NSDate* dateOnly0 = [calendar1 dateFromComponents:components0];
                            NSDate* dateOnly2 = [calendar1 dateFromComponents:components2];
                            
                            NSDate* now = [NSDate date];
                            NSDateFormatter* df = [[NSDateFormatter alloc] init];
                            [df setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            //[df setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
                            NSString* myString = [df stringFromDate:now];
                            NSDate* myDate1 = [myFormatter dateFromString:myString];
                            NSLog(@"%@", myDate1);
                            
                            NSLog(@"%@",myString);
                            
                            if (dateOnly0 == dateOnly2)
                            {
                                NSLog(@"todays activity:%@",dateOnly0);
                                NSLog(@"todays activity:%@",dateOnly2);
                                //[todaysactivity addObject:count];
                            }
                            
                            //                            NSString *dateString = @"07/18/2015 09:28:49";
                            //                            NSDateFormatter* myFormatter2 = [[NSDateFormatter alloc] init];
                            //                            [myFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            //                            [myFormatter2 setDateFormat:@"MM/dd/yyyy HH:mm:ss"];
                            //                            NSDate* myDate2 = [myFormatter2 dateFromString:dateString];
                            //                            NSLog(@"%@", myDate2);
                            //
                            //
                            //
                            //
                            unsigned int flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
                            NSCalendar* calendar = [NSCalendar currentCalendar];
                            //
                            NSDateComponents* components = [calendar components:flags fromDate:myDate];
                            NSDateComponents* components1 = [calendar components:flags fromDate:myDate1];
                            //
                            NSDate* dateOnly = [calendar dateFromComponents:components];
                            NSDate* dateOnly1 = [calendar dateFromComponents:components1];
                            
                            if (dateOnly == dateOnly1)
                            {
                                NSLog(@"todays activity:%@",dateOnly1);
                                // [todaysactivity addObject:count];
                            }
                            //
                            NSLog(@"%@", dateOnly);
                            NSLog(@"%@",dateOnly1);
                            //                            //
                            //
                            NSArray* stringComponents1 = [timeString componentsSeparatedByString:@" "];
                            NSString *datenewString=[stringComponents1 objectAtIndex:0];
                            NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
                            [dateFormatter1 setLocale:[NSLocale currentLocale]];
                            
                            [dateFormatter1 setDateFormat:@"MM/dd/yyyy"];
                            NSDate *dateFromString1 = [[NSDate alloc] init];
                            // voila!
                            dateFromString1 = [dateFormatter1 dateFromString:datenewString];
                            //
                            NSDate *thisWeek  = [[NSDate date] dateByAddingTimeInterval: +518400.0];//last 7 days
                            NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:thisWeek];
                            [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            NSDate *thisWeekDate =[[NSCalendar currentCalendar] dateFromComponents:comps];
                            
                            
                            NSDate *sixmonths = [[NSDate date] dateByAddingTimeInterval:+15778445.76];//last 6 months
                            NSDateComponents* comps1 = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:sixmonths];
                            [comps1 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            NSDate *sixmonthsdate =[[NSCalendar currentCalendar] dateFromComponents:comps1];
                            
                            NSDate *TwoDays = [[NSDate date] dateByAddingTimeInterval:+518400.0];//next 7 days
                            //                            NSDateComponents* comps2 = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:TwoDays];
                            //                            [comps2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
                            //                            NSDate *TwoDaysdate =[[NSCalendar currentCalendar] dateFromComponents:comps2];
                            NSDateComponents* components5 = [calendar1 components:flags1 fromDate:TwoDays];
                            NSDate* TwoDaysdate = [calendar1 dateFromComponents:components5];
                            
                            NSDate *lastTwoDays = [[NSDate date] dateByAddingTimeInterval:+1209600];//last 2 days
                            NSDateComponents* components6 = [calendar1 components:flags1 fromDate:lastTwoDays];
                            NSDate* lastTwoDaysdate = [calendar1 dateFromComponents:components6];
                            
                            NSDate *lastThirtyDays = [[NSDate date] dateByAddingTimeInterval:+2505600];//last 30 days
                            NSDateComponents* components7 = [calendar1 components:flags1 fromDate:lastThirtyDays];
                            NSDate* lastThirtyDaysdate = [calendar1 dateFromComponents:components7];
                            
                            NSDate *sevendays =[[NSCalendar currentCalendar] dateFromComponents:comps];
                            NSDate *fifteendays  = [[NSDate date] dateByAddingTimeInterval: +1296000];//last 15 days date
                            
                            NSLog(@"lastWeek=%@",thisWeek);
                            NSLog(@"lastWeek=%@",thisWeekDate);
                            NSLog(@"lastWeek=%@",TwoDaysdate);
                            NSLog(@"lastWeek=%@",fifteendays);
                            NSLog(@"lastWeek=%@",sevendays);
                            NSLog(@"sixmonthsdate=%@",lastThirtyDays);
                            
                            if ([self date:dateOnly0 isBetweenDate:normalizedDate andDate:thisWeekDate]) //Condition for next 7 days
                            {
                                TBXMLElement *ActivityType = [TBXML childElementNamed:@"Type" parentElement:action1];
                                count._ActivityType=[TBXML textForElement:ActivityType];
                                
                                NSLog(@"activity type %@",count._ActivityType);
                                
                                
                                if ([count._ActivityType isEqualToString:@"Test Drive"]){
                                    
                                    
                                    [acttestdrive addObject:count._salesstages];
                                    [sevenActTestdrive addObject:count._salesstages];
                                    
                                    // [self.sevenDayArray addObject:count._salesstages];
                                    
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Follow-Up"]){
                                    
                                    
                                    [actfollowup addObject:count._salesstages];
                                    [sevenActFollowup addObject:count._salesstages];
                                    // [self.sevenDayArray  addObject:count._salesstages];
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Re-Test Drive"])
                                {
                                    
                                    [actretest addObject:count._salesstages];
                                    [SevenActRetest addObject:count._salesstages];
                                    //  [self.sevenDayArray addObject:count._salesstages];
                                    
                                }
                                else
                                {
                                    
                                    [others addObject:count._salesstages];
                                    [SevenOthers addObject:count._salesstages];
                                    // [self.sevenDayArray addObject:count._salesstages];
                                    
                                }
                                
                                
                                
                                
                            }
                            if ([self date:dateOnly0 isBetweenDate:normalizedDate andDate:lastTwoDaysdate])//Condition for next 15 days
                            {
                                TBXMLElement *ActivityType = [TBXML childElementNamed:@"Type" parentElement:action1];
                                count._ActivityType=[TBXML textForElement:ActivityType];
                                
                                NSLog(@"activity type %@",count._ActivityType);
                                
                                
                                if ([count._ActivityType isEqualToString:@"Test Drive"]){
                                    
                                    
                                    [fifteenActTestdrive addObject:count._salesstages];
                                    
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Follow-Up"]){
                                    
                                    
                                    [fifteenActFollowup addObject:count._salesstages];
                                    
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Re-Test Drive"])
                                {
                                    
                                    [fifteenActRetest addObject:count._salesstages];
                                    
                                }
                                else
                                {
                                    
                                    
                                    [fifteenOthers addObject:count._salesstages];
                                    
                                    
                                }
                                
                                
                                
                                
                            }
                            if ([self date:dateOnly0 isBetweenDate:normalizedDate andDate:lastThirtyDaysdate])//Condition for next 30 days
                            {
                                TBXMLElement *ActivityType = [TBXML childElementNamed:@"Type" parentElement:action1];
                                count._ActivityType=[TBXML textForElement:ActivityType];
                                
                                NSLog(@"activity type %@",count._ActivityType);
                                
                                
                                if ([count._ActivityType isEqualToString:@"Test Drive"]){
                                    
                                    
                                    [ThirtyActTestdrive addObject:count._salesstages];
                                    
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Follow-Up"]){
                                    
                                    
                                    [ThirtyActFollowup addObject:count._salesstages];
                                    
                                    
                                }
                                else if ([count._ActivityType isEqualToString:@"Re-Test Drive"])
                                {
                                    
                                    [ThirtyActRetest addObject:count._salesstages];
                                    
                                }
                                else
                                {
                                    
                                    
                                    [ThirtyOthers addObject:count._salesstages];
                                    
                                    
                                }
                                
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                            NSLog(@"dateFromString1:%@",dateFromString1);
                            
                            
                            NSString *newString=[stringComponents1 objectAtIndex:1];
                            NSString *truncatedString = [newString substringToIndex:[newString length]-3];
                            
                            count._Time=truncatedString;
                            
                            if (dateOnly0 == dateOnly2)
                            {
                                NSLog(@"todays activity:%@",dateOnly0);
                                [todaysactivity addObject:count];
                            }
                            else
                            {
                                [activityIdarray addObject:count];
                                NSLog(@"%d",[activityIdarray count]);
                            }
                            //Rishikesh code end
                            
                            //[activityIdarray addObject:count._ActivityId];
                            //[optyidArray addObject:count._OpportunityId];
                            
                            
                        }
                        while ((action1 = action1->nextSibling)) ;
                        {
                            
                            
                        }
                        //                        NSLog(@"tsetdrive count:%lu",(unsigned long)[acttestdrive count]);
                        //                        NSLog(@"follow up count:%lu",(unsigned long)[actfollowup count]);
                        //                        NSLog(@"retest count:%lu",(unsigned long)[actretest count]);
                        //                        NSLog(@"others count:%lu",(unsigned long)[others count]);
                    }

                    
                    TBXMLElement *contactlist = [TBXML childElementNamed:@"ListOfOpportunity_Contact" parentElement:opportunity1];
                    TBXMLElement *contactorglist = [TBXML childElementNamed:@"ListOfOpportunity_Organization" parentElement:opportunity1];
                    TBXMLElement *contactorg = [TBXML childElementNamed:@"Opportunity_Organization" parentElement:contactorglist];
                    TBXMLElement *contact = [TBXML childElementNamed:@"Opportunity_Organization" parentElement:contactorg];
                    
                    
                    // [optyidArray addObject:count._OpportunityId];
                    
                    
                    
                } while ((opportunity1 = opportunity1->nextSibling));
                
                NSLog(@"tsetdrive count:%lu",(unsigned long)[acttestdrive count]);
                NSLog(@"follow up count:%lu",(unsigned long)[actfollowup count]);
                NSLog(@"retest count:%lu",(unsigned long)[actretest count]);
                NSLog(@"others count:%lu",(unsigned long)[others count]);
                
                NSLog(@"others count:%lu",(unsigned long)[fifteenOthers count]);
                
                NSLog(@"actarray %@",activityIdarray);
                NSLog(@"actarray %lu",(unsigned long)[activityIdarray count]);
                
                [self.leadTableview reloadData];
                
                
                
                [self.activitiestb reloadData];
                
                
                NSLog(@"sales stage  %@",salesstageallotment);
                
                NSLog(@"sales stage  %@",salesstageenquiryformarray);
                
                NSLog(@"sales stage  %@",salesstagelost);
                
                NSLog(@"sales stage  %@",salesstageorderarray);
                
                NSLog(@"sales stage  %@",salesstagequotation);
                
                NSLog(@"sales stage  %@",salesstageretail);
                
                
                
                
                
                float  counter= salesstageretail.count + salesstagequotation.count + salesstageorderarray.count +salesstagelost.count + salesstageenquiryformarray.count +salesstageallotment.count;
                
                float a = [salesstageretail count];
                float b = [salesstagequotation count];
                
                float c = [salesstageorderarray count];
                float d = [salesstagelost count];
                
                float e = [salesstageenquiryformarray count];
                float f = [salesstageallotment count];
                
                
                
                counter = a+b+c+d+e+f;
                
                
                
                
                perSumC0 =0;
                float devidesumC0=0;
                
                devidesumC0 = (float)a/counter;
                NSLog(@".... %f",devidesumC0);
                
                perSumC0=devidesumC0*100.0f;
                NSLog(@"percent calculation C0 %f",perSumC0);
                
                
                
                
                perSumC1 =0;
                float devidesumC1=0;
                
                devidesumC1 = (float)b/counter;
                NSLog(@".... %f",devidesumC1);
                
                perSumC1=devidesumC1*100.0f;
                NSLog(@"percent calculation C1 %f",perSumC1);
                
                
                
                
                perSumC2 =0;
                float devidesumC2=0;
                
                devidesumC2 = (float)c/counter;
                NSLog(@".... %f",devidesumC2);
                
                perSumC2=devidesumC2*100.0f;
                NSLog(@"percent calculation C2 %f",perSumC2);
                
                
                
                
                
                perSumC3 =0;
                float devidesumC3=0;
                
                devidesumC3 = (float)d/counter;
                NSLog(@".... %f",devidesumC3);
                
                perSumC3=devidesumC3*100.0f;
                NSLog(@"percent calculation C3 %f",perSumC3);
                
                
                
                
                
                perSumC4 =0;
                float devidesumC4=0;
                
                devidesumC4 = (float)e/counter;
                NSLog(@".... %f",devidesumC4);
                
                perSumC4=devidesumC4*100.0f;
                NSLog(@"percent calculation C4 %f",perSumC4);
                
                
                
                
                
                perSumC5 =0;
                float devidesumC5=0;
                
                devidesumC5 = (float)f/counter;
                NSLog(@".... %f",devidesumC5);
                
                perSumC5=devidesumC5*100.0f;
                NSLog(@"percent calculation C5 %f",perSumC5);
                
                
                
                NSLog(@"count %f",counter);
                
                self.slices = [NSMutableArray arrayWithCapacity:6];
                
                NSNumber * c0count =[NSNumber numberWithFloat:perSumC0];
                NSNumber * c1count = [NSNumber numberWithFloat:perSumC1];
                NSNumber * c1Acount =[NSNumber numberWithFloat:perSumC2];
                NSNumber * c2count = [NSNumber numberWithFloat:perSumC3];
                NSNumber * c3count = [NSNumber numberWithFloat:perSumC4];
                NSNumber * c4count = [NSNumber numberWithFloat:perSumC5];
                
                _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,c3count,c4count,nil];
                
                
                
                
                
                
                
                
                
                
                
                [self.pieChartRight setDataSource:self];
                [self.pieChartRight setStartPieAngle:M_PI_2];
                [self.pieChartRight setAnimationSpeed:1.0];
                [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
                // [self.pieChartLeft setLabelRadius:160];
                [self.pieChartRight setShowPercentage:YES];
                //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
                [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
                [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
                [self.pieChartRight setUserInteractionEnabled:YES];
                [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
                [self.pieChartRight setLabelRadius:0];
                
                [[self.percentageLabel1 layer] setCornerRadius:61.0f];
                [[self.percentageLabel1 layer] setMasksToBounds:YES];
                self.sliceColors =[NSArray arrayWithObjects:
                                   [UIColor colorWithRed:183/255.0 green:170/255.0 blue:58/255.0 alpha:1],
                                   [UIColor colorWithRed:100/255.0 green:78/255.0 blue:183/255.0 alpha:1],
                                   [UIColor colorWithRed:176/255.0 green:78/255.0 blue:188/255.0 alpha:1],
                                   [UIColor colorWithRed:230/255.0 green:105/255.0 blue:105/255.0 alpha:1],
                                   [UIColor colorWithRed:78/255.0 green:183/255.0 blue:168/255.0 alpha:1],
                                   [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                                   nil];
                
                
                self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
                
                //  self.percentageLabel1.text=counter;
                [self.pieChartRight reloadData];
                
                
                
                leadcount = (int) counter;
                
                
                self.percentageLabel1.text=[NSString stringWithFormat:@"%d",leadcount];
                
                lead1 = (int) a;
                
                retailLabel.text=[NSString stringWithFormat:@"%d",lead1];
                
                
                lead2 = (int) b;
                
                QuotationLabel.text=[NSString stringWithFormat:@"%d",lead2];
                
                
                lead3 = (int) c;
                
                salesorderLabel.text=[NSString stringWithFormat:@"%d",lead3];
                
                
                lead4 = (int) d;
                
                lostLabel.text=[NSString stringWithFormat:@"%d",lead4];
                
                
                
                
                
                lead5 = (int) e;
                
                enquiryformLabel.text=[NSString stringWithFormat:@"%d",lead5];
                
                
                lead6 = (int) f;
                
                allottmentLabel.text=[NSString stringWithFormat:@"%d",lead6];
                
                
                
                actcounter = actfollowup.count +actretest.count +acttestdrive.count+others.count;
                SevenActcounter = sevenActFollowup.count +SevenActRetest.count +sevenActTestdrive.count+SevenOthers.count;
                FifteenActcounter = fifteenActFollowup.count +fifteenActRetest.count +fifteenActTestdrive.count+fifteenOthers.count;
                ThirtyActcounter = ThirtyActFollowup.count +ThirtyActRetest.count +ThirtyActTestdrive.count+ThirtyOthers.count;
                
                
                NSLog(@"count value %f",actcounter);
                NSLog(@"count value %f",SevenActcounter);
                NSLog(@"count value %f",FifteenActcounter);
                NSLog(@"count value %f",ThirtyActcounter);
                
                
                [self hideAlert];
                
                
            }
            
            
            
            
            
            
        }
        else
        {
            
            // [appdelegate hideAlert];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            
            
        }
    }
}
-(BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}


-(void)callleadchart
{
    
    
    
    
    
    self.percentageLabel1.text=[NSString stringWithFormat:@"%d",leadcount];
    
    // self.activitiestb.layer.borderWidth = 2;
    // self.activitiestb.layer.borderColor = [[UIColor grayColor] CGColor];
    
    
    
    
    self.slices = [NSMutableArray arrayWithCapacity:6];
    
    NSNumber * c0count =[NSNumber numberWithFloat:perSumC0];
    NSNumber * c1count = [NSNumber numberWithFloat:perSumC1];
    NSNumber * c1Acount =[NSNumber numberWithFloat:perSumC2];
    NSNumber * c2count = [NSNumber numberWithFloat:perSumC3];
    NSNumber * c3count = [NSNumber numberWithFloat:perSumC4];
    NSNumber * c4count = [NSNumber numberWithFloat:perSumC5];
    
    _slices= [NSMutableArray arrayWithObjects: c0count,c1count,c1Acount,c2count,c3count,c4count,nil];
    
    
    
    
    
    
    
    
    
    [self.pieChartRight setDataSource:self];
    [self.pieChartRight setStartPieAngle:M_PI_2];
    [self.pieChartRight setAnimationSpeed:1.0];
    [self.pieChartRight setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    // [self.pieChartLeft setLabelRadius:160];
    [self.pieChartRight setShowPercentage:YES];
    //[self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChartRight setPieBackgroundColor:[UIColor clearColor]];
    [self.pieChartRight setPieCenter:CGPointMake(120, 110)];
    [self.pieChartRight setUserInteractionEnabled:YES];
    [self.pieChartRight setLabelShadowColor:[UIColor clearColor]];
    [self.pieChartRight setLabelRadius:0];
    
    [[self.percentageLabel1 layer] setCornerRadius:61.0f];
    [[self.percentageLabel1 layer] setMasksToBounds:YES];
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:183/255.0 green:170/255.0 blue:58/255.0 alpha:1],
                       [UIColor colorWithRed:100/255.0 green:78/255.0 blue:183/255.0 alpha:1],
                       [UIColor colorWithRed:176/255.0 green:78/255.0 blue:188/255.0 alpha:1],
                       [UIColor colorWithRed:230/255.0 green:105/255.0 blue:105/255.0 alpha:1],
                       [UIColor colorWithRed:78/255.0 green:183/255.0 blue:168/255.0 alpha:1],
                       [UIColor colorWithRed:93/255.0 green:157/255.0 blue:0/255.0 alpha:1],
                       nil];
    
    
    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    [self.pieChartRight reloadData];
    
    
    
    
    retailLabel.text=[NSString stringWithFormat:@"%d",lead1];
    
    QuotationLabel.text=[NSString stringWithFormat:@"%d",lead2];
    
    salesorderLabel.text=[NSString stringWithFormat:@"%d",lead3];
    
    lostLabel.text=[NSString stringWithFormat:@"%d",lead4];
    
    enquiryformLabel.text=[NSString stringWithFormat:@"%d",lead5];
    
    allottmentLabel.text=[NSString stringWithFormat:@"%d",lead6];
    
    
    
    
    
    
    
    
    
}

-(void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
    
}
-(void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

-(void)statedropdown
{
    NSLog(@"\n\n state drop down..>!!! ");
    
    
}


-(void)createDropDown
{
    //    UIActionSheet *actionSheet = [[UIActionSheet alloc]
    //                                  initWithTitle:@""
    //                                  delegate:self
    //                                  cancelButtonTitle:nil
    //                                  destructiveButtonTitle:nil
    //                                  otherButtonTitles:nil];
    //
    //    // Add buttons one by one (e.g. in a loop from array etc...)
    //    for (int i=0; i<[hotleadArray count]; i++)
    //    {
    //        [actionSheet addButtonWithTitle:[hotleadArray objectAtIndex:i]];
    //    }
    //
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    //    {
    //        [actionSheet showFromRect:[self.txt_SerchLead frame] inView:self.DetailView animated:YES];
    //    }
    //    else
    //    {
    //        [actionSheet showInView:self.view];
    //    }
    //
    //
    //    [actionSheet showInView:self.view];
    
    /*
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Hot", @"Warm", @"Cold",@"All", nil];
    actionSheet.tag = 100;
    
    // ObjC Fast Enumeration
    for (NSString *title in activityType_PickerArr) {
        [actionSheet addButtonWithTitle:title];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        //   [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.view animated:YES];
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
        [actionSheet showInView:self.view];
        actionSheet.tag = 100;
        
        
    }
    else{
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 100;

     UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
     delegate:self
     cancelButtonTitle:nil
     destructiveButtonTitle:nil
     otherButtonTitles:@"Hot", @"Warm", @"Cold",@"All", nil];
     
     if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
     // In this case the device is an iPad.
     // [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
     [actionSheet showInView:self.view];
     
     
     
     }
     else{
     // In this case the device is an iPhone/iPod Touch.
     [actionSheet showInView:self.view];
     }
     
     actionSheet.tag = 100;
     */
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Hot",@"Warm", @"Cold",@"All", nil];
    
    [actionSheet showInView:self.txt_SerchLead];
    actionSheet.tag = 100;

    
}

#pragma mark - ActionSheet View Delegate Method
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.txt_SerchLead.text=@"";
    if (actionSheet.tag == 100)
    {
        if ( buttonIndex<0 ) //Abhishek
        {
            self.txt_SerchLead.text = @""; //Abhishek
            [self.leadTableview reloadData];
            
        }
        else//Abhishek
        {
           //NSString *txt_SerchLead_ = [actionSheet buttonTitleAtIndex:buttonIndex];
           self.txt_SerchLead.text = [actionSheet buttonTitleAtIndex:buttonIndex];
            if(buttonIndex == actionSheet.cancelButtonIndex)
            {
                NSLog(@"ek..");
                return;
            }else{
                NSLog(@"Button index %ld",(long)buttonIndex);
                //self.txt_SerchLead.text = NSLocalizedString([activityType_PickerArr objectAtIndex:buttonIndex],@"");
                NSLog(@"Text In Filed :%@",self.txt_SerchLead.text);
                
                if ([self.txt_SerchLead.text isEqualToString:@"Hot"]) {
                    
                    NSLog(@"\n\n hot..inside");
                    [self.leadTableview reloadData];
                }
                else if ([self.txt_SerchLead.text isEqualToString:@"Warm"]) {
                    
                    NSLog(@"\n\n Warm..inside");
                    [self.leadTableview reloadData];
                }
                
                else if ([self.txt_SerchLead.text isEqualToString:@"Cold"]) {
                    
                    NSLog(@"\n\n Cold..inside");
                    [self.leadTableview reloadData];
                }
                else if ([self.txt_SerchLead.text isEqualToString:@"All"])
                {
                    NSLog(@"\n\n All..");
                    [self.leadTableview reloadData];
                }

                
            }
            //self.txt_SerchLead.text = txt_SerchLead_;
            //self.txt_SerchLead.text =
        }
    }
}
- (IBAction)leadselectbutton:(id)sender {
    
    
    [self createDropDown];
}
@end
