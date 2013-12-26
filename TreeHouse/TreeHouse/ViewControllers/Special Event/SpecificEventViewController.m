//
//  SpecificEventViewController.m
//  TreeHouse
//
//  Created by Micah Mogler on 11/12/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "SpecificEventViewController.h"
#import "SearchViewController.h"

@interface SpecificEventViewController ()

@end

@implementation SpecificEventViewController
@synthesize textLastName;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (textLastName != nil){
        SearchViewController *vc = [segue destinationViewController];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showCheckInAlert:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Check-In" message:@"Enter First Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Search", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];

}

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


-(IBAction)unwindBackToSpecificEventViewController:(UIStoryboardSegue *)segue;
{
    printf("unwindBackToSpecificEventViewController!");
}


@end
