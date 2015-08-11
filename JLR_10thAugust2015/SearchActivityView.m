//
//  SearchActivityView.m
//  JLR
//
//  Created by Rishikesh on 11/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "SearchActivityView.h"

@interface SearchActivityView ()

@end

@implementation SearchActivityView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.FromDate.layer.cornerRadius=4.0f;
   // self.FromDate.layer.masksToBounds=YES;
    self.FromDate.layer.borderColor=[[UIColor grayColor]CGColor];
    self.FromDate.layer.borderWidth= 1.0f;
    
    self.ToDate.layer.cornerRadius=4.0f;
   // self.ToDate.layer.masksToBounds=YES;
    self.ToDate.layer.borderColor=[[UIColor grayColor]CGColor];
    self.ToDate.layer.borderWidth= 1.0f;
    
    
    self.ActivityType.layer.cornerRadius=4.0f;
    //self.ActivityType.layer.masksToBounds=YES;
    self.ActivityType.layer.borderColor=[[UIColor grayColor]CGColor];
    self.ActivityType.layer.borderWidth= 1.0f;
    
    self.Status.layer.cornerRadius=4.0f;
   // self.Status.layer.masksToBounds=YES;
    self.Status.layer.borderColor=[[UIColor grayColor]CGColor];
    self.Status.layer.borderWidth= 1.0f;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
