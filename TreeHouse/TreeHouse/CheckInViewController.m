//
//  CheckInViewController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "CheckInViewController.h"
#import "XMLParse.h"
static NSString *CellIdentifier = @"Cell";

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
    [xml doParse:fileContents];
    NSLog(@"Count of users : %i", [xml.users count]);
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
    XMLParse *xml = [[XMLParse alloc]init];
    
    return [self.viewDidLoad];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    XMLParse *xml = [[XMLParse alloc]init];
    cell.textLabel.text = xml.users[indexPath.row];
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:40];
    return cell;
}
@end
