//
//  EventListViewController.m
//  TreeHouse
//
//  Created by Micah Mogler on 11/11/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "EventListViewController.h"
#import "XMLParser.h"

@implementation EventListViewController
@synthesize queryString, DataTableView;

XMLParser *xmlParser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Special Events";
    }
    return self;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of elements %lu", (unsigned long)[[xmlParser data] count]);
    return [[xmlParser data] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
	Data *currentEntry = [[xmlParser data] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        
        NSMutableArray *activityName = [[NSMutableArray alloc] initWithObjects:currentEntry.activityName, nil];
        NSMutableArray *programDate = [[NSMutableArray alloc] initWithObjects:currentEntry.programDate, nil];
//        NSMutableArray *dob = [[NSMutableArray alloc] initWithObjects:currentEntry.dob, nil];
        //NSMutableArray *youthId = [[NSMutableArray alloc] initWithObjects:currentEntry.youthID, nil];
        //NSLog(@"The number of objects in data is: %@", [currentEntry firstName]);
        
        NSString * activities = [NSString stringWithFormat:@"%@ %@",
                               [activityName objectAtIndex:0],
                               [programDate objectAtIndex:0]];
        
        if(activities == NULL)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Info" message: @"No results found" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show];
        }
        cell.textLabel.text = activities;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else {
        return cell;
    }
}


- (IBAction)unwindBackToEventListViewController:(UIStoryboardSegue *)sender{
    NSLog(@"unwind back to EventListViewController");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Global *global = [Global globalData];

    queryString = [NSString stringWithFormat: @"http://%@/Projects/event_list_view.php",global.ip];
        
    NSLog(@"%@",queryString);
    xmlParser = [[XMLParser alloc] loadXMLByURL:queryString];
    
    self.title = @"Special Events";}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setDataTableView:nil];
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Info" message: @"No events found" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; //Gives an alert
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



@end
