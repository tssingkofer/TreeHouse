//
//  CheckInViewController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//


#import "CheckInViewController.h"
#import "XMLParser.h"

@implementation CheckInViewController
@synthesize searchLNameText, queryString, dataTableView, stringFromAlertView, tbList;

XMLParser *xmlParser;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Check-in";
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
        
        
        
        cell.textLabel.text = [currentEntry firstName];
        
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
    
    
    //the following url needs to point at whatever server script you are testing against.
    NSLog(@"text: %@", stringFromAlertView);
//    queryString = @"http://192.168.1.103:8888/projects/youth_checkin_query.php?LastName=";
    
    queryString = [NSString stringWithFormat:@"http://localhost/Projects/youth_checkin_query.php?LastName=%@", stringFromAlertView];
//    NSLog(@"%@",queryString);
//    queryString = [queryString stringByAppendingString:stringFromAlertView];
    NSLog(@"%@",queryString);
    xmlParser = [[XMLParser alloc] loadXMLByURL:queryString];

    self.title = @"Check-In";
    //Data *currentEntry = [[xmlParser data];
        //NSLog(@"The number of objects in data is: %lu", [currentEntry firstName]);
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
}

@end