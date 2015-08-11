//
//  Leads.h
//  NEEV
//
//  Created by Abhishek on 03/08/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Leads : NSObject
{
    NSString* Quality; //For Lead Classification
    NSString* SalesStage; //Sale stage
    NSString* CreatedDate; //Opty Created Date
    NSString* TMILOB; // LOB
    NSString* TMIParentProductLine; //PPL
    NSString* TMIContactFirstName; // firstname
    NSString* TMIContactLastName; // lastname
    NSString* FullName; //Fullname // concatinating both names (TMIContactFirstName + TMIContactLastName)
    
    NSString *AppendString; //Append string
    //NSString* POSTN;
    //NSString* ORGNAME;
}

@property(strong,nonatomic)NSString *Quality;
@property(strong,nonatomic)NSString *SalesStage;
@property(strong,nonatomic)NSString *CreatedDate;
@property(strong,nonatomic)NSString *TMILOB;
@property(strong,nonatomic)NSString *TMIParentProductLine;
@property(strong,nonatomic)NSString *TMIContactFirstName;
@property(strong,nonatomic)NSString *TMIContactLastName;

@property(strong,nonatomic)NSString *FullName; //Fullname // concatinating both names (TMIContactFirstName + TMIContactLastName)

@property(strong,nonatomic)NSString *AppendString;

//@property(strong,nonatomic)NSString *POSTN;
//@property(strong,nonatomic)NSString *ORGNAME;

extern Leads *leads;

@end
