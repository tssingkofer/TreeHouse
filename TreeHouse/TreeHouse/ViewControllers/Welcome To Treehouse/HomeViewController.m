//
//  HomeViewController.m
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import "HomeViewController.h"
#import "ParentViewController.h"

@interface HomeViewController ()

@end
ParseInterface *parse;
@implementation HomeViewController


@synthesize fNameText, insert, fName, lName, mi, address, city, state, zip, homePhone, cellPhone, eMail, DOB, age, gender, gradDate, grade, middleSchool, highSchool, livingField, ethnicityField, referralField, lastLocation, Hispanic, freeLunch;
//warning labels
@synthesize fNameL, lNameL, addressL, cityL, ageL, stateL, zipL, birthL, genderL, livingL, ethnicityL, referralL;
//@synthesize MIName;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ParseInterface *parse = [ParseInterface alloc];
    //NSString *fNameString = fNameText.text;
    //ParentViewController *PVC = [segue destinationViewController];
    //PVC.firstName = fNameString;
    //NSLog(@"Sender = %@", sender);
        NSLog(@"Prepare for Segue");
    /*[insert addObject:@{@"FirstName": fName.text}];
    [insert addObject:@{@"LastName": lName.text}];
    [insert addObject:@{@"MI": mi.text}];
    [insert addObject:@{@"Address": address.text}];
    [insert addObject:@{@"City": city.text}];
    [insert addObject:@{@"State": state.text}];
    [insert addObject:@{@"Zip": zip.text}];
    [insert addObject:@{@"PhoneHome": homePhone.text}];
    [insert addObject:@{@"PhoneMobile": cellPhone.text}];
    [insert addObject:@{@"Email": eMail.text}];
    [insert addObject:@{@"DOB": DOB.text}];
    [insert addObject:@{@"Age": age.text}];
    [insert addObject:@{@"Gender": gender.text}];
    [insert addObject:@{@"Grade": grade.text}];
    [insert addObject:@{@"School": middleSchool.text}];
    [insert addObject:@{@"HighSchool": highSchool.text}];
    [insert addObject:@{@"GradDate": gradDate.text}];*/
    //freeLunch.isOn, Hispanic.isOn,
    NSString *fl = [NSString stringWithFormat:@"%hhd", freeLunch.isOn];
    NSString *hs = [NSString stringWithFormat:@"%hhd", Hispanic.isOn];
    insert = [NSArray arrayWithObjects:fName.text,lName.text,mi.text,address.text,city.text,state.text,zip.text,homePhone.text,cellPhone.text,eMail.text,DOB.text,age.text,gender.text,grade.text,middleSchool.text,highSchool.text,gradDate.text, livingField.text, hs, fl, ethnicityField.text, referralField.text, nil];
    //insert[0] = DOB.text;
    //[insert addObject:@{@"DOB": DOB.text}];
    [parse submitName:insert];
    
UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Submission" message: @"Your information has been submitted" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = 10;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.fName becomeFirstResponder];
    self.button.enabled = NO;
    Global *global = [Global globalData];
    //NSLog(@"The ip is: %@", global.ip);
    
    ParseInterface *parse = [ParseInterface alloc];
    
    livesWith = @[@"",@"Mom", @"Dad", @"Step Mom", @"Step Dad", @"Mom's Boyfriend/Partner", @"Dad's Girlfriend/Partner", @"Brothers", @"Sisters", @"Other Relatives", @"Foster Parents"];
    
    ethnicity = @[@"",@"American Indian/Alaska Native", @"Black/African American", @"Asian", @"Native Hawaiian/PacificIslander", @"White"
                  ];
    referral = @[@"",@"Other Teen/Friend", @"Parent/Other Family Member", @"Teacher/School Counselor/School Staff", @"Pastor/Minister/Church Staff", @"Therapist/Social Worker", @"Probation Officer", @"Treehouse staff"
                      ];
    stateR = @[@"",@"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"DC", @"FL", @"GA",@"HI",@"ID",@"IL",@"IN",@"IA",@"KS",@"KY",@"LA",@"ME",@"MD",@"MA",@"MI",@"MN",@"MS",@"MO",@"MT",@"NE",@"NV",@"NH",@"NJ",@"NM",@"NY",@"NC",@"ND",@"OH",@"OK",@"OR",@"PA",@"RI",@"SC",@"SD",@"TN",@"TX",@"UT",@"VT",@"VA",@"WA",@"WV",@"WI",@"WY",@"AS",@"GU",@"MP",@"PR",@"VI",@"UM"];

    stateName = @[@"",@"Alabama",@"Alaska",@"Arizona",@"Arkansas",@"California",@"Colorado",@"Connecticut",@"Delaware",@"District of Columbia",@"Florida",@"Georgia",@"Hawaii",@"Idaho",@"Illinois",@"Indiana",@"Iowa",@"Kansas",@"Kentucky",@"Louisiana",@"Maine",@"Maryland",@"Massachusetts",@"Michigan",@"Minnesota",@"Mississippi",@"Missouri",@"Montana",@"Nebraska",@"Nevada",@"New Hampshire",@"New Jersey",@"New Mexico",@"New York",@"North Carolina",@"North Dakota",@"Ohio",@"Oklahoma",@"Oregon",@"Pennsylvania",@"Rhode Island",@"South Carolina",@"South Dakota",@"Tennessee",@"Texas",@"Utah",@"Vermont",@"Virginia",@"Washington",@"West Virginia",@"Wisconsin",@"Wyoming",@"American Samoa",@"Guam",@"Northern Mariana Islands",@"Puerto Rico",@"Virgin Islands",@"U.S. Minor Outlying Islands"];
    
    genderN = @[@"", @"M", @"F"];
    
    PickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    PickerView.delegate = self;
    
    PickerView.dataSource = self;
    
    [PickerView  setShowsSelectionIndicator:YES];

    datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,43,320,480)];
    datePicker.date = [NSDate date];
    datePicker.datePickerMode = UIDatePickerModeDate;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.timeStyle = NSDateFormatterNoStyle;
    

    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:-100];
    NSDate *minDate = [gregorian dateByAddingComponents:comps toDate:currentDate  options:0];
    datePicker.minimumDate = minDate;
    datePicker.maximumDate = [NSDate date];
    
    DOB.inputView = datePicker;
    DOB.text = [NSString stringWithFormat:@"%@", [format stringFromDate:[NSDate date]]];
    format.dateFormat = @"YYYY-MM-DD";
    [datePicker addTarget:self  action:@selector(changeDate:)
         forControlEvents:UIControlEventValueChanged];
    
    livingField.inputView =  PickerView;
    ethnicityField.inputView = PickerView;
    referralField.inputView = PickerView;
    state.inputView = PickerView;
    gender.inputView = PickerView;
    age.delegate = self;
    zip.delegate = self;
    mi.delegate = self;
    gender.delegate = self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([livingField isFirstResponder]) {
        return [livesWith count];
    }
    else if ([ethnicityField isFirstResponder]){
        return [ethnicity count];
    }
    else if ([referralField isFirstResponder]){
        return [referral count];
    }
    else if ([state isFirstResponder]){
        return [stateR count];
    }
    else if ([gender isFirstResponder]){
        return [genderN count];
    } else {
        return 0;
    }

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([livingField isFirstResponder]) {
        return [livesWith objectAtIndex:row];
    }
    else if ([ethnicityField isFirstResponder]){
        return [ethnicity objectAtIndex:row];
    }
    else if ([referralField isFirstResponder]){
        return [referral objectAtIndex:row];
    }
    else if ([state isFirstResponder]){
        if (row == 0)
        {
            return @"";
        }else{
        NSString *states = [NSString stringWithFormat:@"%@ : %@",[stateName objectAtIndex:row],[stateR objectAtIndex:row]];
        return states;
        }
    }
    else if ([gender isFirstResponder]){
        return [genderN objectAtIndex:row];
    } else {
        return 0;
    }
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    if ([livingField isFirstResponder]) {
        livingField.text = [livesWith objectAtIndex:row];
        //[lastLocation insertObject:livingField.text atIndex:0]; //Tyler this is where I was trying to store the row selected
    }
    else if ([ethnicityField isFirstResponder]){
        ethnicityField.text = [ethnicity objectAtIndex:row];
        //[lastLocation insertObject:ethnicityField.text atIndex:1];
    }
    else if ([referralField isFirstResponder]){
        referralField.text = [referral objectAtIndex:row];
        //[lastLocation insertObject:referralField.text atIndex:2];
    }
    else if ([state isFirstResponder]){
        state.text = [stateR objectAtIndex:row];
        //[lastLocation insertObject:row atIndex:3];
    }
    else if ([gender isFirstResponder]){
        gender.text = [genderN objectAtIndex:row];
    } else {
        return;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)livingEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
        [PickerView selectRow:0 inComponent:0 animated:NO]; // Tyler this is where you can set the select row.
}

