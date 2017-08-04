//
//  AppDelegate.h
//  ReactiveCocoaUtils
//
//  Created by PC on 17/7/24.
//  Copyright © 2017年 LongPei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

