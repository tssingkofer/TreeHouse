//
//  Global.m
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import "Global.h"


static Global *sharedSingleton = NULL;

@implementation Global
@synthesize ip = _ip;
+(id)globalData
{
    @synchronized(sharedSingleton)
    {
        if (!sharedSingleton || sharedSingleton == NULL)
        {
            sharedSingleton = [[Global alloc]init];
        }
        return sharedSingleton;
    }
}

-(id) init
{
    if (self = [super init])
    {
        //initialize variables
        //set the global ip here
        _ip = @"localhost";
    }
    return self;
}

-(void) dealloc
{
    
}
@end
