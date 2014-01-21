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
-(void) login: (NSString *) uName password: (NSString *) pass
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
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    NSLog(@"We've been beamed up scotty!");
}
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"Caching hit");
    return nil;
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSLog(@"Done Loading");
    //NSLog(@"Data = %@", _responseData);
    
    xmlParser = [XMLParseLogin alloc];
    [xmlParser ParseData:_responseData];
    LoginController *controller = [LoginController alloc];
    [controller success:[xmlParser data]];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"There was an error with the connection");
}
@end
