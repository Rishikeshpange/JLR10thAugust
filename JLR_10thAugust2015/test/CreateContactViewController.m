//
//  CreateContactViewController.m
//  NEEV
//
//  Created by admin on 05/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "CreateContactViewController.h"
#import "contactTableCell.h"
@interface CreateContactViewController ()
{
    
    UIAlertView *alert;
}

@end
@implementation CreateContactViewController


@synthesize btnCancel,btnEdit,btnCorrect;
@synthesize txtEmail,txtFirstname,txtLastName,txtMobileno,btnSearch;
@synthesize txtMobileNumberFirst,txtSearchLastname,txtSearchFirstname;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editView.layer.cornerRadius=05;
    [btnCancel setHidden:YES];
    [btnCorrect setHidden:YES];
    [self textFiledText];
    
    
    btnSearch.layer.cornerRadius=03;
    
    txtFirstname.layer.borderColor=[UIColor clearColor].CGColor;
    txtFirstname.userInteractionEnabled=NO;

    txtLastName.layer.borderColor=[UIColor clearColor].CGColor;
    txtLastName.userInteractionEnabled=NO;

    
    txtMobileno.layer.borderColor=[UIColor clearColor].CGColor;
    txtMobileno.userInteractionEnabled=NO;

    
    txtEmail.layer.borderColor=[UIColor clearColor].CGColor;
    txtEmail.userInteractionEnabled=NO;
    // self.txtFirstname.layer.borderColor = [UIColor colorWithRed:(24/255.0) green:(27/255.0) blue:(30/255.0) alpha:1].CGColor;
    //self.txtActivityType.layer.borderWidth = 2;

    // Do any additional setup after loading the view.
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFiledText
{
    UIColor *color=[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
    //self.txtCustomerName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Customer name" attributes:@{NSForegroundColorAttributeName:color}];
    
    //self.txtCustomerMobile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Customer Mobile Number" attributes:@{NSForegroundColorAttributeName:color}];
    
   // self.txtMobileNumberFirst.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Date" attributes:@{NSForegroundColorAttributeName:color}];
    
    self.txtSearchFirstname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" First Name" attributes:@{NSForegroundColorAttributeName:color}];
    
    self.txtSearchLastname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" Last NAme" attributes:@{NSForegroundColorAttributeName:color}];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



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

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        
        NSLog(@"David Miller");
    }
    if (buttonIndex==1) {
        NSLog(@"Glen Maxwell");
      //  LoginViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        //[self.navigationController pushViewController:secondViewController animated:YES];
      //  [self presentViewController:secondViewController animated:YES completion:nil ];
        //  [self.navigationController popToRootViewControllerAnimated:TRUE];
        // [self dismissViewControllerAnimated:YES completion:nil];
        //  [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
        //  [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
        if (tableView == self.tableView) {
        static NSString *MyIdentifier = @"MyIdentifier";
    
        contactTableCell *cell;

        cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[contactTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:MyIdentifier];
        }
        self.tableView.separatorColor = [UIColor clearColor];
        cell.viewCell.layer.cornerRadius=05;
            
        cell.imgCell.layer.cornerRadius = cell.imgCell.frame.size.width / 2.3;
        cell.imgCell.layer.borderWidth = 3.0f;
        cell.imgCell.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.imgCell.clipsToBounds = YES;
            
            

        cell.imgCell.clipsToBounds=YES;
        cell.imgCell.layer.borderColor=[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
       // cell.viewCell.backgroundColor=[UIColor yellowColor];
    

            
            
            //yourImageView.layer.cornerRadius = yourRadius;
            //yourImageView.clipsToBounds = YES;
            
            //cell.layer.cornerRadius = 05;
            // cell.layer.borderWidth=2.0f;

            
       // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        return cell;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.; // you can have your own choice, of course
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
   // tableView.separatorColor =[UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1];
    [tableView setContentOffset:tableView.contentOffset animated:NO];
    self.tableView.separatorColor = [UIColor clearColor];

    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0 || indexPath.row == ([indexPath length]-1))
    {
      //  cell.layer.cornerRadius = 10;
        
        
    }
    
    
    // cell.layer.borderWidth=2.0f;

   // cell.layer.cornerRadius = 05;
   // cell.layer.borderWidth=2.0f;
   // cell.layer.borderColor=[UIColor colorWithRed:(229/255.0) green:(229/255.0) blue:(229/255.0) alpha:1].CGColor;
    
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
    
  /*  UIView *bgColorView = [[UIView alloc] init];
    [bgColorView setBackgroundColor:[UIColor colorWithRed:(178/255.0) green:(183/255.0) blue:(63/255.0) alpha:1]];
    bgColorView.layer.cornerRadius = 10;
    
    cell.backgroundColor = [UIColor colorWithRed:(1/255.0) green:(31/255.0) blue:(65/255.0) alpha:1] ;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
    cell.textLabel.textColor=[UIColor colorWithRed:(216/255.0) green:(218/255.0) blue:(221/255.0) alpha:1];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;*/
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self._tableView];
    
    NSLog(@"... Enter %ld",(long)indexPath.row);
    
    [tableView reloadData];
    contactTableCell *cell = (contactTableCell*)[tableView cellForRowAtIndexPath:indexPath];
  
    cell.viewCell.backgroundColor = [UIColor colorWithRed:(78/255.0) green:(180/255.0) blue:(168/255.0) alpha:1] ;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"... Entertt %ld",(long)indexPath.row);

}





