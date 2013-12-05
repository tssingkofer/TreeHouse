//
//  ParseInterface.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "Data.h"

@interface ParseInterface : NSObject

@property (retain, nonatomic) NSString *pushString;

- (void) submitName: (NSArray *) field;
@end
