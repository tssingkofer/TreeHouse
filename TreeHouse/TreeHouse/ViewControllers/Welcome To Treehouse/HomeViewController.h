//
//  HomeViewController.h
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseInterface.h"
#import "Global.h"

@interface HomeViewController : UIViewController<UITextFieldDelegate>

{
    //IBOutlet UITextField *fNameText;
    
    IBOutlet UITextField *MIText;
    IBOutlet UITextField *lNameText;
    IBOutlet UITextField *age;
    IBOutlet UITextField *zip;
    IBOutlet UITextField *mi;
    IBOutlet UITextField *gender;
    
    UIPickerView *PickerView;
    UIDatePicker *datePicker;
    NSArray *livesWith;
    NSArray *ethnicity;
    NSArray *referral;
    NSArray *stateR;
    NSArray *stateName;
    NSArray *genderN;
}
//Actions for selecting a picker field
- (IBAction)livingEditingDidBegin:(id)sender;
- (IBAction)ethnicityEditingDidBegin:(id)sender;
- (IBAction)referralEditingDidBegin:(id)sender;
- (IBAction)editingBegan:(UITextField *)sender;
- (IBAction)stateBegin:(id)sender;
- (IBAction)genderBegin:(id)sender;
- (IBAction)birthEditingDidBegin:(id)sender;
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *button;
@property (weak, nonatomic) IBOutlet UISwitch *Hispanic;
@property (weak, nonatomic) IBOutlet UISwitch *freeLunch;


@property (strong, nonatomic) IBOutlet UITextField *livingField;
@property (strong, nonatomic) IBOutlet UITextField *ethnicityField;
@property (strong, nonatomic) IBOutlet UITextField *referralField;

@property (strong, nonatomic) IBOutlet UITextField *fNameText;
@property (strong, nonatomic) IBOutlet UITextField *MIName;
@property (strong, nonatomic) NSArray *insert;

@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (retain, nonatomic) IBOutlet UITextField *mi;
@property (weak, nonatomic) IBOutlet UITextField *lName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *state;
@property (retain, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;

@property (weak, nonatomic) IBOutlet UITextField *homePhone;
@property (weak, nonatomic) IBOutlet UITextField *eMail;
@property (weak, nonatomic) IBOutlet UITextField *DOB;
@property (retain, nonatomic) IBOutlet UITextField *age;
@property (retain, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *grade;
@property (weak, nonatomic) IBOutlet UITextField *middleSchool;
@property (weak, nonatomic) IBOutlet UITextField *gradDate;
@property (weak, nonatomic) IBOutlet UITextField *highSchool;
@property (weak, nonatomic) IBOutlet UILabel *fNameL;
@property (weak, nonatomic) IBOutlet UILabel *mNameL;
@property (weak, nonatomic) IBOutlet UILabel *lNameL;
@property (weak, nonatomic) IBOutlet UILabel *addressL;
@property (weak, nonatomic) IBOutlet UILabel *cityL;
@property (weak, nonatomic) IBOutlet UILabel *stateL;
@property (weak, nonatomic) IBOutlet UILabel *zipL;
@property (weak, nonatomic) IBOutlet UILabel *birthL;
@property (weak, nonatomic) IBOutlet UILabel *genderL;
@property (weak, nonatomic) IBOutlet UILabel *ageL;
@property (weak, nonatomic) IBOutlet UILabel *livingL;
@property (weak, nonatomic) IBOutlet UILabel *ethnicityL;
@property (weak, nonatomic) IBOutlet UILabel *referralL;
@property (retain, nonatomic) NSMutableArray *lastLocation;

@property(nonatomic, retain) NSDate *date;

@end
