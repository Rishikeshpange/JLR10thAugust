//
//  GlobalDetails.m
//  NEEV
//
//  Created by Nihal Shaikh on 7/30/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "GlobalDetails.h"
@implementation GlobalDetails

@synthesize
Login_Name,
POSITION_NAME,
LOB_NAME,
REGION_NAME,
AREA,
STATE,
ROW_ID,
POSTN,
ORGNAME,
EMPLOYEEID,EMAILID,PHONENUMBER,USERNAME,PASSWORD,ORGID,ESTATUS,LOCATION;

+(id)sharedmanager
{
    
    static GlobalDetails *sharedManager = nil;
   
    @synchronized(self)
    {
        if (sharedManager == nil)
        {
            sharedManager = [[self alloc]init];
        }
    }
    return sharedManager;
    
}

@end



