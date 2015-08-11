//
//  contactTableCell.h
//  NEEV
//
//  Created by admin on 05/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgCell;

@property (weak, nonatomic) IBOutlet UIView *viewCell;

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;


@end
