//
//  ParseInterface.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "ParseInterface.h"
#import "XMLParser.h"

XMLParser *xmlParser;

@implementation ParseInterface
@synthesize pushString;

- (void) submitName: (NSString *) field databaseT:(NSString *) table
{
    pushString = [NSString stringWithFormat:@"http://10.6.11.31/Projects/welcometotreehouse.php?%@=%@", table,field];
    NSLog(@"Sent data %@", pushString);
    xmlParser = [[XMLParser alloc] loadXMLByURL:pushString];
    
}
@end
