//
//  CheckInViewController.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "CheckInViewController.h"

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
}*/
@end
