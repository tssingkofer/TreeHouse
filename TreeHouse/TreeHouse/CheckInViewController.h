//
//  CheckInViewController.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParse.h"

@interface CheckInViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UITableView *youthConnect;
@property (copy, nonatomic) NSArray *youth;
@property (copy, nonatomic) NSArray *sFName;

@property (copy, nonatomic) NSString *filepath;
@property (copy, nonatomic)NSError *error;
@property (copy, nonatomic)NSData *fileContents;
@property (copy, nonatomic) NSArray *users;
@property (copy, nonatomic)  NSMutableArray* users2;
@end