- (IBAction)ethnicityEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
        [PickerView selectRow:0 inComponent:0 animated:NO];
}

- (IBAction)referralEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
        [PickerView selectRow:0 inComponent:0 animated:NO];
}
- (IBAction)stateBegin:(id)sender{
    [PickerView reloadAllComponents];
        [PickerView selectRow:0 inComponent:0 animated:NO];
}
- (IBAction)genderBegin:(id)sender{
    [PickerView reloadAllComponents];
    [PickerView selectRow:0 inComponent:0 animated:NO];

}
- (IBAction)birthEditingDidBegin:(id)sender {
    //[self.view addSubview:datePicker];

    
}

-(void) changeDate:(id) sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-dd-MM"];
    DOB.text = [dateFormatter stringFromDate:datePicker.date];
}
// Checks to ensure there is no nulls.
- (IBAction)editingBegan:(UITextField *)sender {
    if (fName.text.length  > 0)
    {
        self.fNameL.hidden = YES;
    } else
    {
        self.fNameL.hidden = NO;
    }
    if (lName.text.length > 0)
    {
        self.lNameL.hidden = YES;
    } else
    {
        self.lNameL.hidden = NO;
    }
    if (mi.text.length > 0)
    {
        self.mNameL.hidden = YES;
    } else
    {
        self.mNameL.hidden = NO;
    }
    if (address.text.length > 0)
    {
        self.addressL.hidden = YES;
    } else
    {
        self.addressL.hidden = NO;
    }
    if (city.text.length > 0)
    {
        self.cityL.hidden = YES;
    } else
    {
        self.cityL.hidden = NO;
    }
    if (state.text.length > 0)
    {
        self.stateL.hidden = YES;
    } else
    {
        self.stateL.hidden = NO;
    }
    if (zip.text.length>0 && zip.text.length==5)
    {
        self.zipL.hidden = YES;
    } else
    {
        self.zipL.hidden = NO;
    }
    if (DOB.text.length>0)
    {
        self.birthL.hidden = YES;
    } else
    {
        self.birthL.hidden = NO;
    }
    if (age.text.length>0)
    {
        self.ageL.hidden = YES;
    } else
    {
        self.ageL.hidden = NO;
    }
    if (gender.text.length >0)
    {
        self.genderL.hidden = YES;
    } else
    {
        self.genderL.hidden = NO;
    }
    if ((fName.text.length  > 0) && (lName.text.length > 0) && (mi.text.length > 0) && (address.text.length > 0) && (city.text.length > 0) && (state.text.length > 0) && (zip.text.length>0) && (zip.text.length==5) && (DOB.text.length>0) && (age.text.length>0) && (gender.text.length >0))
    {
        self.button.enabled = YES;
        /*NSDAtE *cal = DOB.text;
        
        NSDateComponents* timeOnEarth = [cal components:unitFlags fromDate:self.dateOfBirth toDate:[NSDate date] options:0];
        */
    }
    else {
        self.button.enabled = NO;
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //NSLog(@"Button Tag is : %i",[textField tag]); //this is how I figured out what text box it was after setting the tag in the storyboard
    
    // Check for non-numeric characters
    NSUInteger lengthOfString = string.length;
    for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++) {
        unichar character = [string characterAtIndex:loopIndex];
        if ([textField tag] != 3)
        {
        if (character > 57 || character < 48)
        {
            if ([textField tag] == 1)
            {
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Zipcode Field" message:@"Enter only valid numbers for your zipcode" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
            } else
            {
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Age Field" message:@"Enter only valid numbers for your age" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
            }

            return NO; // 57 unichar for 9

        }
            
    }
    }
    // Check for total length
    NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
    if ([textField tag] == 1)
    {

        if (proposedNewLength > 5)
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Zipcode Field" message:@"Enter only five digits" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            return NO;
        }
        return YES;
    } else
    {
        if ([textField tag] == 2)
        {
        if (proposedNewLength > 3)
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Age Field" message:@"Enter only three digits" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            return NO;
        }
        return YES;
    } else
    {
        if (proposedNewLength > 1)
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Middle Initial Field" message:@"Enter only one digit" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            return NO;
        }

        return YES;
    }
    }

}

@end
