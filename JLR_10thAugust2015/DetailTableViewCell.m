//
//  DetailTableViewCell.m
//  NEEV
//
//  Created by Nihal Shaikh on 7/29/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell


@synthesize lbl_activitytype,
lbl_activitytyperesult,
lbl_LeadCreationDate,
lbl_LeadCreationDateResult,lbl_desc,lbl_descresult,lbl_status,lbl_statusresult;
- (void)awakeFromNib {
    // Initialization code
    
    // NSLog(@"testing label..123");
    [lbl_LeadCreationDate sizeToFit];
    [lbl_LeadCreationDateResult sizeToFit];
    [lbl_activitytype sizeToFit];
    [lbl_activitytyperesult sizeToFit];
    [lbl_desc sizeToFit];
    [lbl_descresult sizeToFit];
    
    [lbl_status sizeToFit];
    [lbl_statusresult sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
