#import "CreateOpportunityViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "MBProgressHUD.h"

@interface CreateOpportunityViewController ()

@end

@implementation CreateOpportunityViewController

UIAlertView *alert;

NSPredicate *emailTest;
NSString *emailRegEx;
NSPredicate *mobileNumberPred;
NSString *mobileNumberPattern;

UIActionSheet *actionSheet;
- (void)viewDidLoad {
    
    
    
     userDetailsVal_ = [GlobalDetails sharedmanager];
    NSLog(@"position name%@",userDetailsVal_.POSITION_NAME);
    
    NSLog(@"position name%@",userDetailsVal_.POSTN);
    
    
    NSLog(@"org name%@",userDetailsVal_.ORGNAME);
    
    NSLog(@"org id%@",userDetailsVal_.ORGID);
    NSLog(@"estatus %@",userDetailsVal_.ESTATUS);
    
    
    emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    mobileNumberPattern = @"[789][0-9]{9}";
    mobileNumberPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileNumberPattern];
    
   self.accountstatus = [[NSMutableArray alloc]initWithObjects:@"Active",@"Inactive", nil];
   
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_strip.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *btnInfo =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnInfo setImage:[UIImage imageNamed:@"icon_info.png"] forState:UIControlStateNormal];
    [btnInfo addTarget:self action:@selector(info_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnInfo setFrame:CGRectMake(-15, -5, 40, 40)];
    
    UIButton *btnLogout =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogout setImage:[UIImage imageNamed:@"icon_logout.png"] forState:UIControlStateNormal];
    [btnLogout addTarget:self action:@selector(logOut_btn) forControlEvents:UIControlEventTouchUpInside];
    [btnLogout setFrame:CGRectMake(44, -5, 40, 40)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(10,10,90,40)];
    [rightBarButtonItems addSubview:btnInfo];
    [rightBarButtonItems addSubview:btnLogout];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
    
    // textfiled placeholder image
    
    self.txtfldemailid.delegate=self;
    self.mobilenumbertxtfield.delegate=self;
    
    self.txtfldsite.delegate=self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(countfound:) name:@"createcontact_found" object:nil];
    
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(accountfound:) name:@"createaccount_found" object:nil];
    
    //createcontact_found
}



