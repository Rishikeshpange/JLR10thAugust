//
//  UserDetails.h
//  NEEV
//
//  Created by Gurneha Naggi on 7/14/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <Foundation/Foundation.h>
//extern NSMutableArray *analyticslistarray;
@interface UserDetails : NSObject


@property(nonatomic,strong)NSString* positionName;

@property(nonatomic,strong)NSString* positionId;


@property(nonatomic,strong)NSString* employeeId;

@property(nonatomic,strong)NSString* CellPhone;




@property(nonatomic,strong)NSString* LoginName;

@property(nonatomic,strong)NSString* EMailAddr;



@property(nonatomic,strong)NSString* orgname;

@property(nonatomic,strong)NSString* orgid;



@end
extern UserDetails *user;
