//
//  RWChannel.m
//  RWReactivePlayground
//
//  Created by housl on 15/7/10.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWChannel.h"

@implementation RWChannel

+ (NSString *) currentChannel
{
    NSString *channelStr = @"AppStore";
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"proChannel" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *chanle = [data objectForKey:@"CFrom"];
    if (chanle && ![chanle isEqualToString:@""]) {
        channelStr = chanle;
    }
    
    return channelStr;
}

@end