-(void)viewDidDisappear:(BOOL)animated{
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"createcontact_found" object:nil];//abhishek // For opportunity Count
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"createaccount_found" object:nil];//abhishek // For opportunity Count
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)info_btn
{
    //  NSLog(@"Home biscuit from Sanfrancisco");
    [self performSegueWithIdentifier:@"infoView" sender:self];

}
-(void)logOut_btn
{
    // flag=true;
    alert = [[UIAlertView alloc] initWithTitle:@"JLR"
                                       message:@"Do you want to Logout ?"
                                      delegate:self
                             cancelButtonTitle:@"No"
                             otherButtonTitles:@"Yes",nil];
    [alert show];
    //  NSLog(@"Home biscuit from Sanfrancisco");
}
// delegate mehod for uialertView

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        
        NSLog(@"David Miller");
    }
    if (buttonIndex==1) {
        NSLog(@"Glen Maxwell");
        LoginViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        //[self.navigationController pushViewController:secondViewController animated:YES];
        [self presentViewController:secondViewController animated:YES completion:nil ];
        //[self.navigationController popToRootViewControllerAnimated:TRUE];
        // [self dismissViewControllerAnimated:YES completion:nil];
        // [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
        //[self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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
#pragma mark - Split view
//scroll view





- (IBAction)btncustomerType:(id)sender {
}

- (IBAction)btnfinancierName:(id)sender{
}

- (IBAction)btnppl:(id)sender {
}

- (IBAction)btnapp:(id)sender{
}

- (IBAction)btnsource:(id)sender {
}

- (IBAction)btnlob:(id)sender{
    
}

- (IBAction)btnpl:(id)sender{
    
}





- (IBAction)btncreatelead:(id)sender {
    
    
    
    
}
- (IBAction)createaccountaction:(id)sender {
    
    [self showAlert];
    
    if ([self.txtfldName.text isEqual:@""]) {
        
        [self hideAlert];        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter FIRST NAME" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    
    else if ([self.txtfldsite.text isEqual:@""]) {
        
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter SITE" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    
    else if ([self.txtfldmobilenumber.text isEqual:@""]) {
        
        
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    else if (self.txtfldmobilenumber.text && self.txtfldmobilenumber.text.length < 10) {
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else if  ([mobileNumberPred evaluateWithObject:self.txtfldmobilenumber.text] != YES && [self.txtfldmobilenumber.text length]!=0)
    {
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JLR" message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
    }
    
    else{
        
    [self callaccountconnection];
        
        
        
        
        
    }
    
    
    

    
}
- (IBAction)skipaction:(id)sender {
    
    
    [self.Ceatecontactview setHidden:YES];
    [self.createaccount setHidden:YES];
    [self.createLeadview setHidden:NO];
    
    
    
    [self.accountleadlinkerimage setImage:[UIImage imageNamed: @"filled_space.png"]];
    
    [self.createleadimage setImage:[UIImage imageNamed: @"create_lead2.png"]];
    
    [self.createaccountImage setImage:[UIImage imageNamed:@"add_account1.png"]];
    
}
- (IBAction)createbuttonaction:(id)sender {
    

    [self showAlert];
    
    if ([self.firstnametxtfld.text isEqual:@""]) {
        
        [self hideAlert];        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter FIRST NAME" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    
    else if ([self.txtfldlastname.text isEqual:@""]) {
        
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter LAST NAME" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    
    else if ([self.mobilenumbertxtfield.text isEqual:@""]) {
        
        
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    else if (self.mobilenumbertxtfield.text && self.mobilenumbertxtfield.text.length < 10) {
        [self hideAlert];
        
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else if  ([mobileNumberPred evaluateWithObject:self.mobilenumbertxtfield.text] != YES && [self.mobilenumbertxtfield.text length]!=0)
    {
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JLR" message:@"Please enter valid CELL NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
    }
    
    else if ([self.txtfldemailid.text isEqual:@""]){
        
        
        
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JLR" message:@"Please enter EMAIL ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
    }
    
    else if  ([emailTest evaluateWithObject:self.txtfldemailid.text] != YES && [self.txtfldemailid.text length]!=0)
    {
        [self hideAlert];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JLR" message:@"Please enter valid EMAIL ADDRESS" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    else{
        
        
        [self callcontactcreation];
        
    }
    
    
    
    
}


-(void)callcontactcreation
{
    
    
    
    NSString *envelopeText = [NSString stringWithFormat:
                              @"<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<soapenv:Header>"
                              @"<UsernameToken xmlns=\"http://siebel.com/webservices\">%@</UsernameToken>"
                              @"<PasswordText xmlns=\"http://siebel.com/webservices\">%@</PasswordText>"
                              @"</soapenv:Header>"
                              @"<soapenv:Body>"
                              @"<asi:SiebelContactInsertOrUpdate soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                              @"<SiebelMessage xsi:type=\"con:ListOfContactInterfaceTopElmt\" xmlns:con=\"http://www.siebel.com/xml/Contact%%20Interface\">"
                              @"<ListOfContactInterface xsi:type=\"xsd:string\">"
                              @"<Contact xsi:type=\"xsd:string\">"
                              @"<CellularPhone xsi:type=\"ns0:string\">%@</CellularPhone>"
                              @"<FirstName xsi:type=\"ns0:string\">%@</FirstName>"
                              @"<EmailAddress xsi:type=\"ns0:string\">%@</EmailAddress>"
                              @"<LastName xsi:type=\"ns0:string\">%@</LastName>"
                              @"<IntegrationId xsi:type=\"ns0:string\">%ld</IntegrationId>"
                              @"<ListOfRelatedSalesRep xsi:type=\"ns:ListOfRelatedSalesRep\">"
                              @"<RelatedSalesRep IsPrimaryMVG=\"Y\" xsi:type=\"ns:RelatedSalesRep\">"
                              @"<Id xsi:type=\"ns0:string\">%@</Id>"
                              @"</RelatedSalesRep>"
                              @"</ListOfRelatedSalesRep>"
                              @"<ListOfRelatedOrganization xsi:type=\"ns:ListOfRelatedOrganization\">"
                              @"<RelatedOrganization IsPrimaryMVG=\"Y\" xsi:type=\"ns:RelatedOrganization\">"
                              @"<Organization xsi:type=\"ns0:string\">%@</Organization>"
                              @"<Id xsi:type=\"ns0:string\">%@</Id>"
                              @"</RelatedOrganization>"
                              @"</ListOfRelatedOrganization>"
                              @"</Contact>"
                              @"</ListOfContactInterface>"
                              @"</SiebelMessage>"
                              @"</asi:SiebelContactInsertOrUpdate>"
                              @"</soapenv:Body>"
                              @"</soapenv:Envelope>",userDetailsVal_.USERNAME,userDetailsVal_.PASSWORD,self.mobilenumbertxtfield.text,self.firstnametxtfld.text,self.txtfldemailid.text,self.txtfldlastname.text,(long)[[NSDate date]timeIntervalSince1970],userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,userDetailsVal_.ORGID];
    
    
    
    
    
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    // NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    
    
    //NSURL * theurl = [NSURL URLWithString:@"http://1:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    
    
    
    // NSURL * theurl = [NSURL URLWithString:@"https://dms-india.jlrext.com/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    //
    //    // NSURL * theurl = [NSURL URLWithString:@"http://121.244.87.75:7777/eai_enu/start.swe?SWEExtSource=WebService&SWEExtCmd=Execute&UserName=DaTa_ADMIN&Password=A1S2U3S4"];
    //
    //    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.75:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    
    
    NSLog(@"URL IS %@",theurl);
    NSLog(@"REQUEST IS %@",envelopeText);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"contactcreateupdaterequest"];
    
    
}

-(void)countfound:(NSNotification*)notification
{
    
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    if ([response rangeOfString:@"SOAP-ENV:Fault"].location != NSNotFound )
    {
        [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Something Went Wrong. Please try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        
        
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *soapBody = [TBXML childElementNamed:@"SOAP-ENV:Body" parentElement:tbxml.rootXMLElement];
        TBXMLElement *container = [TBXML childElementNamed:@"rpc:SiebelContactInsertOrUpdateResponse" parentElement:soapBody];
        if(container)
        {
            
            TBXMLElement *SiebelMessage = [TBXML childElementNamed:@"SiebelMessage" parentElement:container];
            TBXMLElement *ListOfContactInterface = [TBXML childElementNamed:@"ListOfContactInterface" parentElement:SiebelMessage];
            TBXMLElement *Contact = [TBXML childElementNamed:@"Contact" parentElement:ListOfContactInterface];
            TBXMLElement *Contact1 = [TBXML childElementNamed:@"Contact" parentElement:Contact];
            TBXMLElement *Integration = [TBXML childElementNamed:@"Id" parentElement:Contact1];
            
            
            if (Integration)
            {
                
                NSString *ContactID=[TBXML textForElement:Integration];
                
                NSLog(@"contact %@",ContactID);
                
                [self hideAlert];
                
                
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Contact created successfully" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];
                
                
                [self.Ceatecontactview setHidden:YES];
                [self.createaccount setHidden:NO];
                [self.createLeadview setHidden:YES];
                
                [self.contactaccountLinkerImage setImage:[UIImage imageNamed: @"filled_space.png"]];
                
                [self.createaccountImage setImage:[UIImage imageNamed: @"add_account2.png"]];
                
                
                
            }
            else
            {
                
                
                [self hideAlert];
                
                
                
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"JLR" message:@"Contact creation failed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
                [alertView show];
                
            }
            
            
            
            //
            
            
            
        }
    }
    
    
}


-(void)showAlert
{
    [MBProgressHUD showHUDAddedLoading:self.view animated:YES];
    
}
-(void)hideAlert
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self.txtfldemailid])
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.01];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.center = CGPointMake(self.view.center.x,130.0);
        [UIView commitAnimations];
    }
    if ([sender isEqual:self.mobilenumbertxtfield])
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.01];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.center = CGPointMake(self.view.center.x,130.0);
        [UIView commitAnimations];
    }
    if ([sender isEqual:self.txtfldsite])
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.01];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.center = CGPointMake(self.view.center.x,130.0);
        [UIView commitAnimations];
    }
    
}
-(void)keyboardWillHide {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.center =  CGPointMake(self.view.center.x, 385.0);
    [UIView commitAnimations];
    
}


