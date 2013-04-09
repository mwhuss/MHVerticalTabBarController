//
//  MHAppDelegate.h
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 4/4/13.
//  Copyright (c) 2013 Marshall Huss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHVerticalTabBarController;

@interface MHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MHVerticalTabBarController *tabBarController;

@end
