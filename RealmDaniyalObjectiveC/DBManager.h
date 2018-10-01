//
//  DBManager.h
//  RealmDaniyalObjectiveC
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
NS_ASSUME_NONNULL_BEGIN



@interface DBManager : NSObject

+ (id)sharedManager;
- (void)addRealmObject: (RLMObject *)obj;
- (void)deleteRealmObject :(RLMObject *)obj;
- (void)realmBeginChanges;
- (void)realmEndChanges;

@end

NS_ASSUME_NONNULL_END
