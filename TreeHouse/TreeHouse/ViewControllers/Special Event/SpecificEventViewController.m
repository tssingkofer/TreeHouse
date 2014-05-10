//
//  SpecificEventViewController.m
//  TreeHouse
//
//  Created by Micah Mogler on 11/12/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "SpecificEventViewController.h"
#import "SearchViewController.h"
#import "XMLParser.h"


@implementation SpecificEventViewController
@synthesize textLastName, stringFromAlertView, queryString;

XMLParser *xmlParser;

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
	
    
    //the following url needs to point at whatever server script you are testing against.
    NSLog(@"text: %@", stringFromAlertView);
    Global *global = [Global globalData];
    
    queryString = [NSString stringWithFormat:@"http://%@/Projects/ActivityConfirmation.php?FirstName=%@",global.ip, stringFromAlertView];
    
    
    NSLog(@"%@",queryString);
    xmlParser = [[XMLParser alloc] loadXMLByURL:queryString];
    
    self.title = @"Event Check-In";
    
    
}

- (void)viewDidUnload
{
   //[self setDataTableView:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if((unsigned long)[[xmlParser data] count]==0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Info" message: @"No results found, be sure to enter the entire first name" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; //Gives an alert
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showCheckInAlert:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Event Check-In" message:@"Enter First Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Search", nil];
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
