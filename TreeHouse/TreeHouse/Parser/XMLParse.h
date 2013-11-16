//
//  XMLParse.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 11/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
// Other possible xml parser
//http://www.mactech.com/articles/mactech/Vol.21/21.06/XMLParser/index.html
// one I used here
//http://wiki.cs.unh.edu/wiki/index.php/Parsing_XML_data_with_NSXMLParser

#import <Foundation/Foundation.h>
@class User;

@interface XMLParse : NSObject <NSXMLParserDelegate> //got this from http://stackoverflow.com/questions/11147239/xcode-appdelegate-const-strong-to-parameter-of-incompatible-type-error
// Other info on fetching a url is https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/URLLoadingSystem/URLLoadingSystem.html#//apple_ref/doc/uid/10000165i
{

    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    // user object
    User *user;
    // array of user objects
    NSMutableArray *users;
}


@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSMutableArray *users;
@property (copy, nonatomic) NSArray *trans;

- (XMLParse *) initXMLParser;
- (NSMutableArray *) doParse:(NSData *)data;

-(void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qualifiedName
   attributes:(NSDictionary *)attributeDict;
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName;
@end
