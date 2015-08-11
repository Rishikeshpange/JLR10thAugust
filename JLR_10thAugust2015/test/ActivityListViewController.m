//
//  ActivityListViewController.m
//  NEEV
//
//  Created by admin on 17/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "ActivityListViewController.h"
#import "dashboardTodaysActivity_Cell_VC.h"
#import "dasboard_Email_tableCell_VC.h"
#import "Dashboard_Leads_tablecell_VC.h"
#import "LoginViewController.h"
@interface ActivityListViewController ()
{
    UIAlertView *alert;

    
  
}
@end

@implementation ActivityListViewController
{
    //int a;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_strip.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    //Search button
    
    _searchButton.layer.cornerRadius = 35; // this value vary as per your desire
    _searchButton.clipsToBounds = YES;
    
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
    
    
    [self.tableView setSeparatorColor:[UIColor colorWithRed:(86/255.0) green:(107/255.0) blue:(112/255.0) alpha:1]];

    //a=15;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
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
        //  [self.navigationController popToRootViewControllerAnimated:TRUE];
        // [self dismissViewControllerAnimated:YES completion:nil];
        //  [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
        //  [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0 || indexPath.row == ([indexPath length]-1))
    {
        cell.layer.cornerRadius = 0;
        
    }
    cell.layer.cornerRadius = 0;
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    // [cell setSelectedBackgroundView:bgColorView];
    // [bgColorView release];
    
    cell.backgroundColor = [UIColor colorWithRed:(30/255.0) green:(39/255.0) blue:(46/255.0) alpha:1] ;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.textLabel.textColor=[UIColor colorWithRed:(216/255.0) green:(218/255.0) blue:(221/255.0) alpha:1];
    //  cell.textLabel.highlightedTextColor = [UIColor colorWithRed:(0/255.0) green:(13/255.0) blue:(65/255.0) alpha:1];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    //  cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:(178/255.0) green:(183/255.0) blue:(63/255.0) alpha:1];
    
    
    

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.layer.cornerRadius = 10;
        
    }
    //cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    // cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    
    return cell;*/
    
    if (tableView == self.tableView) {
        
        
        
        static NSString *MyIdentifier = @"activitiesidentifier";
        
        dasboard_Email_tableCell_VC *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[dasboard_Email_tableCell_VC  alloc] initWithStyle:UITableViewCellStyleDefault
                                                          reuseIdentifier:MyIdentifier];
        }
        cell.lbl_activityid.text = @"Activity id";
    cell.lbl_activityidresult.text = @"VAT454KO";
        cell.lbl_activityType.text = @"Activity Type";
        cell.lbl_activitytyperesult.text = @"Test Drive";
      
        return cell;
    }
    /*
    if (tableView == self.Leads_TV) {
        
        static NSString *MyIdentifier = @"LeadsIdentifier";
        Dashboard_Leads_tablecell_VC *cell = [self.Leads_TV dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[Dashboard_Leads_tablecell_VC alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:MyIdentifier];
        }
        
        cell.lbl_leadName.text = @"Warm Lead";
        cell.lbl_leadSummary.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, ";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }*/
    return 0;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showActivity"])
    {
        ActivityListViewController *detailViewController =
        [segue destinationViewController];
        NSLog(@"0 -- %@",detailViewController);
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    NSLog(@"Products");
                    
                }
                    break;
                case 1:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Stores");
                }
                    break;
                case 2:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Packages");
                }
                    break;
                case 3:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Finances");
                    
                    break;
                }
                case 4:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Finances");
                    
                    break;
                }
                    
                case 5:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Finances");
                    
                    break;
                }
                case 6:
                {
                    [self performSegueWithIdentifier:@"showActivity" sender:[tableView cellForRowAtIndexPath:indexPath]];
                    
                    NSLog(@"Finances");
                    
                    break;
                }
                    break;
                default:
                    break;
            }
    }*/
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
