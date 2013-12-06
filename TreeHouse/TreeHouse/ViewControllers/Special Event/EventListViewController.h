//
//  EventListViewController.h
//  TreeHouse
//
//  Created by Micah Mogler on 11/11/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "Data.h"

@interface EventListViewController : UIViewController

- (IBAction)unwindBackToEventListViewController:(UIStoryboardSegue *)sender;

@property (weak, nonatomic) NSString *queryString;
@property (retain, nonatomic) NSMutableArray *tbList;
@property (retain, nonatomic) NSString *tblSelect;
@property (weak, nonatomic) IBOutlet UITableView *DataTableView;

@end
