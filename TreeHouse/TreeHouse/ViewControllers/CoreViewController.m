//
//  ViewController.m
//  TreeHouse
//
//  Created by Tyler Singkofer on 10/28/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "CoreViewController.h"

@interface CoreViewController ()

@end

@implementation CoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)unwindBackToWelcomeViewController:(UIStoryboardSegue *)segue;
{
    printf("unwindBackToHomeViewController!");
}

@end
