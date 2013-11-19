//
//  HomeViewController.m
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize fNameText;


/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/
/*- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == self.fNameText) {
        [self.MIText becomeFirstResponder];
        [self.fNameText resignFirstResponder];
    } else if (textField == self.self.MIText) {
        [textField resignFirstResponder];
    }
    
    return NO;
}*/


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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//self.alabel.text
- (IBAction)btnNext:(id)sender
{
    
    NSLog(@"text: %@, %@", fNameText.text, MIText.text);

}

@end
