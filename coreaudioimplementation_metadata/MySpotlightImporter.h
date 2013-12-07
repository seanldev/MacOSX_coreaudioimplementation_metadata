//
//  MySpotlightImporter.h
//
//  Created by Sean Liu on 10/21/13.
//  Copyright (c) 2013 Sean Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MySpotlightImporter : NSObject

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (BOOL)importFileAtPath:(NSString *)filePath attributes:(NSMutableDictionary *)attributes error:(NSError **)error;

@end
