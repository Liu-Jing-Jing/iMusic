//
//  TabClient.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "TabClient.h"

@implementation TabClient

- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (instancetype)initWithName:(NSString *)newName
{
    self = [super init];
    if (self)
    {
        self.name = newName;
    }
    return self;
}
@end
