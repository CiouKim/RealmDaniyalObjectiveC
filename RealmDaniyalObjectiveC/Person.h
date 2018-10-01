//
//  Person.h
//  RealmDaniyalObjectiveC
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//


#import <Realm/Realm.h>
NS_ASSUME_NONNULL_BEGIN

@interface Person : RLMObject

@property NSString *name;
@property NSString *birthday;
- (id)initWithValue :(NSString *)name andWithDate: (NSString *)date;
@end

NS_ASSUME_NONNULL_END
