//
//  Leads.m
//  NEEV
//
//  Created by Abhishek on 03/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "Leads.h"

Leads *leads; //leads globa object


@implementation Leads

@synthesize  Quality; //For Lead Classification
@synthesize  SalesStage; //Sale stage
@synthesize  CreatedDate; //Opty Created Date
@synthesize  TMILOB; //LOB
@synthesize  TMIParentProductLine; //PPL
@synthesize  TMIContactFirstName; //firstname
@synthesize  TMIContactLastName; //lastname
@synthesize  FullName;  //Fullname //concatinating both names (TMIContactFirstName + TMIContactLastName)
@synthesize  AppendString;
@end
