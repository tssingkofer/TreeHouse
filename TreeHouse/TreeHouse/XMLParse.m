//
//  XMLParse.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "XMLParse.h"
#import "User.h"

@implementation XMLParse

@synthesize user, users;

- (XMLParse *) initXMLParser {
    //[super init];
    //This may be wrong since it doesn't work!!!!
    self = [super init];
    // init array of user objects
    users = [[NSMutableArray alloc] init];
    return self;
}

-(void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"user"]) {
        NSLog(@"user element found – create a new instance of User class...");
        user = [[User alloc] init];
        //We do not have any attributes in the user elements, but if
        // you do, you can extract them here:
        // user.att = [[attributeDict objectForKey:@"<att name>"] ...];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }
    NSLog(@"Processing value for : %@", string);
}  

//XMLParser.m
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"users"]) {
        // We reached the end of the XML document
        return;
    }
    
    if ([elementName isEqualToString:@"user"]) {
        // We are done with user entry – add the parsed user
        // object to our user array
        [users addObject:user];
        // release user object
        //[user release];
        user = nil;
    } else {
        // The parser hit one of the element values.
        // This syntax is possible because User object
        // property names match the XML user element names
        [user setValue:currentElementValue forKey:elementName];
    }
    
    //[currentElementValue release];
    currentElementValue = nil;
}

// end of XMLParser.m file

- (void) doParse:(NSData *)data {
    
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    // create and init our delegate
    XMLParse *parser = [[XMLParse alloc] initXMLParser];
    
    // set delegate
    [nsXmlParser setDelegate:parser];
    
    // parsing...
    BOOL success = [nsXmlParser parse];
    
    // test the result
    if (success) {
        NSLog(@"No errors - user count : %i", [users count]);
        // get array of users here
        //  NSMutableArray *users = [parser users];
    } else {
        NSLog(@"Error parsing document!");
    }
}
@end
