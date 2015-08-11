//
//  countdetails.h
//  NEEV
//
//  Created by Nihal Shaikh on 7/30/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSMutableArray *activityIdarray,*OpportunityList_ArrList;
extern NSMutableArray *OpportunityListDisplayArr;


@interface countdetails : NSObject


@property (strong,nonatomic)NSString *_ActivityId;

@property (strong,nonatomic)NSString *_ActivityType;

@property (strong,nonatomic)NSString *_ActivityUID;

@property (strong,nonatomic)NSString *_OpportunityId;


@property (strong,nonatomic)NSString *_Status;

@property (strong,nonatomic)NSString *_Name;

@property (strong,nonatomic)NSString *_PPL;

@property (strong,nonatomic)NSString *_Time;
@property (strong,nonatomic)NSString *_salesstages;

@end

extern countdetails *count,*searchOpportunity_list;

//
//
//<ActivityId xsi:type="ns0:string">1-5DBYX</ActivityId>
//<ActivityType xsi:type="ns0:string">General</ActivityType>
//<ActivityUID xsi:type="ns0:string">1-5DBYX</ActivityUID>
//<Opportunity3 xsi:type="ns0:string">undefined # 10</Opportunity3>
//<OpportunityId xsi:type="ns0:string">1-5DBYM</OpportunityId>
//<Position2 xsi:type="ns0:string">Siebel Administrator</Position2>
//<PositionId2 xsi:type="ns0:string">04-HKCSE</PositionId2>
//<PrimaryOwnedBy xsi:type="ns0:string">DSADMN_10101</PrimaryOwnedBy>
//<PrimaryOwnerId xsi:type="ns0:string">1-23INQ</PrimaryOwnerId>