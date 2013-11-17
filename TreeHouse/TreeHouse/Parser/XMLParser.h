//
//  XMLParser.h
//  TreeHouse
//
//  Created by Tyler Singkofer on 11/16/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"

@interface XMLParser : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *data;

-(id) loadXMLByURL:(NSString *)urlString;

@end
