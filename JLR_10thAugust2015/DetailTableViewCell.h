//
//  DetailTableViewCell.h
//  NEEV
//
//  Created by Nihal Shaikh on 7/29/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *lbl_activitytype;

@property (weak, nonatomic) IBOutlet UILabel *lbl_activitytyperesult;


@property (weak, nonatomic) IBOutlet UILabel *lbl_LeadCreationDate;

@property (weak, nonatomic) IBOutlet UILabel *lbl_LeadCreationDateResult;



@property (weak, nonatomic) IBOutlet UILabel *lbl_status;

@property (weak, nonatomic) IBOutlet UILabel *lbl_statusresult;
@property (weak, nonatomic) IBOutlet UILabel *lbl_desc;

@property (weak, nonatomic) IBOutlet UILabel *lbl_descresult;



@end
