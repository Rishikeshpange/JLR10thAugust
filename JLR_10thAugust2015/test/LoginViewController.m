//
//  LoginViewController.m
//  test
//
//  Created by admin on 02/03/15.
//  Copyright (c) 2015 LetsIDev. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "SSKeychain.h"
#import "SSKeychainQuery.h"
#import "UserDetails.h"
#import "GlobalDetails.h"
#import "MBProgressHUD.h"

@interface LoginViewController ()

{
    NSString *userName,*passWord;
    NSString *usernameStrng,*passwordString;
    UIActionSheet *actionSheet;
    NSMutableArray *pName,*userpositionnamearray,*userposnidarray,*orgnamearray,*orgidarray;
   
    
     int *imageflag;
}
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"login..");
    [super viewDidLoad];
    
    
    userposnidarray=[[NSMutableArray alloc]init];
    userpositionnamearray=[[NSMutableArray alloc]init];
    
    
    orgidarray=[[NSMutableArray alloc]init];
    orgnamearray=[[NSMutableArray alloc]init];
    
   // self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];//AppDelegate instance
  userDetailsVal_ = [GlobalDetails sharedmanager]; // usedetails instance
    
    
    
  //  self.username.text=@"SJAIN_10102";
  //  self.password.text=@"HPY151NWYR";
  //   positionlist = [position_LIST sharedmanager];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.username.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(5.0, 5.0)];
     UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.password.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(5.0, 5.0)];
    
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.view.bounds;
    maskLayer.path  = maskPath.CGPath;
    
    
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = self.view.bounds;
   
    maskLayer1.path =maskPath1.CGPath;
    self.username.layer.mask = maskLayer;
    self.password.layer.mask = maskLayer1;
    
    
    [self.username setBackgroundColor:[UIColor colorWithRed:14/255.0f green:26/255.0f blue:43/255.0f alpha:1]];
    [self.username.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.username.layer setBorderWidth:1.0];
    [self.username.layer setCornerRadius:0.0f];
    
    UIImageView* usernameIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(11, 12, 15, 14)];
    usernameIconImage.image = [UIImage imageNamed:@"login_box_icon_1@2x"];
    UIView* usernameIconContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 39, 39)];
    //usernameIconContainer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
     usernameIconContainer.backgroundColor = [UIColor clearColor];
    [usernameIconContainer addSubview:usernameIconImage];
    
    self.username.leftViewMode = UITextFieldViewModeAlways;
    self.username.leftView = usernameIconContainer;
    self.username.textAlignment = NSTextAlignmentLeft;
    
    

    
    
    if ([self.username respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"username" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    // self.username.placeholder = @"Username";
    
    [self.password setBackgroundColor:[UIColor colorWithRed:14/255.0f green:26/255.0f blue:43/255.0f alpha:1]];
    [self.password.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.password.layer setBorderWidth:1.0];
    [self.password.layer setCornerRadius:0.0f];
    
    UIImageView* passwordIconImage = [[UIImageView alloc] initWithFrame:CGRectMake(11, 12, 14, 14)];
    passwordIconImage.image = [UIImage imageNamed:@"login_box_icon_2@2x"];
    UIView* passwordIconContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 39, 39)];
