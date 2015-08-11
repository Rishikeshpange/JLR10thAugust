//
//  LeadDetailViewController.m
//  NEEV
//
//  Created by Nihal Shaikh on 7/28/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "LeadDetailViewController.h"
#import "DetailTableViewCell.h"


@interface LeadDetailViewController ()

@end

@implementation LeadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.optyView.layer.borderColor=[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
    
    self.view.layer.borderWidth = 4.0f;
    
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
- (IBAction)LeadDetails:(id)sender {
    
    NSLog(@"lead details ");
 
    
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
    
    if (tableView == self.managetableactivity) {
        
        
        
        static NSString *MyIdentifier = @"detailIdentifier";
        
        DetailTableViewCell *cell = [self.managetableactivity dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[DetailTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault
                                                          reuseIdentifier:MyIdentifier];
        }
        cell.lbl_activitytype.text = @"Activity Type :";
        cell.lbl_activitytyperesult.text =@"Test Drive";
        
     cell.lbl_LeadCreationDate.text = @"Planned Date";
          cell.lbl_LeadCreationDateResult.text = @"16-07-2015";
        
        
        cell.lbl_status.text = @"Status :";
        cell.lbl_statusresult.text =@"Open";
        
        cell.lbl_desc.text = @"Description";
        cell.lbl_descresult.text = @"Planned for test drive";
        
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
