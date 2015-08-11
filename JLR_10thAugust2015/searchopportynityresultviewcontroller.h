//
//  searchopportynityresultviewcontroller.h
//  NEEV
//
//  Created by Nihal Shaikh on 7/28/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchopportynityresultviewcontroller : UIViewController <UITableViewDataSource,UITabBarDelegate>
{
    
   
    
}
@property(strong,nonatomic)NSMutableArray *optySearchDetails;
@property(strong,nonatomic)NSMutableArray *optySearchDetails_Comes;
@property(strong,nonatomic)NSString *txtFromDate;
@property(strong,nonatomic)NSString *txtToDate;
@property(strong,nonatomic)NSString *txtSalesStages;
@property(strong,nonatomic)NSString *dseid;
@property(strong,nonatomic)NSString *flagset;
@property int flag;

@property(strong,nonatomic)NSString *customername;
@property(strong,nonatomic)NSString *customernumber;



@property(strong,nonatomic)NSString *txttaluka;
@property(strong,nonatomic)NSString *txtdse;
@property(strong,nonatomic)NSString *txtppl;
@property (weak, nonatomic) IBOutlet UILabel *line;


@property (weak, nonatomic) IBOutlet UITableView *manageTableView;
@end