-(void)callaccountconnection{

    
    NSString *envelopeText1 = [NSString stringWithFormat:
                               @"<soapenv:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:asi=\"http://siebel.com/asi/\" xmlns:soapenc=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                               @"<soapenv:Header>"
                               @"<UsernameToken xmlns=\"http://siebel.com/webservices\">%@</UsernameToken>"
                               @"<PasswordText xmlns=\"http://siebel.com/webservices\">%@</PasswordText>"
                               @"</soapenv:Header>"
                               
                               @"<soapenv:Body>"
                               @"<asi:JLRSiebelInsertOrUpdate soapenv:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">"
                               @"<SiebelMessage xsi:type=\"jlr:ListOfJlrAccountIioTopElmt\" xmlns:jlr=\"http://www.siebel.com/xml/JLR%%20Account%%20IIO\">"
                               @"<ListOfJlrAccountIio xsi:type=\"jlr:ListOfJlrAccountIio\">"
                               @"<jlr:Account Operation=\"\">"
                               @"<jlr:IntegrationId xsi:type=\"ns0:string\">%ld</jlr:IntegrationId>"
                               @"<jlr:AccountStatus xsi:type=\"ns0:string\">%@</jlr:AccountStatus>"
                               @"<jlr:MainPhoneNumber xsi:type=\"ns0:string\">%@</jlr:MainPhoneNumber>"
                               @"<jlr:Name xsi:type=\"ns0:string\">%@</jlr:Name>"
                               @"<jlr:Location xsi:type=\"ns0:string\">%@</jlr:Location>"
                               @"<jlr:ListOfAccount_Position xsi:type=\"ns:ListOfAccount_Position\">"
                               @"<jlr:Account_Position IsPrimaryMVG=\"Y\" xsi:type=\"ns:ListOfAccount_Position\">"
                               @"<jlr:Position xsi:type=\"ns0:string\">%@</jlr:Position>"
                               @"<jlr:PositionId xsi:type=\"ns0:string\">%@</jlr:PositionId>"
                               @"</jlr:Account_Position>"
                               @"</jlr:ListOfAccount_Position>"
                               @"<jlr:ListOfAccount_Organization xsi:type=\"ns:ListOfAccount_Organization\">"
                               @"<jlr:Account_Organization IsPrimaryMVG=\"Y\" xsi:type=\"ns:Account_Organization\">"
                               @"<jlr:Organization xsi:type=\"ns0:string\">%@</jlr:Organization>"
                               @"<jlr:OrganizationId xsi:type=\"ns0:string\">%@</jlr:OrganizationId>"
                               @"</jlr:Account_Organization>"
                               @"</jlr:ListOfAccount_Organization>"
                               @"</jlr:Account>"
                               @"</ListOfJlrAccountIio>"
                               @"</SiebelMessage>"
                               @"<StatusObject xsi:type=\"xsd:string\">?</StatusObject>"
                               @"</asi:JLRSiebelInsertOrUpdate>"
                               @"</soapenv:Body>"
                               @"</soapenv:Envelope>",userDetailsVal_.USERNAME,userDetailsVal_.PASSWORD,(long)[[NSDate date]timeIntervalSince1970],userDetailsVal_.ESTATUS,self.txtfldmobilenumber.text,self.txtfldName.text,self.txtfldsite.text,userDetailsVal_.POSITION_NAME,userDetailsVal_.POSTN,userDetailsVal_.ORGNAME,userDetailsVal_.ORGID];
    
    
    
    
    
    
    
    
    NSData *envelope = [envelopeText1 dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    // NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.89:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    
    
    //NSURL * theurl = [NSURL URLWithString:@"http://1:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    
    
    
    // NSURL * theurl = [NSURL URLWithString:@"https://dms-india.jlrext.com/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];
    //
    //    // NSURL * theurl = [NSURL URLWithString:@"http://121.244.87.75:7777/eai_enu/start.swe?SWEExtSource=WebService&SWEExtCmd=Execute&UserName=DaTa_ADMIN&Password=A1S2U3S4"];
    //
    //    NSURL *theurl = [NSURL URLWithString:@"http://121.244.87.75:7777/eai_enu/start.swe?SWEExtSource=WebService&WSSOAP=1"];//Abhishek
    
    
    NSLog(@"URL IS %@",theurl);
    NSLog(@"REQUEST IS %@",envelopeText1);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:50];
    NSString * msglength = [NSString stringWithFormat:@"%lu",(unsigned long)[envelopeText1 length]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:msglength forHTTPHeaderField:@"Content-Length"];
    [[RequestDelegate alloc]initiateRequest:request name:@"accountcreateupdaterequest"];



}


