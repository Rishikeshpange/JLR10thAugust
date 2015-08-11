//
//  TodaysActivityCell.h
//  NEEV
//
//  Created by Rishikesh on 01/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodaysActivityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *ActivityStatus;
@property (weak, nonatomic) IBOutlet UILabel *PPL;
@property (weak, nonatomic) IBOutlet UILabel *PlannedTime;

@end
