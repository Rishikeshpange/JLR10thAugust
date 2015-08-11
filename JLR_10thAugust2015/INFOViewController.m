//
//  INFOViewController.m
//  DSE
//
//  Created by Rishikesh on 07/07/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "INFOViewController.h"
#import "GlobalDetails.h"

@interface INFOViewController ()

@end

@implementation INFOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userDetailsVal_ = [GlobalDetails sharedmanager];

    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 650, 75)];
    //fromLabel.text = @" PROFILE";
    fromLabel.textColor=[UIColor whiteColor];
    
    UILabel *fromLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(250, 30, 575, 30)];
    fromLabel3.text = @"PROFILE";
    fromLabel3.textColor=[UIColor blackColor];
    fromLabel3.font=[UIFont fontWithName:nil size:20];
    
    
    UILabel *fromLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 85, 200, 30)];
    fromLabel1.text = @"Employee ID         :";
    fromLabel1.textColor=[UIColor darkGrayColor];
     fromLabel1.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 85, 575, 30)];
    //fromLabel2.text = @"SSJAIN_110102";
    fromLabel2.text =  userDetailsVal_.Login_Name;
    fromLabel2.textColor=[UIColor darkGrayColor];
     fromLabel2.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 125, 200, 30)];
    fromLabel4.text = @"Position Name       :";
    fromLabel4.textColor=[UIColor darkGrayColor];
    fromLabel4.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel5 = [[UILabel alloc]initWithFrame:CGRectMake(210, 125, 575, 30)];
   // fromLabel5.text = @"JLRIL-Sal-N-DL-10102-Janpath-DSAdmn";
    fromLabel5.text = userDetailsVal_.POSITION_NAME;
    fromLabel5.textColor=[UIColor darkGrayColor];
    fromLabel5.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel6 = [[UILabel alloc]initWithFrame:CGRectMake(20, 160, 200, 30)];
    fromLabel6.text = @"Email ID                 :";
    fromLabel6.textColor=[UIColor darkGrayColor];
    fromLabel6.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel7 = [[UILabel alloc]initWithFrame:CGRectMake(210, 160, 575, 30)];
    //fromLabel7.text = @"kasuma.kayara@xyz.com";
    fromLabel7.text =userDetailsVal_.EMAILID;
    if([fromLabel7.text isEqual:@""])
    {
        fromLabel7.text=@"Not Available";
    }
    
    fromLabel7.textColor=[UIColor darkGrayColor];
    fromLabel7.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel8 = [[UILabel alloc]initWithFrame:CGRectMake(20, 195, 200, 30)];
    fromLabel8.text = @"Contact No            :";
    fromLabel8.textColor=[UIColor darkGrayColor];
    fromLabel8.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel9 = [[UILabel alloc]initWithFrame:CGRectMake(210, 195, 575, 30)];
   //fromLabel9.text = @"9077611111";
   fromLabel9.text =userDetailsVal_.PHONENUMBER;
    
    if([fromLabel9.text isEqual:@""])
    {
        fromLabel9.text=@"Not Available";
    }
    
    fromLabel9.textColor=[UIColor darkGrayColor];
    fromLabel9.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel10 = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, 200, 30)];
    fromLabel10.text = @"Work Location        :";
    fromLabel10.textColor=[UIColor darkGrayColor];
    fromLabel10.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel11 = [[UILabel alloc]initWithFrame:CGRectMake(210, 230, 575, 30)];
    fromLabel11.text = userDetailsVal_.LOCATION;
    if([fromLabel11.text isEqual:@""])
    {
        fromLabel11.text=@"Not Available";
    }
    fromLabel11.textColor=[UIColor darkGrayColor];
    fromLabel11.font=[UIFont fontWithName:nil size:20];
    
    UILabel *fromLabel12 = [[UILabel alloc]initWithFrame:CGRectMake(14, 280, 575, 70)];
    fromLabel12.text = @" If you want to add ,change or remove information then please\n  contact for further details ";
    fromLabel12.textColor=[UIColor darkGrayColor];
    fromLabel12.lineBreakMode = NSLineBreakByWordWrapping;
    fromLabel12.numberOfLines = 0;
    fromLabel12.layer.cornerRadius=4;

    fromLabel12.backgroundColor = [UIColor colorWithRed:186/255.0f green:186/255.0f blue:186/255.0f alpha:1];
    fromLabel12.font=[UIFont fontWithName:nil size:20];
    
    
