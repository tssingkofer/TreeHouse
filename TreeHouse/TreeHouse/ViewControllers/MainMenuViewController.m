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
    textLastName = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindBackToMainMenuViewController:(UIStoryboardSegue *)sender{
    NSLog(@"Back to Main Menu!");
    textLastName = nil;
}

- (IBAction)showCheckInAlert:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Check-In" message:@"Enter First Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Search", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (IBAction)WelcomeButtonPressed:(id)sender {
    textLastName = nil;
}

- (IBAction)EventButtonPressed:(id)sender {
    textLastName = nil;
}
#pragma mark AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
    else {
    textLastName = [[alertView textFieldAtIndex:0] text];
    NSLog(@"Variable contains: %@", textLastName);
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    [self performSegueWithIdentifier:@"segue.push.alert" sender:self];
    }
}


@end
