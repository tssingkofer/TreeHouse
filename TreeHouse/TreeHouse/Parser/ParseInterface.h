//
//  ParseInterface.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"
@interface ParseInterface : NSObject
{
    NSMutableData *_responseData;
}

@property (retain, nonatomic) NSString *pushString;
@property (strong, readonly) NSMutableArray *data2;
- (void) submitName: (NSArray *) field;
-(NSMutableArray *) login: (NSString *) uName password: (NSString *) pass;
@end