//    fromLabel.numberOfLines = 1;
//    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
//    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.adjustsLetterSpacingToFitWidth = YES;
//    fromLabel.minimumScaleFactor = 10.0f/12.0f;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
//    fromLabel.textColor = [UIColor blackColor];
//    fromLabel.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:fromLabel];
    [self.view addSubview:fromLabel1];
    [self.view addSubview:fromLabel2];
    [self.view addSubview:fromLabel3];
    [self.view addSubview:fromLabel4];
    [self.view addSubview:fromLabel5];
    [self.view addSubview:fromLabel6];
    [self.view addSubview:fromLabel7];
    [self.view addSubview:fromLabel8];
    [self.view addSubview:fromLabel9];
    [self.view addSubview:fromLabel10];
    [self.view addSubview:fromLabel11];
    [self.view addSubview:fromLabel12];
    UITextView *newTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 55, 575,500)];
    [newTextView setFont:[UIFont systemFontOfSize:16]];
    newTextView.text = @"Background\n\nPreviously, there was a challenge in follow up of most of the leads created by  TBSS, reason being Visibility of those leads to correct person(sales executives). Apparently, a lot of leads were lost in the process. Hence, to overcome this challenge, Tata Motors needed a Mobility Solution especially for those executives who can actually do follow up and close the leads as a Retail or Lost Customer.\n\nTata Technologies Solution\n\nhe purpose of the app is to help the Dealer Sales Executives to build relationships, generate and execute sales objectives for assigned areas of responsibility. Dealer Sales Executives  contacts the potential customers and identify new business opportunities. \n\nSalient Features\n\n Lead Generation\n Lead Management – Updating leads, creating follow up, activities, closing leads,  Searching leads\n Activity Creation\nActivity Management\n Analytics –  PL Wise, PPL Wise\n\nProject Details\n\nThis App is used by the Dealer Sales Executive(DSE) which makes it easier for the DSM to track the leads assigned to the DSE’s.  The DSE has the facilities  to  update the leads, create follow up activities for leads and close leads.  This App is integrated with the backend system of Tata Motors. The created or updated data is directly reflected in the backend system.\nAnalytics report feature is also present in the App that shows the monthly analytics of leads, Product wise. The analytics  graph is  generated using the backend data.  \n\nImpact and Business Benefits\n\nStreamline Sales Admin\nThis App streamlines the entire sales process  from lead capturing to analytics.\n\nIncrease Competitive Advantage\nIt speeds up the sales process  cycle and helps the sales person to concentrate on their next appointment.\n\nSales conversations can happen anywhere, anytime: at a desk, over lunch, in the hallway\nThe sales conversation isn’t limited to one place. It help the manager to present the company in a professional way, and to stand out from the competition.\n\nComposed Analytics\nHaving a graphical report on mobile as well  as  tablet makes it easier for the DSM to understand the pitfalls of sales action plan and improve the sales department for better results.";
    
//    NSString *strTextView = @"Background\n\nPreviously, there was a challenge in follow up of most of the leads created by  TBSS, reason being Visibility of those leads to correct person(sales executives). Apparently, a lot of leads were lost in the process. Hence, to overcome this challenge, Tata Motors needed a Mobility Solution especially for those executives who can actually do follow up and close the leads as a Retail or Lost Customer.\n\nTata Technologies Solution\n\nhe purpose of the app is to help the Dealer Sales Executives to build relationships, generate and execute sales objectives for assigned areas of responsibility. Dealer Sales Executives  contacts the potential customers and identify new business opportunities. \n\nSalient Features\n\n Lead Generation\n Lead Management – Updating leads, creating follow up, activities, closing leads,  Searching leads\n Activity Creation\nActivity Management\n Analytics –  PL Wise, PPL Wise\n\nProject Details\n\nThis App is used by the Dealer Sales Executive(DSE) which makes it easier for the DSM to track the leads assigned to the DSE’s.  The DSE has the facilities  to  update the leads, create follow up activities for leads and close leads.  This App is integrated with the backend system of Tata Motors. The created or updated data is directly reflected in the backend system.\nAnalytics report feature is also present in the App that shows the monthly analytics of leads, Product wise. The analytics  graph is  generated using the backend data.  \n\nImpact and Business Benefits\n\nStreamline Sales Admin\nThis App streamlines the entire sales process  from lead capturing to analytics.\n\nIncrease Competitive Advantage\nIt speeds up the sales process  cycle and helps the sales person to concentrate on their next appointment.\n\nSales conversations can happen anywhere, anytime: at a desk, over lunch, in the hallway\nThe sales conversation isn’t limited to one place. It help the manager to present the company in a professional way, and to stand out from the competition.\n\nComposed Analytics\nHaving a graphical report on mobile as well  as  tablet makes it easier for the DSM to understand the pitfalls of sales action plan and improve the sales department for better results.";
//    
//    NSRange rangeBold = [strTextView rangeOfString:@"Salient Features"];
//    UIFont *fontText = [UIFont boldSystemFontOfSize:16];
//    NSDictionary *dictBoldText = [NSDictionary dictionaryWithObjectsAndKeys:fontText, NSFontAttributeName, nil];
//        NSMutableAttributedString *mutAttrTextViewString = [[NSMutableAttributedString alloc] initWithString:strTextView];
//    [mutAttrTextViewString setAttributes:dictBoldText range:rangeBold];
//    
//    [newTextView setAttributedText:mutAttrTextViewString];
    
    // [newTextView setFont:[UIFont systemFontOfSize:16]];
    
    newTextView.backgroundColor=[UIColor clearColor];
    newTextView.userInteractionEnabled = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(Cancel)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    button.frame = CGRectMake(245.0, 380, 130, 60);
    button.backgroundColor=[UIColor colorWithRed:115/255.0f green:182/255.0f blue:68/255.0f alpha:1];
    button.layer.cornerRadius=5;
    [self.view addSubview:button];
    
   // [self.view addSubview:newTextView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)Cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
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
