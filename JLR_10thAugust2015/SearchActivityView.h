//
//  SearchActivityView.h
//  JLR
//
//  Created by Rishikesh on 11/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchActivityView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *FromDate;
@property (weak, nonatomic) IBOutlet UITextField *ToDate;
@property (weak, nonatomic) IBOutlet UITextField *ActivityType;
@property (weak, nonatomic) IBOutlet UITextField *Status;

@end
