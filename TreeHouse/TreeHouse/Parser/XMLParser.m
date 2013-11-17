//
//  XMLParser.m
//  TreeHouse
//
//  Created by Tyler Singkofer on 11/16/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@implementation XMLParser
@synthesize data = _data;


NSMutableString	*currentNodeContent;
NSXMLParser		*parser;
Data			*currentEntry;
bool            isResults;

-(id) loadXMLByURL:(NSString *)urlString
{
	_data			= [[NSMutableArray alloc] init];
	NSURL *url		= [NSURL URLWithString:urlString];
	NSData	*data   = [[NSData alloc] initWithContentsOfURL:url];
	parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
	return self;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementname isEqualToString:@"results"])
	{
		currentEntry = [Data alloc];
        isResults = YES;
	}
	if ([elementname isEqualToString:@"race"])
	{
        isResults = NO;
	}
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (isResults)
    {
        if ([elementname isEqualToString:@"first_name"])
        {
            currentEntry.firstName = currentNodeContent;
        }
        if ([elementname isEqualToString:@"last_name"])
        {
            currentEntry.lastName = currentNodeContent;
        }
    }
	if ([elementname isEqualToString:@"results"])
	{
		[self.data addObject:currentEntry];
		currentEntry = nil;
		currentNodeContent = nil;
	}
}

@end

