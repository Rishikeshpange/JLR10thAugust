#import "CreateOpportunityViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RequestDelegate.h"
#import "TBXML.h"
#import "MBProgressHUD.h"

@interface CreateOpportunityViewController ()
{

    
    NSMutableArray *_lobarray,*_pplarrayjaguar,*_pplarraylandrover,*_ftypearray,*_ftypeproductid,*_xetypearray,*_xetypeproductid,*_xftypearray,*_xftypeproductid,*_xjtypearray,*_xjtypeproductid,*_xktypearray,*_xktypeproductid,*_discoverytypearray,*_discoveryproductid,*_freelandertypearray,*_freelanderproductid,*_autobiographytypearray,*_autobiographyproductid,*_evoquetypearray,*_evoqueproductid,*_sporttypearray,*_sporttypeproductid,*_voguetypearray,*_voguetypeproductid;

    NSString *lobselectflag,*pplselectflag;
    
}
@end

@implementation CreateOpportunityViewController

UIAlertView *alert;


NSPredicate *emailTest;
NSString *emailRegEx;
NSPredicate *mobileNumberPred;
NSString *mobileNumberPattern;

UIActionSheet *actionSheet;






- (void)viewDidLoad {
    
    
    _lobarray=[[NSMutableArray alloc]initWithObjects:@"Jaguar",@"Land Rover", nil];
    
    
    
    //jaguar
    
    
    
    _pplarrayjaguar=[[NSMutableArray alloc]initWithObjects:@"F-Type",@"XE",@"XF",@"XJ",@"XKR", nil];
    
    _ftypearray=[[NSMutableArray alloc]initWithObjects:@"3.0L S/C Convertible",@"3.0L S/C Coupe",@"5.0L S/C Convertible",@"5.0L S/C Coupe", nil];
    
    _ftypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000214079",@"5000226707",@"5000226090",@"5000226703", nil];
    
    
    _xetypearray=[[NSMutableArray alloc]initWithObjects:@"2.0L Diesel Portfolio",@"2.0L Diesel Pure", nil];
    
    _xetypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000264928",@"5000264926", nil];
    
    
    
    _xftypearray=[[NSMutableArray alloc]initWithObjects:@"2.0L Petrol Luxury",@"2.2L Diesel  Aero Sport",@"2.2L Diesel Executive",@"2.2L Diesel Luxury",@"3.0L Diesel Portfolio",@"3.0L Diesel Premium Luxury",@"5.0L Portfolio",@"5.0L Supercharge R",nil];
    
    _xftypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000214047",@"5000264746",@"5000259967",@"5000214081",@"5000214057",@"5000214056",@"5000131827",@"5000214074",nil];
    
    
    _xjtypearray=[[NSMutableArray alloc]initWithObjects:@"2.0L Petrol Luxury LWB",@"2.0L Petrol Portfolio",@"2.0L Petrol Portfolio LWB",@"2.0L Petrol Premium Luxury LWB",@"3.0L Diesel Luxury LWB",@"3.0L Diesel Portfolio LWB",@"3.0L Diesel Premium Luxury LWB",@"3.0L Diesel Ultimate LWB",@"3.0L Petrol Portfolio LWB",@"5.0L Autobiography LWB",@"5.0L Portfolio LWB",@"5.0L Supersport LWB",@"5.0L Ultimate LWB",nil];
    
    _xjtypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000214065",@"5000242046",@"5000214069",@"5000214067",@"5000214054",@"5000214052",@"5000214048",@"5000176382",@"5000214058",@"5000250020",@"5000128415",@"5000214075",@"5000176400",nil];
    
    
    
    _xktypearray=[[NSMutableArray alloc]initWithObjects:@"5.0L Convertible",@"5.0L Coupe", nil];
    
    _xktypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000135107",@"5000134863", nil];
    
    
    _pplarraylandrover=[[NSMutableArray alloc]initWithObjects:@"Discovery",@"Freelander",@"Range Rover Autobiography",@"Range Rover Evoque",@"Range Rover Sport",@"Range Rover Vogue",nil];
    
    
    
    _discoverytypearray=[[NSMutableArray alloc]initWithObjects:@"2.7L Diesel HSE",@"3.0L Diesel SDV6 HSE",@"3.0L Diesel SDV6 S",@"3.0L Diesel SDV6 SE",@"3.0L Diesel TDV6 HSE",@"3.0L Petrol S/C SE",nil];
    
    _discoveryproductid=[[NSMutableArray alloc]initWithObjects:@"5000077190",@"5000203780",@"5000196608",@"5000203782",@"5000091737",@"5000196622", nil];
    
    
    _freelandertypearray=[[NSMutableArray alloc]initWithObjects:@"2.2L Diesel HSE",@"2.2L Diesel S",@"2.2L Diesel SE", nil];
    
    _freelanderproductid=[[NSMutableArray alloc]initWithObjects:@"5000137088",@"5000175049",@"5000137087", nil];
    
    
    _autobiographytypearray=[[NSMutableArray alloc]initWithObjects:@"4.4L Diesel Autobiography",@"5.0L Petrol Autobiography", nil];
    
    _autobiographyproductid=[[NSMutableArray alloc]initWithObjects:@"5000221368",@"5000203778", nil];
    
    
    _evoquetypearray=[[NSMutableArray alloc]initWithObjects:@"2.0L Petrol Si4 Dynamic",@"2.0L Petrol Si4 Dynamic Coupe",@"2.0L Petrol Si4 Prestige",@"2.0L Petrol Si4 Pure",@"2.0L Petrol Si4 Pure Coupe",@"2.2L Diesel SD4 Dynamic",@"2.2L Diesel SD4 Prestige",@"2.2L Diesel SD4 Pure", nil];
    
    _evoqueproductid=[[NSMutableArray alloc]initWithObjects:@"5000183099",@"5000129181",@"5000183100",@"5000198745",@"5000129179",@"5000183112",@"5000183113",@"5000183111",nil];
    
    
    _sporttypearray=[[NSMutableArray alloc]initWithObjects:@"2.0L Petrol Si4 HSE",@"2.2L Diesel SD4 HSE",@"2.2L Diesel TD4 HSE",@"3.0L Diesel HSE",@"3.0L Diesel SDV6 Autobiography",@"3.0L Diesel SDV6 HSE Sport",@"3.0L Diesel SDV6 S Sport",@"3.0L Diesel SDV6 SE Sport",@"3.0L Diesel SE Sport",@"3.0L Petrol S/C HSE Sport",@"3.0L Petrol S/C SE Sport",@"3.6L Diesel HSE Sport",@"5.0L Petrol S/C Autobiography", nil];
    
    _sporttypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000249481",@"5000249479",@"5000249476",@"5000130760",@"5000220189",@"5000220185",@"5000220186",@"5000220187",@"5000132112",@"5000220191",@"5000220190",@"5000077723",@"5000220183", nil];
    
    
    _voguetypearray=[[NSMutableArray alloc]initWithObjects:@"3.0L Diesel TDV6 HSE Vogue",@"3.0L Diesel TDV6 Vogue",@"3.0L Petrol S/C Vogue",@"3.6L Diesel SE Vogue",@"4.4L Diesel SDV8 SE Vogue",@"4.4L Diesel SDV8 SE Vogue", nil];
    
    _voguetypeproductid=[[NSMutableArray alloc]initWithObjects:@"5000183106",@"5000183107",@"5000223237",@"5000081078",@"5000219203", nil];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    
    
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    if ([lobselectflag isEqualToString:@"jaguar"]) {
      
        for (NSString *title in _pplarrayjaguar) {
            [actionSheet addButtonWithTitle:title];
        }
        
    }
    else{
    
    for (NSString *title in _pplarraylandrover) {
        [actionSheet addButtonWithTitle:title];
    }
        
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.createLeadview animated:YES];
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    }
    else{
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 4;
    
    
    
    
    
}

