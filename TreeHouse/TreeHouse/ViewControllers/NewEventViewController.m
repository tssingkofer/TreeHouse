//
//  NewEventViewController.m
//  TreeHouse
//
//  Created by Micah Mogler on 11/11/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "NewEventViewController.h"

@interface NewEventViewController ()

@end

@implementation NewEventViewController

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
-(IBAction)unwindBackToEventListViewController:(UIStoryboardSegue *)segue;
{
    printf("unwindBackToEventListViewController!");
}

@end
