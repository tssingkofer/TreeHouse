//
//  MainMenuViewController.m
//  TreeHouse
//
//  Created by Snell, Luke J on 2013-11-15.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "MainMenuViewController.h"
#import "CheckInViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
@synthesize textLastName;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (textLastName != nil){
    CheckInViewController *vc = [segue destinationViewController];
    vc.stringFromAlertView = textLastName;
    }
    else {
        textLastName = nil;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindBackToMainMenuViewController:(UIStoryboardSegue *)sender{
    NSLog(@"Back to Main Menu!");
}

- (IBAction)showCheckInAlert:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Check-In" message:@"Enter Last Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Search", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
#pragma mark AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    textLastName = [[alertView textFieldAtIndex:0] text];
    NSLog(@"Variable contains: %@", textLastName);
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    [self performSegueWithIdentifier:@"segue.push.alert" sender:self];
    
}


@end
