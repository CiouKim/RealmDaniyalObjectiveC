//
//  DBManager.m
//  RealmDaniyalObjectiveC
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager {
    RLMRealm *realm;
    
    
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        realm = [RLMRealm defaultRealm];
        [self printURL];
        /* if let isURL = realm.configuration.fileURL {
            print(isURL)
        } */
    }
    return self;
}

+ (id)sharedManager {
    static DBManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)printURL {
   
    NSURL *realmDatabaseURL = realm.configuration.fileURL;
    NSLog(@"%@",realmDatabaseURL.absoluteString);
}

- (void)addRealmObject: (RLMObject *)obj {
    
    @try {
        [realm transactionWithBlock:^{
            [self->realm addObject:obj];
        }];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    @finally {}
}

- (void)deleteRealmObject :(RLMObject *)obj {
    @try {
        [realm transactionWithBlock:^{
            [self->realm deleteObject:obj];
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception.reason);
    } @finally {}
}

- (void)realmBeginChanges{
    [realm beginWriteTransaction];
}

- (void)realmEndChanges{
    [realm commitWriteTransaction];
}

- (void)deleteAll {
    [realm deleteAllObjects];
}


/*
 func update(block: @escaping ()->Void) {
 
 try! realm.write(block)
 }
 */

 
@end
