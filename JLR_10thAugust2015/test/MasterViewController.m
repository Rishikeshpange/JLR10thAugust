//
//  MasterViewController.m
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"




#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@implementation MasterViewController

UITableViewCell *cell;
NSArray *tableData,*tableText;
UILabel *mainLabel;


- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}


- (void)viewDidAppear:(BOOL)animated
{


    
    
}
- (void) viewWillAppear:(BOOL)animated
{
  
    [super viewWillAppear:animated];
    self.tableView.layer.borderColor =  [UIColor colorWithRed:(31/255.0) green:(39/255.0) blue:(41/255.0) alpha:1].CGColor;
    self.tableView.layer.borderWidth = 3.0f;
  tableData = [NSArray arrayWithObjects:userDetailsVal_.Login_Name,@"DASHBOARD", @"CREATE LEAD",@"CONTACT",@"SEARCH LEAD", @"ACTIVITY",nil];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_strip.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIImage *img = [UIImage imageNamed:@"logo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,10,55,40)];
    [imgView setImage:img];
    // setContent mode aspect fit
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    

    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]
                             animated:NO
                       scrollPosition:UITableViewScrollPositionTop];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
     userDetailsVal_ = [GlobalDetails sharedmanager]; // usedetails instance
    
    
    NSLog(@"\n _ORGNAME %@",userDetailsVal_.Login_Name);
    
   // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
 //   NSLog(@"index Path %@",indexPath);
   // [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition: UITableViewScrollPositionNone];
    if(IS_OS_8_OR_LATER)
    {
        NSLog(@"ios 8 ");
        _maximumPrimaryColumnWidth = 240;
        
        self.splitViewController.maximumPrimaryColumnWidth = _maximumPrimaryColumnWidth;
    }
    else
    {
        NSLog(@"ios 7");
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Enter..");
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:(86/255.0) green:(107/255.0) blue:(112/255.0) alpha:1];
    static NSString *CellIdentifier = @"Cell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    tableView.separatorColor =[UIColor colorWithRed:(206/255.0) green:(205/255.0) blue:(205/255.0) alpha:1];
    [tableView setContentOffset:tableView.contentOffset animated:NO];
    
    //[tableView setSeparatorInset:UIEdgeInsetsZero];

    if(indexPath.row==0)
    {
        cell.userInteractionEnabled = NO;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     
        cell.imageView.image = [UIImage imageNamed:@"icon_1.png"];
        
        
        
      
        
        
        
    }
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
    
    //cell.backgroundColor = [UIColor colorWithRed:(1/255.0) green:(31/255.0) blue:(65/255.0) alpha:1] ;
    if(indexPath.row==0)
    {
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
       
        cell.textLabel.textColor=[UIColor colorWithRed:(2/255.0) green:(189/255.0) blue:(188/255.0) alpha:1];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
        cell.backgroundColor = [UIColor colorWithRed:(31/255.0) green:(39/255.0) blue:(48/255.0) alpha:1];
        
        
        
    }
    else
    {
        cell.backgroundColor = [UIColor colorWithRed:(31/255.0) green:(39/255.0) blue:(41/255.0) alpha:1] ;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.textColor=[UIColor colorWithRed:(216/255.0) green:(218/255.0) blue:(221/255.0) alpha:1];
        cell.textLabel.highlightedTextColor = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1];
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds] ;
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:(86/255.0) green:(107/255.0) blue:(112/255.0) alpha:1];

    }
    
    // cell.backgroundColor = [UIColor colorWithHexString:@"#FFFFCC"];
    //cell.backgroundColor= [self colorWithHexString:@"FFFFFF"]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    cell.backgroundColor = [UIColor colorWithRed:(178/255.0) green:(183/255.0) blue:(63/255.0) alpha:1];
    NSLog(@"Row index : %ld",(long)indexPath.row);
   // cell.textLabel.highlightedTextColor = [UIColor redColor];

    if (indexPath.row == 0) {
        
          NSLog(@"CELL first");
     //   cell.userInteractionEnabled = YES;
     //   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        cell.imageView.image = [UIImage imageNamed:@"icon_1.png"];
        DetailViewController * dvc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"view1"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc1,nil];
        self.splitViewController.delegate = dvc1;
    }
    else if(indexPath.row ==1)
    {
        
        DetailViewController * dvc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Dashboard"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc2,nil];
        self.splitViewController.delegate = dvc2;
        
    }
    else if(indexPath.row == 2)
    {
        DetailViewController * dvc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"Create_Lead"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc3,nil];
        self.splitViewController.delegate = dvc3;
        
    }
    else if(indexPath.row == 3)
    {
        DetailViewController * dvc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"Create_Contact"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc4,nil];
        self.splitViewController.delegate = dvc4;
        
    }
    else if(indexPath.row == 4)
    {
        DetailViewController * dvc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewmanage"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc4,nil];
        self.splitViewController.delegate = dvc4;
        
    }
    else if(indexPath.row == 5)
    {
        DetailViewController * dvc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"activityList"];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:[self.splitViewController.viewControllers objectAtIndex:0],dvc4,nil];
        self.splitViewController.delegate = dvc4;
        
    }
    //  cell.backgroundColor = [UIColor colorWithRed:(178/255.0) green:(183/255.0) blue:(63/255.0) alpha:1];
    
}



@end