-(void)accountfound:(NSNotification*)notification
{
    
    NSError *err;
    NSString *response=[[notification userInfo]objectForKey:@"response"];
    NSLog(@"\nResponse....%@",response);
    
    if ([response rangeOfString:@"SOAP-ENV:Fault"].location != NSNotFound )
    {
        // [self hideAlert];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Attention!" message:@"Something Went Wrong. Please try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    else{
        
        
        
        
        TBXML * tbxml = [TBXML newTBXMLWithXMLString:response error:&err];
        
        TBXMLElement *soapBody = [TBXML childElementNamed:@"SOAP-ENV:Body" parentElement:tbxml.rootXMLElement];
        TBXMLElement *container = [TBXML childElementNamed:@"rpc:JLRSiebelInsertOrUpdateResponse" parentElement:soapBody];
        if(container)
        {
            
            TBXMLElement *SiebelMessage = [TBXML childElementNamed:@"SiebelMessage" parentElement:container];
            TBXMLElement *ListOfContactInterface = [TBXML childElementNamed:@"ListOfJlrAccountIio" parentElement:SiebelMessage];
            TBXMLElement *Account = [TBXML childElementNamed:@"Account" parentElement:ListOfContactInterface];
            TBXMLElement *Account1 = [TBXML childElementNamed:@"Account" parentElement:Account];
            TBXMLElement *Integration = [TBXML childElementNamed:@"Id" parentElement:Account1];
            
            
            if (Integration)
            {
                
                NSString *ContactID=[TBXML textForElement:Integration];
                
                NSLog(@"contact %@",ContactID);
                
                [self hideAlert];
                
                
                UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"JLR" message:@"Account created successfully" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alertView show];
                
             
                    [self.Ceatecontactview setHidden:YES];
                    [self.createaccount setHidden:YES];
                    [self.createLeadview setHidden:NO];
                
                
                    [self.accountleadlinkerimage setImage:[UIImage imageNamed: @"filled_space.png"]];
                
                    [self.createleadimage setImage:[UIImage imageNamed: @"create_lead2.png"]];
                
                [self.contactaccountLinkerImage setImage:[UIImage imageNamed: @"filled_space.png"]];
                
                [self.createaccountImage setImage:[UIImage imageNamed: @"add_account2.png"]];
                
            }
            else
            {
                
                
                [self hideAlert];
                
                
                
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"JLR" message:@"Account creation failed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
                [alertView show];
                
            }
            
            
            
            
            
            
            
        }
        
    }
    
    
}













- (IBAction)BUTTONTYPE:(id)sender {
    
    
    [self.txtfldAccountType resignFirstResponder];
actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    for (NSString *title in self.accountstatus) {
        [actionSheet addButtonWithTitle:title];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.createaccount animated:YES];
    }
    
    
    else{
        
        [actionSheet showInView:self.view];
        
    }
    
    actionSheet.tag = 4;
    
    
    
}


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(self.txtfldAccountType){
        switch (popup.tag) {
            case 4:
                if(buttonIndex == actionSheet.cancelButtonIndex)
                {
                    return;
                }
                else{
                    
                    NSLog(@"Button index %ld",(long)buttonIndex);
                   self.txtfldAccountType.text = NSLocalizedString([self.accountstatus objectAtIndex:buttonIndex],@"");
                }
                
        }
    }
    
    
}


@end
