//
//  SearchViewController.m
//  TreeHouse
//
//  Created by Micah Mogler on 11/12/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "SearchViewController.h"
#import "XMLParser.h"




@implementation SearchViewController
@synthesize searchLNameText, queryString, dataTableView, stringFromAlertView, tbList, pushString, tblSelect;


XMLParser *xmlParser;
XMLParser *xmlParser2;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Event Check-in";
    }
    return self;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//Will set up a table view to view upcoming events

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
        
        
        NSMutableArray *lastName = [[NSMutableArray alloc] initWithObjects:currentEntry.lastName, nil];
        NSMutableArray *firstName = [[NSMutableArray alloc] initWithObjects:currentEntry.firstName, nil];
        NSMutableArray *dob = [[NSMutableArray alloc] initWithObjects:currentEntry.dob, nil];
        //NSMutableArray *youthId = [[NSMutableArray alloc] initWithObjects:currentEntry.youthID, nil];
        //NSLog(@"The number of objects in data is: %@", [currentEntry firstName]);
        
        NSString * students = [NSString stringWithFormat:@"%@ %@ %@",
                               [firstName objectAtIndex:0],
                               [lastName objectAtIndex:0],
                               [dob objectAtIndex:0]];
        
        
        cell.textLabel.text = students;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else {
        return cell;
    }
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"text: %@", stringFromAlertView);
    //    queryString = @"http://192.168.1.103:8888/projects/youth_checkin_query.php?LastName=";
        Global *global = [Global globalData];
    queryString = [NSString stringWithFormat:@"http://%@/Projects/youth_checkin_query.php?LastName=%@", global.ip,stringFromAlertView];
    
    
    NSLog(@"%@",queryString);
    xmlParser = [[XMLParser alloc] loadXMLByURL:queryString];
    
    self.title = @"Event Check-In";
    //Data *currentEntry = [[xmlParser data] objectAtIndex:0];
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
    if ((unsigned long)[[xmlParser data] count])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Info" message: @"No results found, be sure to enter the entire last name" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show]; //Gives an alert
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
}/*
  - (NSMutableArray *)updateText {
  
  NSUInteger cellsCount = [self.dataTableView numberOfRowsInSection:0];
  NSMutableArray *cellTextArray = [[NSMutableArray alloc] initWithCapacity:cellsCount];
  
  for(NSInteger i = 0; i < cellsCount; i++) {
  
  NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
  //UITableViewCell *cell = [self.dataTableView cellForRowAtIndexPath:indexPath];
  
  Data *currentEntry = [[xmlParser data] objectAtIndex:indexPath.row];
  
  [cellTextArray insertObject:[currentEntry firstName] atIndex:i];
  }
  
  return cellTextArray;
  }*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //tblSelect = (NSString *)indexPath;
    Data *currentEntry = [[xmlParser data] objectAtIndex:indexPath.row];
    Global *global = [Global globalData];
    pushString = [NSString stringWithFormat:@"http://%@/Projects/youth_checkin_query.php?id=%@", global.ip,currentEntry.youthID];
    NSLog(@"YouthID is %@", currentEntry.youthID);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Prepare for Segue");
    if ([[segue identifier] isEqualToString:@"Event Check-in"])
    {
        xmlParser2 = [[XMLParser alloc] loadXMLByURL:self.pushString];
    }
}

@end
