//
//  XMLParseLogin.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 1/13/14.
//  Copyright (c) 2014 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Data.h"

@interface XMLParseLogin : NSObject <NSXMLParserDelegate>

@property (strong, readonly) NSMutableArray *data;

-(id) ParseData:(NSData *)data;

@end
