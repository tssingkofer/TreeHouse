//
//  CheckInViewController.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "Data.h"
#import "MainMenuViewController.h"

@interface CheckInViewController : UIViewController

@property (weak, nonatomic) NSString *stringFromAlertView;
@property (nonatomic, retain) UIImageView *customImage;
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;
@property (weak, nonatomic) IBOutlet UITextField *searchLNameText;
@property (weak, nonatomic) NSString *queryString;
- (NSMutableArray *)updateText;

@end