- (IBAction)btnapp:(id)sender{
}

- (IBAction)btnsource:(id)sender {
}

- (IBAction)btnlob:(id)sender{
    
  
    
  
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
                                     otherButtonTitles:nil];
    // ObjC Fast Enumeration
    for (NSString *title in _lobarray) {
        [actionSheet addButtonWithTitle:title];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.createLeadview animated:YES];
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    }
    else{
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 3;
    
   
    
}

- (IBAction)btnpl:(id)sender{
    
    
    
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                              delegate:self
                                     cancelButtonTitle:nil
                                destructiveButtonTitle:nil
     
                   
                                otherButtonTitles:nil];
    
    
    //F-Type",@"XE",@"XF",@"XJ",@"XKR",
    
    if ([lobselectflag isEqualToString:@"jaguar"]) {

    
    if ([pplselectflag isEqualToString:@"F-Type"]) {
        
        for (NSString *title in _ftypearray) {
            [actionSheet addButtonWithTitle:title];
        }
        
    }
    
   else if ([pplselectflag isEqualToString:@"XE"]) {
        
        for (NSString *title in _xetypearray) {
            [actionSheet addButtonWithTitle:title];
        }
        
    }
   else if ([pplselectflag isEqualToString:@"XF"]) {
       
       for (NSString *title in _xftypearray) {
           [actionSheet addButtonWithTitle:title];
       }
       
   }
   else if ([pplselectflag isEqualToString:@"XJ"]) {
       
       for (NSString *title in _xjtypearray) {
           [actionSheet addButtonWithTitle:title];
       }
       
   }
   else if ([pplselectflag isEqualToString:@"XKR"]) {
       
       for (NSString *title in _xktypearray) {
           [actionSheet addButtonWithTitle:title];
       }
       
   }
        
        
   
    }
    
    
    else{
        
        // _pplarraylandrover=[[NSMutableArray alloc]initWithObjects:@"Discovery",@"Freelander",@"Range Rover Autobiography",@"Range Rover Evoque",@"Range Rover Sport",@"Range Rover Vogue",nil];
        
        
        
        if ([pplselectflag isEqualToString:@"Discovery"]) {
            
            for (NSString *title in _discoverytypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }
        
        else if ([pplselectflag isEqualToString:@"Freelander"]) {
            
            for (NSString *title in _freelandertypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }
        else if ([pplselectflag isEqualToString:@"Range Rover Autobiography"]) {
            
            for (NSString *title in _autobiographytypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }
        else if ([pplselectflag isEqualToString:@"Range Rover Evoque"]) {
            
            for (NSString *title in _evoquetypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }
        else if ([pplselectflag isEqualToString:@"Range Rover Sport"]) {
            
            for (NSString *title in _sporttypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }
        else if ([pplselectflag isEqualToString:@"Range Rover Vogue"]) {
            
            for (NSString *title in _voguetypearray) {
                [actionSheet addButtonWithTitle:title];
            }
            
        }

    
    }
    
    
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [actionSheet showFromRect:[(UITextField *)sender frame] inView:self.createLeadview animated:YES];
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    }
    else{
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 5;
    
    
    
    
    
    
    
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
    
    NSLog(@"button click ....%ld",(long)buttonIndex);
    //if
    if(self.txtfldlob){
        switch (popup.tag) {
            case 3:
                if(buttonIndex == actionSheet.cancelButtonIndex)
                {    return;
                }else{
                    NSLog(@"Button index %ld",(long)buttonIndex);
                    self.txtfldlob.text = NSLocalizedString([_lobarray objectAtIndex:buttonIndex],@"");
                }
                
                if (buttonIndex==0) {
                    
             
                  lobselectflag = @"jaguar";
                    
                }
                else {
                   
                 
                    
                    lobselectflag = @"land rover";
                    
                
                }
                self.txtfldppl.text=@"";
                self.txtfldpl.text=@"";
                
           
        }
    }
    
    if(self.txtfldppl){
        switch (popup.tag) {
            case 4:
                if(buttonIndex == actionSheet.cancelButtonIndex)
                {    return;
                }else{
                    NSLog(@"Button index %ld",(long)buttonIndex);
                    
                    if ([lobselectflag isEqualToString:@"jaguar"]) {
                        self.txtfldppl.text = NSLocalizedString([_pplarrayjaguar objectAtIndex:buttonIndex],@"");
                        
                        pplselectflag=self.txtfldppl.text;
                        
                        NSLog(@"ppl value %@",pplselectflag);
                        
                    }
                    else{
                    
                    self.txtfldppl.text = NSLocalizedString([_pplarraylandrover objectAtIndex:buttonIndex],@"");
                        
                          pplselectflag=self.txtfldppl.text;                    }
                }
                
          self.txtfldpl.text=@"";
                
        }
    }
    
    
    if(self.txtfldpl){
        switch (popup.tag) {
            case 5:
                if(buttonIndex == actionSheet.cancelButtonIndex)
                {    return;
                }else{
                    NSLog(@"Button index %ld",(long)buttonIndex);
                    
                    if ([lobselectflag isEqualToString:@"jaguar"]) {
                        
                     
                            if ([pplselectflag isEqualToString:@"F-Type"]) {
                                
                                self.txtfldpl.text = NSLocalizedString([_ftypearray objectAtIndex:buttonIndex],@"");
                                
                            
                                }
                                
                          
                            
                            else if ([pplselectflag isEqualToString:@"XE"]) {
                                
                               self.txtfldpl.text = NSLocalizedString([_xetypearray objectAtIndex:buttonIndex],@"");
                                
                            }
                            else if ([pplselectflag isEqualToString:@"XF"]) {
                                
                               self.txtfldpl.text = NSLocalizedString([_xftypearray objectAtIndex:buttonIndex],@"");
                                
                            }
                            else if ([pplselectflag isEqualToString:@"XJ"]) {
                                
                                self.txtfldpl.text = NSLocalizedString([_xjtypearray objectAtIndex:buttonIndex],@"");
                                
                            }
                            else if ([pplselectflag isEqualToString:@"XKR"]) {
                                
                                 self.txtfldpl.text = NSLocalizedString([_xktypearray objectAtIndex:buttonIndex],@"");
                                
                            }
                            
                            
                            
                        }
                    else{
                        
                        
                        if ([pplselectflag isEqualToString:@"Discovery"]) {
                            
                                        self.txtfldpl.text = NSLocalizedString([_discoverytypearray objectAtIndex:buttonIndex],@"");
                            
                        }
                        
                        else if ([pplselectflag isEqualToString:@"Freelander"]) {
                            
                                          self.txtfldpl.text = NSLocalizedString([_freelandertypearray objectAtIndex:buttonIndex],@"");
                            
                        }
                        else if ([pplselectflag isEqualToString:@"Range Rover Autobiography"]) {
                            
                             self.txtfldpl.text = NSLocalizedString([_autobiographytypearray objectAtIndex:buttonIndex],@"");
                            
                        }
                        else if ([pplselectflag isEqualToString:@"Range Rover Evoque"]) {
                            
                                          self.txtfldpl.text = NSLocalizedString([_evoquetypearray objectAtIndex:buttonIndex],@"");
                            
                        }
                        else if ([pplselectflag isEqualToString:@"Range Rover Sport"]) {
                            
                                          self.txtfldpl.text = NSLocalizedString([_sporttypearray objectAtIndex:buttonIndex],@"");
                            
                        }
                        else if ([pplselectflag isEqualToString:@"Range Rover Vogue"]) {
                            
                                          self.txtfldpl.text = NSLocalizedString([_voguetypearray objectAtIndex:buttonIndex],@"");
                            
                        }

                }
                        
                        
                   
                }
                
                
                
        }
    }
    
}



@end
