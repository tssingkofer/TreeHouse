//
//  SearchViewController.h
//  TreeHouse
//
//  Created by Micah Mogler on 11/12/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "Data.h"
#import "MainMenuViewController.h"

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (weak, nonatomic) IBOutlet UITextField *searchLNameText;
@property (weak, nonatomic) NSString *queryString;
 -(NSMutableArray *)updateText;
@end
