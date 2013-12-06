//
//  HomeViewController.h
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseInterface.h"

@interface HomeViewController : UIViewController

{
    //IBOutlet UITextField *fNameText;
    
    IBOutlet UITextField *MIText;
    IBOutlet UITextField *lNameText;
    
    UIPickerView *PickerView;
    NSArray *livesWith;
    NSArray *ethnicity;
    NSArray *referral;
}
//Actions for selecting a picker field
- (IBAction)livingEditingDidBegin:(id)sender;
- (IBAction)ethnicityEditingDidBegin:(id)sender;
- (IBAction)referralEditingDidBegin:(id)sender;
- (IBAction)DonePress:(UIBarButtonItem *)sender;
- (IBAction)editingBegan:(UITextField *)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *button;


@property (strong, nonatomic) IBOutlet UITextField *livingField;
@property (strong, nonatomic) IBOutlet UITextField *ethnicityField;
@property (strong, nonatomic) IBOutlet UITextField *referralField;

@property (strong, nonatomic) IBOutlet UITextField *fNameText;
@property (strong, nonatomic) IBOutlet UITextField *MIName;
@property (strong, nonatomic) NSArray *insert;

@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *mi;
@property (weak, nonatomic) IBOutlet UITextField *lName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *cellPhone;

@property (weak, nonatomic) IBOutlet UITextField *homePhone;
@property (weak, nonatomic) IBOutlet UITextField *eMail;
@property (weak, nonatomic) IBOutlet UITextField *DOB;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *grade;
@property (weak, nonatomic) IBOutlet UITextField *middleSchool;
@property (weak, nonatomic) IBOutlet UITextField *gradDate;
@property (weak, nonatomic) IBOutlet UITextField *highSchool;



@end
