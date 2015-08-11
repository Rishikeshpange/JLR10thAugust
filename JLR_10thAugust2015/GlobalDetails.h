//
//  GlobalDetails.h
//  NEEV
//
//  Created by Nihal Shaikh on 7/30/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalDetails : NSObject


{
    NSString* Login_Name;
    NSString* POSITION_NAME;
    NSString* LOB_NAME;
    NSString* REGION_NAME;
    NSString* AREA;
    NSString* STATE;
    NSString* ROW_ID;
    NSString* POSTN;
    NSString* ORGNAME;
    NSString* EMAILID;
    NSString* EMPLOYEEID;
    NSString* PHONENUMBER;
    NSString* USERNAME;
    NSString* PASSWORD;
    NSString* ORGID;
    NSString* ESTATUS;
    NSString* LOCATION;
}
+(id)sharedmanager;
@property(strong,nonatomic)NSString *Login_Name;
@property(strong,nonatomic)NSString *POSITION_NAME;
@property(strong,nonatomic)NSString *LOB_NAME;
@property(strong,nonatomic)NSString *REGION_NAME;
@property(strong,nonatomic)NSString *AREA;
@property(strong,nonatomic)NSString *STATE;
@property(strong,nonatomic)NSString *ROW_ID;
@property(strong,nonatomic)NSString *POSTN;
@property(strong,nonatomic)NSString *ORGNAME;
@property(strong,nonatomic)NSString *EMAILID;

@property(strong,nonatomic)NSString *EMPLOYEEID;

@property(strong,nonatomic)NSString *PHONENUMBER;

@property(strong,nonatomic)NSString *USERNAME;

@property(strong,nonatomic)NSString *PASSWORD;

@property(strong,nonatomic)NSString *ORGID;

@property(strong,nonatomic)NSString *ESTATUS;


@property(strong,nonatomic)NSString *LOCATION;

@end


