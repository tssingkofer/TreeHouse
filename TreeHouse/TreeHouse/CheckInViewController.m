//
//  CheckInViewController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "ViewController.h"
#import "CheckInViewController.h"
#import "XMLParser.h"

@implementation CheckInViewController
@synthesize dataTableView;

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
    xmlParser = [[XMLParser alloc] loadXMLByURL:@"http://10.6.1.123:8888/projects/youth_checkin_query.php?LastName=Singkofer"];
    
    self.title = @"Check-In";
}


- (void)viewDidUnload
{
    [self setDataTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

@end















/*static NSString *CellIdentifier = @"Cell";

@interface CheckInViewController () <NSXMLParserDelegate>

@end

@class XMLParse;

@implementation CheckInViewController 
{

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"xml"];
    NSData *fileContents = [NSData dataWithContentsOfFile:filepath];
    
    
    XMLParse *xml = [[XMLParse alloc]init];
    self.users = [[xml doParse:fileContents] mutableCopy];
    _users2 = [self.users mutableCopy];
    NSLog(@"Count of users : %i", [self.users2 count]);
    self.sFName = @[@"",@""];
    self.youth = @[@"Youth 1", @"Youth 2", @"Youth 3"];
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    
}
-(void) viewDidAppear:(BOOL)animated
{
    
}
-(void) viewWillDisappear:(BOOL)animated
{
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //XMLParse *xml = [[XMLParse alloc]init];
    
    return [self.users2 count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = nil;//self.users2[0];//indexPath.row];
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:40];
    return cell;
}
/*- (void)grabURL
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
    }
}
@end
*/