- (IBAction)btnEdit:(id)sender {
    
    [btnCancel setHidden:NO];
    [btnCorrect setHidden:NO];
    [btnEdit setHidden:YES];
    NSLog(@"1");
    txtFirstname.userInteractionEnabled=YES;
    txtLastName.userInteractionEnabled=YES;
    txtMobileno.userInteractionEnabled=YES;
    txtEmail.userInteractionEnabled=YES;
    self.txtFirstname.layer.borderColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
    self.txtFirstname.layer.borderWidth = 1;
    
    self.txtLastName.layer.borderColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
    self.txtLastName.layer.borderWidth = 1;
    
    self.txtMobileno.layer.borderColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
    self.txtMobileno.layer.borderWidth = 1;
    
    self.txtEmail.layer.borderColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1].CGColor;
    self.txtEmail.layer.borderWidth = 1;
   // UIImage *buttonImage1 = [UIImage imageNamed:@"done_icon@2x.png"];
   // [btnEdit setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
    
}

- (IBAction)btnCancel:(id)sender {
    
    [btnCancel setHidden:YES];
    [btnCorrect setHidden:YES];
    [btnEdit setHidden:NO];
    txtFirstname.userInteractionEnabled=NO;
    [txtFirstname setBorderStyle:UITextBorderStyleNone];
    txtLastName.userInteractionEnabled=NO;
    txtMobileno.userInteractionEnabled=NO;
    txtEmail.userInteractionEnabled=NO;
    self.txtFirstname.layer.borderColor = [UIColor clearColor].CGColor;
    self.txtLastName.layer.borderColor = [UIColor clearColor].CGColor;
    self.txtMobileno.layer.borderColor = [UIColor clearColor].CGColor;
    self.txtEmail.layer.borderColor = [UIColor clearColor].CGColor;


    //self.txtFirstname.layer.borderColor = [UIColor colorWithRed:(31/255.0) green:(36/255.0) blue:(49/255.0) alpha:1].CGColor;
    //self.txtFirstname.layer.borderWidth = 1;
    

    //UIImage *buttonImage1 = [UIImage imageNamed:@"edit_icon@2x.png"];
    //[btnEdit setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
}

- (IBAction)btnCorrect:(id)sender {
    
    NSLog(@"11");

}
- (IBAction)btnSearch:(id)sender {
}
@end
