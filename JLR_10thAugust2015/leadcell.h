//
//  leadcell.h
//  NEEV
//
//  Created by admin on 01/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface leadcell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Name;
//@property (weak, nonatomic) IBOutlet UILabel *ActivityStatus;
@property (weak, nonatomic) IBOutlet UILabel *PPL;
@property (weak, nonatomic) IBOutlet UILabel *PlannedTime;


@property (weak, nonatomic) IBOutlet UIImageView *imgCell;

@end