//    passwordIconContainer.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
     passwordIconContainer.backgroundColor = [UIColor clearColor];
    [passwordIconContainer addSubview:passwordIconImage];
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    self.password.leftView = passwordIconContainer;
    
    
    self.password.placeholder = @"Password";
    self.password.textAlignment = NSTextAlignmentLeft;
    if ([self.password respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password" attributes:@{NSForegroundColorAttributeName: color}];
    } else {
        NSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
        // TODO: Add fall-back code to set placeholder color.
    }
    self.LoginButton.layer.cornerRadius = 8; // this value vary as per your desire
    self.LoginButton.clipsToBounds = YES;
    self.LoginButton.backgroundColor=[UIColor colorWithRed:24/255.0f green:178/255.0f blue:175/255.0f alpha:1];
    
     imageflag=0;
    
  usernameStrng = [SSKeychain passwordForService:@"AnyService" account:@"AnyUser1"];
 passwordString = [SSKeychain passwordForService:@"AnyService" account:@"AnyUser"];
    
    self.username.text=usernameStrng;
    self.password.text=passwordString;
    
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    
    
    if(!usernameStrng)
    {
          self.rememberImage.image=[UIImage imageNamed:@"remember_me@2x.png"];
        
    }
    else{
        
        self.rememberImage.image=[UIImage imageNamed:@"remember_me_checked@2x.png"];
        imageflag=1;
    }
    
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Authetication_Found:) name:@"authenticationFound" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"authenticationFound" object:nil];//abhishek // For opportunity Count
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dy:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"button click ....%ld",(long)buttonIndex);
   
   
                if(buttonIndex == actionSheet.cancelButtonIndex)
                {
                 
                    return;
                }else{
         
                  
                    
                    
                    
                    NSLog(@"Button index %ld",(long)buttonIndex);
                    
                    
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                    UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
                    //self.window = [[UIApplication sharedApplication] keyWindow];
                    appdelegate.window.rootViewController= vc;
                    
                }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginScreeb:(id)sender {
    
    
    [self showAlert];
    
    userName=self.username.text;
    passWord=self.password.text;
    NSLog(@"Username : - %@",userName);
    NSLog(@"Password : - %@",passWord);
    
    
    
    if(self.username.text.length==0 || self.password.text.length==0)
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter USER ID and PASSWORD" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        if(imageflag==0)
        {
            
            [SSKeychain setPassword:@"" forService:@"AnyService" account:@"AnyUser"];
            [SSKeychain setPassword:@"" forService:@"AnyService" account:@"AnyUser1"];
            
        }
        else{
            
            
            
            
            
            
            [SSKeychain setPassword:self.password.text forService:@"AnyService" account:@"AnyUser"];
            [SSKeychain setPassword:self.username.text forService:@"AnyService" account:@"AnyUser1"];
            
            
            
        }
    
    
    
    [self callAuthentication];
    
       /*
     
     NSLog(@"PostData: %@",post);

     NSURL *url=[NSURL URLWithString:@"http://192.168.1.104:82/WebServices/ValidateUser.svc/Validate"];
     
     NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
     
     NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
     
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
     [request setURL:url];
     [request setHTTPMethod:@"POST"];
     [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
     [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     //[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Accept"];
     [request setHTTPBody:postData];
     
     NSLog(@"Request URL is: %@", request);
     
     NSError *error = [[NSError alloc] init];
     NSHTTPURLResponse *response = nil;
     NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     
     NSLog(@"Response code: %ld", (long)[response statusCode]);
     
     if ([response statusCode] >= 200 && [response statusCode] < 300)
     {
     NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
     
     NSLog(@"Response ==> %@", responseData);
     
     NSError *error = nil;
     
     BOOL isTurnableToJSON = [NSJSONSerialization isValidJSONObject:urlData];
     
     if (isTurnableToJSON){
     
     NSLog(@"Is Valid Json Object");
     
     }else{
     
     NSLog(@"Is not valid Json Object");
     
     }
     
     NSDictionary *jsonData = [NSJSONSerialization
     JSONObjectWithData:urlData
     options:NSJSONReadingMutableContainers
     error:&error];
     
     NSLog(@" Json data is : %@",jsonData);
     }

     */

    /*
   AppDelegate *ad = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSLog(@"Close");
    ad.authenticated = YES;
    [self dismissViewControllerAnimated:NO completion:nil];
    */
//    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
//    //    //self.window = [[UIApplication sharedApplication] keyWindow];
//    //   // app_delegate.window.rootViewController= app_delegate.splitViewController;
//    //      [self.navigationController pushViewController:app_delegate.splitViewController animated:YES];
//    //
//    //    AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
//    //self.window = [[UIApplication sharedApplication] keyWindow];
//    app_delegate.window.rootViewController= vc;

    

   // [self dismissViewControllerAnimated:NO completion:nil];
    
    
    
    
    
    
}


}

