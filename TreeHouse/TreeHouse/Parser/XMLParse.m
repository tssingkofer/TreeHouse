//
//  XMLParse.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

/*<users>
<user>
<userName>mspeller</userName>
<firstName>Mike</firstName>
<lastName>Speller</lastName>
</user>
<user>
<userName>mgdan</userName>
<firstName>Mila</firstName>
<lastName>Gdan</lastName>
</user>
...
</users> */

#import "XMLParse.h"
#import "User.h"

@implementation XMLParse

@synthesize student, users;

- (XMLParse *) initXMLParser {
    //[super init];
    //This may be wrong since it doesn't work!!!! I changed this now to the new way of doing this
    self = [super init];
    // init array of user objects
    users = [[NSMutableArray alloc] init];
    //printf("init");
    return self;
}

-(void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"student"]) {
        NSLog(@"user element found – create a new instance of User class...");
        student = [[User alloc] init];
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
    
    if ([elementName isEqualToString:@"user"]) {
        // We reached the end of the XML document
        return;
    }
    
    if ([elementName isEqualToString:@"student"]) {
        // We are done with user entry – add the parsed user
        // object to our user array
        [users addObject:student];
    } else {
        // The parser hit one of the element values.
        // This syntax is possible because User object
        // property names match the XML user element names
        [student setValue:currentElementValue forKey:elementName];
    }
}


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
        NSLog(@"No errors - user count : %i", [parser.users count]);
        // get array of users here
        users = [parser users];
    } else {
        NSLog(@"Error parsing document!");
    }
}
@end