//
//  User.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *userName;
    NSString *firstName;
    NSString *lastName;
}

@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@end
