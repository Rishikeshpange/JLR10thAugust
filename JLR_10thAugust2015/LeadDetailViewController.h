//
//  LeadDetailViewController.h
//  NEEV
//
//  Created by Nihal Shaikh on 7/28/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeadDetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *managetableactivity;

@property (weak, nonatomic) IBOutlet UIView *optyView;

@end
