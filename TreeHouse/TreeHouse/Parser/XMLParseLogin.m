//
//  XMLParseLogin.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 1/13/14.
//  Copyright (c) 2014 Tyler Singkofer. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "XMLParseLogin.h"



@implementation XMLParseLogin

@synthesize data = _data;

NSMutableString	*currentNodeContent;
NSXMLParser		*parser;
Data			*currentEntry;
bool            isResults;

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementname isEqualToString:@"account"])
	{
		currentEntry = [Data alloc];
        isResults = YES;
	}
	if ([elementname isEqualToString:@"Exists"])
	{
        //isResults = NO;
	}
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (isResults)
    {
        if ([elementname isEqualToString:@"Exists"])
        {
            currentEntry.exists = currentNodeContent;
        }
        
    }
	if ([elementname isEqualToString:@"account"])
	{
		[self.data addObject:currentEntry];
		currentEntry = nil;
		currentNodeContent = nil;
	}
}
-(id) ParseData:(NSData *)data
{
    _data			= [[NSMutableArray alloc] init];
	parser			= [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
	[parser parse];
    
    
	return self;
}
@end