-(void)callAuthentication
{
//    SJAIN_10102
    NSLog(@"\n\n ");//Abhishek
    
    NSLog(@"\n User Name %@ ,\n Password : %@",self.username.text,self.password.text);//Abhishek
    
    NSString *envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<soapenv:Header>"
                              @"<UsernameToken xmlns=\"http://siebel.com/webservices\">%@</UsernameToken>"
                              @"<PasswordText xmlns=\"http://siebel.com/webservices\">%@</PasswordText>"
                              @"</soapenv:Header>"
                              @"<soapenv:Body>"
                              @"<asi:SiebelEmployeeQueryByExample soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<SiebelMessage xsi:type=\"emp:ListOfEmployeeInterfaceTopElmt\" xmlns:emp=\"http://www.siebel.com/xml/Employee%%20Interface\">"
                              @"<ListOfEmployeeInterface xsi:type=\"emp:ListOfEmployeeInterface\">"
                              @"<Employee xsi:type=\"emp:ArrayOfEmployee\">"
                              @"<LoginName xsi:type=\"ns0:string\">%@</LoginName>"
                              @"<EmploymentStatus xsi:type=\"ns0:string\">ACTIVE</EmploymentStatus>"
                              @"</Employee>"
                              @"</ListOfEmployeeInterface>"
                              @"</SiebelMessage>"
                              @"</asi:SiebelEmployeeQueryByExample>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",self.username.text,self.password.text,self.username.text];
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    
    NSLog(@"URL IS %@",theurl);
    NSLog(@"REQUEST IS %@",envelopeText);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"authenticationRequest"];
    
}

