
//
//  Person.m
//  RealmDaniyalObjectiveC
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithValue :(NSString *)name andWithDate: (NSString *)date {
    self = [super init];
    self.name = name;
    self.birthday = date;
    return self;
}

@end
