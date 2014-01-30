//
//  LoginController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/17/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "LoginController.h"
#import "MainMenuViewController.h"

ParseInterface *parse;
XMLParseLogin *dat;
@interface LoginController ()

@end

@implementation LoginController
@synthesize pass, pickerLocation, locations, username, loginAU;
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
    locations = @[@"Site 1", @"Site 2", @"Site 3"];
    self.login.enabled = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return locations.count;
}
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [locations objectAtIndex:row];
}
-(IBAction) editingDidBegin: (UITextField *)sender
{
    //Debug
    //NSLog(@"username = %@ and pass = %@",username.text, pass.text);
    if (username.text.length > 0 && pass.text.length > 0)
    {
        self.login.enabled = YES;
    }
    else
    {
        self.login.enabled = NO;
    }
}
-(IBAction) login:(id)sender
{
    ParseInterface *parse = [ParseInterface alloc];

    [parse login:username.text password:pass.text];
    



    
}
- (IBAction)contLogin:(id)sender
{
    UIStoryboard* MainMenu = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     
     
     UIViewController* MainViewController = [MainMenu instantiateViewControllerWithIdentifier:@"Main"];
     
     [self.navigationController pushViewController:MainViewController animated:YES];
}


- (void) success: (NSMutableArray *) data
{

    Data *currentEntry = [data objectAtIndex:0];
    NSMutableArray *login = [[NSMutableArray alloc] initWithObjects:currentEntry.exists, nil];
    NSString *passInfo = [NSString stringWithFormat:@"%@", login[0]];
    NSLog(@"The entry was %@", passInfo);
    MainMenuViewController *vc = [[MainMenuViewController alloc] init];
    vc.loginStatus = loginAU;
    
    
    if ([passInfo isEqual: @"Yes"])
    {
        loginAU = passInfo;
        
        //[self performSegueWithIdentifier:@"test" sender:self];
        //LoginController * vc = [LoginController alloc];
        //[self performSegueWithIdentifier:@"test" sender:nil];
        //[_contLogin sendActionsForControlEvents:UIControlEventAllEvents];
 
    }else{
        if ([passInfo  isEqual: @"No"])
        {
            //UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Authentication" message:@"Login Failed: Bad username or password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            //[alert show];
            loginAU = passInfo;
            
        }else
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Authentication" message:@"Unknown Error" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            [alert show];
        }
        
        
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    /*UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Authentication" message:@"Waiting for Login" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    
    if ([loginAU isEqual:@"Yes"])
    {
        NSLog(@"The login is complete: %@", loginAU);
        UIStoryboard* MainMenu = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        
        UIViewController* MainViewController = [MainMenu instantiateViewControllerWithIdentifier:@"Main"];
        
        [self.navigationController pushViewController:MainViewController animated:YES];
    } else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Authentication" message:@"Login Failed: Bad username or password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
        NSLog(@"The login failed: %@", loginAU);
    }*/
    return YES;
}

@end
