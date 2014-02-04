//
//  SpecificEventViewController.h
//  TreeHouse
//
//  Created by Micah Mogler on 11/12/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParseLogin.h"
#import "Data.h"
#import "SearchViewController.h"
#import "Global.h"


@interface SpecificEventViewController : UIViewController
{
    NSString *textLastName;
}
- (IBAction)showCheckInAlert:(id)sender;
- (IBAction)unwindBackToSpecificEventViewController:(UIStoryboardSegue *)sender;

@property (retain) NSString *textLastName;
@end
