//
//  AppDelegate.h
//  CatMap
//
//  Created by Rushan on 2017-05-23.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic) NSManagedObjectContext *managedObjectContext;  //CoreData Object Model
@property (nonatomic) NSManagedObjectModel *managedObjectModel;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

