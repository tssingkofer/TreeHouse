//
//  LoginController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/17/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "LoginController.h"
ParseInterface *parse;
XMLParseLogin *dat;
@interface LoginController ()

@end

@implementation LoginController
@synthesize pass, pickerLocation, locations, username;
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

    UIStoryboard* MainMenu = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    UIViewController* MainViewController = [MainMenu instantiateViewControllerWithIdentifier:@"Main"];
    
    [self.navigationController pushViewController:MainViewController animated:YES];
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
    NSString *test = [NSString stringWithFormat:@"%@", login[0]];
    NSLog(@"The entry was %@", test);
    if ([test isEqual: @"Yes"])
    {
        LoginController * vc = [LoginController alloc];
        UIStoryboard* MainMenu = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        
        UIViewController* MainViewController = [MainMenu instantiateViewControllerWithIdentifier:@"Main"];
        
        [self.navigationController pushViewController:MainViewController animated:YES];
        
        
        //[self performSegueWithIdentifier:@"test" sender:nil];
        
        
        //[_contLogin sendActionsForControlEvents:UIControlEventAllEvents];
        

        
    }else{
        if ([test  isEqual: @"No"])
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Authentication" message:@"Login Failed: Bad username or password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            [alert show];
            
        }
        
        
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"segue from Login");
    //addToCartViewContollerForItem
    /*if([[segue identifier] isEqualToString:@"test"]){
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        
        Item *currentItem = [[Item alloc]init];
        currentItem = [itemList objectAtIndex:[selectedRow row]];
        
        RESTAddToCartViewController *vc = [segue destinationViewController];
        [vc setCurrentItem:currentItem];
    }*/
    
}
@end
