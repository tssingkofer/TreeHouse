//
//  ParseInterface.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/4/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "ParseInterface.h"
#import "XMLParseLogin.h"
#import "LoginController.h"

LoginController *login;
XMLParseLogin *xmlParser;

@implementation ParseInterface
@synthesize pushString, data2;

- (void) submitName: (NSArray *) field
{
    Global *global = [Global globalData];

    NSString *ip = [NSString stringWithFormat:@"http://%@/Projects/post.php", global.ip];
    if ([field count]==22)
    {
        //website http://stackoverflow.com/questions/15749486/sending-http-post-ios
        NSString *post = [NSString stringWithFormat:@"FirstName=%@&LastName=%@&MI=%@&Address=%@&City=%@&State=%@&Zip=%@&PhoneHome=%@&PhoneMobile=%@&Email=%@&DOB=%@&Age=%@&Gender=%@&Grade=%@&School=%@&HighSchool=%@&GradDate=%@&Living=%@&Hispanic=%@&FreeLunch=%@&Ethnicity=%@&Referral=%@", field[0], field[1],field[2],field[3],field[4],field[5],field[6],field[7],field[8],field[9],field[10],field[11],field[12],field[13],field[14],field[15],field[16],field[17],field[18],field[19],field[20],field[21]];
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

    } else
    {
        NSLog(@"The array is not the right size in ParseInterface.m");
    }

    
    
}
-(NSMutableArray *) login: (NSString *) uName password: (NSString *) pass
{
    Global *global = [Global globalData];
    //pushString = [NSString stringWithFormat:@"http://%@/Projects/welcometotreehouse.php?=%@", global.ip,field[10]];
    
    NSString *ip = [NSString stringWithFormat:@"http://%@/Projects/login.php", global.ip];
    
    //website http://stackoverflow.com/questions/15749486/sending-http-post-ios
    NSString *post = [NSString stringWithFormat:@"Username=%@&Password=%@", uName, pass];
    NSLog(@"Sent data %@", post);
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:ip]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    //NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];

    NSURLResponse* response;
    NSError* error = nil;
    
    NSData* result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    xmlParser = [XMLParseLogin alloc];
    [xmlParser ParseData:result];
    if ([[xmlParser data] count] > 0) {
        return [xmlParser data];
    } else
    {
        NSString *error = @"Server Error";
        NSMutableArray *errorC = [[NSMutableArray alloc] init];
        [errorC addObject:error];
        return errorC;
    }
    
}
@end