-(void)Authetication_Found:(NSNotification*)notification
{

    
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    // TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
    
    if ([response rangeOfString:@"SOAP-ENV:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"username or password you have entered is not correct" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        AppDelegate* app_delegate=[[UIApplication sharedApplication] delegate];
        app_delegate.Array1=[[NSMutableArray alloc]init];
        //GlobalDetails* user=[[GlobalDetails alloc] init];
        pName=[[NSMutableArray alloc]init];
        self.item=[[NSMutableArray alloc]init];
        
        
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *soapBody = [TBXML childElementNamed:@"SOAP-ENV:Body" parentElement:tbxml.rootXMLElement];
        TBXMLElement *container = [TBXML childElementNamed:@"rpc:SiebelEmployeeQueryByExampleResponse" parentElement:soapBody];
        if(container)
        {
            
            TBXMLElement *SiebelMessage = [TBXML childElementNamed:@"SiebelMessage" parentElement:container];
            TBXMLElement *ListOfEmployeeInterface = [TBXML childElementNamed:@"ListOfEmployeeInterface" parentElement:SiebelMessage];
            TBXMLElement *Employee = [TBXML childElementNamed:@"Employee" parentElement:ListOfEmployeeInterface];
            TBXMLElement *Employee1 = [TBXML childElementNamed:@"Employee" parentElement:Employee];
            if (Employee1)
            {
                do {
                    user=nil;
                    
                    user=[[UserDetails alloc] init];
                    
                    
                    TBXMLElement *ListOfRelatedPosition = [TBXML childElementNamed:@"ListOfRelatedPosition" parentElement:Employee1];
                    
                    
                    
                    
                    
                    TBXMLElement *employeeid = [TBXML childElementNamed:@"Id" parentElement:Employee1];
                    
                    userDetailsVal_.EMPLOYEEID=[TBXML textForElement:employeeid];
                    
                    TBXMLElement *CellPhone = [TBXML childElementNamed:@"CellPhone" parentElement:Employee1];
                    
                    userDetailsVal_.PHONENUMBER=[TBXML textForElement:CellPhone];
                    
                    
                    TBXMLElement *LoginName = [TBXML childElementNamed:@"LoginName" parentElement:Employee1];
                    
                    userDetailsVal_.Login_Name=[TBXML textForElement:LoginName];
                    
                    
                    
                    TBXMLElement *EMailAddr  = [TBXML childElementNamed:@"EMailAddr" parentElement:Employee1];
                    
                    userDetailsVal_.EMAILID =[TBXML textForElement:EMailAddr ];
                    
                 //EmploymentStatus
                    
                    TBXMLElement *EmploymentStatus  = [TBXML childElementNamed:@"EmploymentStatus" parentElement:Employee1];
                    
                  NSString *status =[TBXML textForElement:EmploymentStatus ];
                    
                    
                    NSString *capitalizedString = [status capitalizedString];
                    
                    userDetailsVal_.ESTATUS=capitalizedString;
                    
                    
                    
                    TBXMLElement *RelatedPosition = [TBXML childElementNamed:@"RelatedPosition" parentElement:ListOfRelatedPosition];
                    TBXMLElement *RelatedPosition1 = [TBXML childElementNamed:@"RelatedPosition" parentElement:RelatedPosition];
                    
                    if(RelatedPosition1)
                    {
                        
                        
                        
                        do{
                            
                            
                            
                            TBXMLElement *PositionId = [TBXML childElementNamed:@"PositionId" parentElement:RelatedPosition1];
                            TBXMLElement *Position = [TBXML childElementNamed:@"Position" parentElement:RelatedPosition1];
                            
                            
                            
                            
                            
                            user.positionId=[TBXML textForElement:PositionId];
                            
                            user.positionName=[TBXML textForElement:Position];
                            
                            
                            NSLog(@"posn %@",user.positionName);
                            
                            [userpositionnamearray addObject:user.positionName];
                            
                            
                            [userposnidarray addObject:user.positionId];
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }while ((RelatedPosition1 = RelatedPosition1->nextSibling)); {
                            
                            NSLog(@"names %@",pName);
                            
                            
                            NSLog(@"position id %@",userpositionnamearray);
                            NSLog(@"po id%@",userposnidarray);
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    ///org details
                    
                    
                    
                    TBXMLElement *ListOfRelatedEmployeeOrganization = [TBXML childElementNamed:@"ListOfRelatedEmployeeOrganization" parentElement:Employee1
                                                                       ];
                    TBXMLElement *RelatedEmployeeOrganization = [TBXML childElementNamed:@"RelatedEmployeeOrganization" parentElement:ListOfRelatedEmployeeOrganization];
                    
                    
                      TBXMLElement *RelatedEmployeeOrganization1 = [TBXML childElementNamed:@"RelatedEmployeeOrganization" parentElement:RelatedEmployeeOrganization];
                    
                    
                    
                    
                    if(RelatedEmployeeOrganization1)
                    {
                        
                        
                        
                        do{
                            
                            
                            
                            TBXMLElement *EmployeeOrganizationId = [TBXML childElementNamed:@"EmployeeOrganizationId" parentElement:RelatedEmployeeOrganization1];
                            TBXMLElement *EmployeeOrganization = [TBXML childElementNamed:@"EmployeeOrganization" parentElement:RelatedEmployeeOrganization1];
                            
                            
                            
                            
                            
                            user.orgid=[TBXML textForElement:EmployeeOrganizationId];
                            
                            user.orgname=[TBXML textForElement:EmployeeOrganization];
                            
                            
                            NSLog(@"posn %@",user.orgname);
                             NSLog(@"posn %@",user.orgid);
                            
                            
                            [orgnamearray addObject:user.orgname];
                            
                            
                            [orgidarray addObject:user.orgid];
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }while ((RelatedEmployeeOrganization1 = RelatedEmployeeOrganization1->nextSibling)); {
                            
                            NSLog(@"names %@",user.orgname);
                            
                            
                            NSLog(@"position id %@",orgnamearray);
                            NSLog(@"po id%@",orgidarray);
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                } while ((Employee1 = Employee1->nextSibling));
                
                
                
                NSLog(@"username %@",app_delegate.Array1);
                
                
                
            }
            
            
            
            
            NSLog(@"arraydata %@",appdelegate.Array1);
            
            [self hideAlert];
            
            DYAlertPickView* picker = [[DYAlertPickView alloc] initWithHeaderTitle:@"Please select one position to proceed " cancelButtonTitle:nil confirmButtonTitle:@"Confirm" switchButtonTitle:nil];
            picker.delegate = self;
            picker.dataSource = self;
            [picker show];
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            NSLog(@"\nResponse....%@",response);
            
        }
        else
        {
            // [appdelegate hideAlert];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Server Error!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
- (IBAction)btnRemrmber:(id)sender {
    
    if(imageflag==0)
    {
        self.rememberImage.image=[UIImage imageNamed:@"remember_me_checked@2x.png"];
        
        //        [SSKeychain setPassword:self.password.text forService:@"AnyService" account:@"AnyUser"];
        //        [SSKeychain setPassword:self.username.text forService:@"AnyService" account:@"AnyUser1"];
        
        
        NSLog(@"Remember  ");
        imageflag=1;
    }
    else{
        
        self.rememberImage.image=[UIImage imageNamed:@"remember_me@2x.png"];
        imageflag=0;
        //  rememberflag=1;
        
        
        
        
    }
    
}

- (NSAttributedString *)DYAlertPickView:(DYAlertPickView *)pickerView
                            titleForRow:(NSInteger)row{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:userpositionnamearray[row]];
    return str;
}
- (NSInteger)numberOfRowsInDYAlertPickerView:(DYAlertPickView *)pickerView {
    return userpositionnamearray.count;
}
- (void)DYAlertPickView:(DYAlertPickView *)pickerView didConfirmWithItemAtRow:(NSInteger)row{
   
    
    
    
    
    
    
    
    
    
    NSLog(@"%@ didConfirm", userpositionnamearray[row]);
    
    userDetailsVal_.POSITION_NAME=userpositionnamearray[row];
    
    NSString *worklocation=userDetailsVal_.POSITION_NAME;
    
    
    NSArray *subStrings = [worklocation componentsSeparatedByString:@"-"]; //or rather @" - "
    NSString *firstString = [subStrings objectAtIndex:0];
    NSString *secondstring = [subStrings objectAtIndex:1];
    NSString *thirdstring = [subStrings objectAtIndex:2];
    NSString *fourthstring = [subStrings objectAtIndex:3];
    NSString *fifthstring = [subStrings objectAtIndex:4];
    NSString *sixthstring = [subStrings objectAtIndex:5];
    NSString *seventhstring = [subStrings objectAtIndex:6];
    
    NSLog(@"test location %@,%@,$@,%@,%@,%@,%@,%@",firstString,secondstring,thirdstring,fourthstring,fifthstring,sixthstring,seventhstring);
    
    userDetailsVal_.LOCATION=sixthstring;
    
    userDetailsVal_.POSTN=userposnidarray[row];
    
    
    userDetailsVal_.ORGID=orgidarray[row];
    
    userDetailsVal_.ORGNAME=orgnamearray[row];
    
    
    
    
    NSLog(@"position name %@",userDetailsVal_.POSITION_NAME);
    NSLog(@"position id %@",userDetailsVal_.POSTN);
    NSLog(@"org name %@",userDetailsVal_.ORGNAME);
    NSLog(@"org id%@",userDetailsVal_.ORGID);
    
    
    
    userDetailsVal_.USERNAME=self.username.text;
    userDetailsVal_.PASSWORD=self.password.text;
    
}

- (void)DYAlertPickerViewDidClickCancelButton:(DYAlertPickView *)pickerView {
    
    
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];
//    
//    
//    appdelegate.window.rootViewController= vc;
    
    NSLog(@"Canceled");
}

- (void)DYAlertPickerViewDidClickSwitchButton:(UISwitch *)switchButton {
    NSLog(@"switch:%@",(switchButton.isOn?@"On":@"Off"));
   
    
 
    
}


-(void)confirmdone

{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
       UISplitViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SplitView"];

    
       appdelegate.window.rootViewController= vc;


}

- (BOOL)DYAlertPickerViewStateOfSwitchButton {
    return YES;
}


- (void)dy:(UISwitch *)switchButton {
    NSLog(@"switch:%@",(switchButton.isOn?@"On":@"Off"));
}

-(void)next{



}

-(void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
    
}
-(void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

- (IBAction)forgetPassword:(id)sender {
    
    if ([self.username.text isEqual:@""]) {
     
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{
    
    
        
        
        [self mail];
        
    
    
    
    
    }
    


}

-(void)mail{


    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        
        [mail setSubject:@"Sample Subject"];
        [mail setMessageBody:@"Here is some main text in the email!" isHTML:NO];
        [mail setToRecipients:@[@"nihalshaikh1992@gmail.com"]];
        
        [self presentViewController:mail animated:NO completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }


}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



@end
