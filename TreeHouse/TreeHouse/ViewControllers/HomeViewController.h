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
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField;
@property (strong, nonatomic) IBOutlet UITextField *fNameText;
@property (strong, nonatomic) IBOutlet UITextField *MIText;
@property (strong, nonatomic) IBOutlet UITextField *lNameText;
//@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnNext;

//@property (strong, nonatomic) IBOutlet UITextField *fNameText;
//@property (strong, nonatomic) IBOutlet UITextField *MIText;
//@property (strong, nonatomic) IBOutlet UITextField *lNameText;
@end
