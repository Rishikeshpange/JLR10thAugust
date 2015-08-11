//
//  DetailViewController.h
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"
#import "MBProgressHUD.h"
#import "GlobalDetails.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, XYPieChartDataSource, XYPieChartDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIActionSheetDelegate>

{
    NSMutableArray *testArray;
    NSMutableArray *testLeadsArray;

   GlobalDetails *userDetailsVal_;
    
 int hotleadcount_,warmleadcount_,coldleadcount_,totalLeadCount_;
    
}

@property (weak, nonatomic) IBOutlet UITableView *leadTableview;
@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;

@property (weak, nonatomic) IBOutlet UITableView *activitiestb;


@property (strong, nonatomic) IBOutlet XYPieChart *pieChartRight;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel1;
@property (strong, nonatomic) IBOutlet UILabel *selectedSliceLabel;
@property (strong, nonatomic) IBOutlet UITextField *numOfSlices;
@property (strong, nonatomic) IBOutlet UISegmentedControl *indexOfSlices;
@property (strong, nonatomic) IBOutlet UIButton *downArrow;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;


@property (weak, nonatomic) IBOutlet UITableView *todaysActivities_TV;// Todays Activity View

@property (weak, nonatomic) IBOutlet UITableView *Leads_TV;

@property (weak, nonatomic) IBOutlet UIButton *allleads;

@property (weak, nonatomic) IBOutlet UIButton *openleads;

@property (weak, nonatomic) IBOutlet UIButton *leadsassigned;


- (IBAction)btnallleads:(id)sender;
- (IBAction)btnleadsassigned:(id)sender;
- (IBAction)btnopenleads:(id)sender;


@property (assign) CGPoint originalCenter;


@property (weak, nonatomic) IBOutlet UITextField *searchleadTxtfld;


////////////////////////


@property (weak, nonatomic) IBOutlet UIButton *mnthlyLeadButton;

@property (weak, nonatomic) IBOutlet UIButton *mnthlyActivitiesButton;
- (IBAction)leadBtnaction:(id)sender;

- (IBAction)activitiesBtnAction:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *chartView;

@property (weak, nonatomic) IBOutlet UILabel *enquiryformLabel;
@property (weak, nonatomic) IBOutlet UILabel *QuotationLabel;

@property (weak, nonatomic) IBOutlet UILabel *salesorderLabel;


@property (weak, nonatomic) IBOutlet UILabel *allottmentLabel;


@property (weak, nonatomic) IBOutlet UILabel *retailLabel;


@property (weak, nonatomic) IBOutlet UILabel *lostLabel;


@property (weak, nonatomic) IBOutlet UIView *monthlyleadchartView;

@property (weak, nonatomic) IBOutlet UIView *monthlyactivitychartView;



@property (weak, nonatomic) IBOutlet UIButton *sevendayact;

- (IBAction)sevendayBtn:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *fifteendayact;

- (IBAction)fifteendayBtn:(id)sender;




@property (weak, nonatomic) IBOutlet UIButton *thirtydayact;

- (IBAction)thirtydayBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *testdrivelabel;

@property (weak, nonatomic) IBOutlet UILabel *fallowLabel;

@property (weak, nonatomic) IBOutlet UITextField *txt_SerchLead;
- (IBAction)leadselectbutton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *retestLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherLabel;

@property(nonatomic, strong) IBOutlet NSMutableArray *sevenDayArray;
@property(nonatomic, strong) IBOutlet NSMutableArray *fifteenDayArray;




@end
