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

- (void) submitName: (NSArray *) field
{
    /*[insert addObject:@{@"FirstName": fName.text}];
     [insert addObject:@{@"LastName": lName.text}];
     [insert addObject:@{@"MI": mi.text}];
     [insert addObject:@{@"Address": address.text}];
     [insert addObject:@{@"City": city.text}];
     [insert addObject:@{@"State": state.text}];
     [insert addObject:@{@"Zip": zip.text}];
     [insert addObject:@{@"PhoneHome": homePhone.text}];
     [insert addObject:@{@"PhoneMobile": cellPhone.text}];
     [insert addObject:@{@"Email": eMail.text}];
     [insert addObject:@{@"DOB": DOB.text}];
     [insert addObject:@{@"Age": age.text}];
     [insert addObject:@{@"Gender": gender.text}];
     [insert addObject:@{@"Grade": grade.text}];
     [insert addObject:@{@"School": middleSchool.text}];
     [insert addObject:@{@"HighSchool": highSchool.text}];
     [insert addObject:@{@"GradDate": gradDate.text}];*/
    
    pushString = [NSString stringWithFormat:@"http://10.6.11.31/Projects/welcometotreehouse.php?=%@", field[10]];
    NSLog(@"Sent data %@", pushString);
    //xmlParser = [[XMLParser alloc] loadXMLByURL:pushString];
    
}
@end
