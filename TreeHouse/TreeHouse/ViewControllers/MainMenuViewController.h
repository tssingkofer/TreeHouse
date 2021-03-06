//
//  MainMenuViewController.h
//  TreeHouse
//
//  Created by Snell, Luke J on 2013-11-15.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController
{
    NSString *textLastName;
}
- (IBAction)unwindBackToMainMenuViewController:(UIStoryboardSegue *)sender;
- (IBAction)showCheckInAlert:(id)sender;
- (IBAction)WelcomeButtonPressed:(id)sender;
- (IBAction)EventButtonPressed:(id)sender;

@property (retain, nonatomic) NSString *loginStatus;

@property (retain) NSString *textLastName;
@end
