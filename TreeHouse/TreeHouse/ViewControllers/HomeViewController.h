//
//  HomeViewController.h
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{
    
    IBOutlet UITextField *fNameText;
    
    IBOutlet UITextField *MIText;
    
    IBOutlet UITextField *lNameText;
    
}

//- (IBAction)btnNext:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *fNameText;
- (IBAction)btnNext:(id)sender;

@end
