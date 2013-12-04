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

@implementation HomeViewController

@synthesize fNameText, insert;
//@synthesize MIName;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *fNameString = fNameText.text;
    ParentViewController *PVC = [segue destinationViewController];
    PVC.firstName = fNameString;

        NSLog(@"Prepare for Segue");
        if ([[segue identifier] isEqualToString:@"done"]) //enter button name
        {
            [insert addObject:@{@"FirstName": @"Their Name"}];
            [insert addObject:@{@"LastName": @"Their LName"}];
            [insert addObject:@{@"MI": @"Their MI"}];
            [insert addObject:@{@"Adress": @"Their Adress"}];
            [insert addObject:@{@"City": @"Their City"}];
            [insert addObject:@{@"State": @"Their State"}];
            [insert addObject:@{@"Zip": @"Their Zip Code"}];
            [insert addObject:@{@"PhoneHome": @"Their Phone"}];
            [insert addObject:@{@"PhoneMobile": @"Their Cell"}];
            [insert addObject:@{@"Email": @"Their Email"}];
            [insert addObject:@{@"DOB": @"Their Birthday"}];
            [insert addObject:@{@"Age": @"Their Age"}];
            [insert addObject:@{@"Gender": @"Their Gender"}];
        }
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
    [fNameText becomeFirstResponder];
    ParseInterface *parse = [ParseInterface alloc];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
