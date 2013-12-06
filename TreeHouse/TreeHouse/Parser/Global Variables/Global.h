//
//  Global.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/6/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global : NSObject
{
    NSString *ip;
    
}

@property (assign, nonatomic) NSString *ip;

+(id)globalData;
@end
