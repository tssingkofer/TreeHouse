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
    Global *global = [Global globalData];
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
    //Global *global = [Global globalData];
    //pushString = [NSString stringWithFormat:@"http://%@/Projects/welcometotreehouse.php?=%@", global.ip,field[10]];

    //xmlParser = [[XMLParser alloc] loadXMLByURL:pushString];
    NSString *ip = [NSString stringWithFormat:@"http://%@/Projects/post.php", global.ip];
    
    //website http://stackoverflow.com/questions/15749486/sending-http-post-ios
    NSString *post = [NSString stringWithFormat:@"FirstName=%@&LastName=%@&MI=%@&Address=%@&City=%@&State=%@&Zip=%@&PhoneHome=%@&PhoneMobile=%@&Email=%@&DOB=%@&Age=%@&Gender=%@&Grade=%@&School=%@&HighSchool=%@&GradDate=%@", field[0], field[1],field[2],field[3],field[4],field[5],field[6],field[7],field[8],field[9],field[10],field[11],field[12],field[13],field[14],field[15],field[16]];
        NSLog(@"Sent data %@", post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:ip]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if(conn)
    {
        NSLog(@"The connection was successful");
    }
    else
    {
        NSLog(@"There was an error");
    }
    
}
-(void) post
{
    
}
@end
