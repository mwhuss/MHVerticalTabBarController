//
//  MHVerticalTabBarController.h
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 1/3/13.
//  Copyright (c) 2013 mwhuss. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MHVerticalTabBar.h"
#import "MHVerticalTabBarButton.h"

@class MHVerticalTabBarController;

/**
 Delegate protocol for the tab bar controller.
 */
@protocol MHVerticalTabBarControllerDelegate <NSObject>

/**
 Delegate method that gets called when a view controller is selected.
 */
- (void)tabBarController:(MHVerticalTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@interface MHVerticalTabBarController : UIViewController <MHVerticalTabBarDelegate>

#pragma mark - properties

/**
 The delegate object.
 */
@property (nonatomic, weak) id<MHVerticalTabBarControllerDelegate> delegate;

/**
 View controllers for the tab bar. Setting this property assigns the tabs
 in the order they are in the array.
 */
@property (nonatomic, copy) NSArray *viewControllers;

/**
 The currently selected view controller
 */
@property (nonatomic, weak) UIViewController *selectedViewController;

/**
 The `MHVerticalTabBar` object
 */
@property (nonatomic, strong) MHVerticalTabBar *tabBar;

/**
 The index of the currently selected view controller
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

/**
 The width of the tab. Setting this property will change the frame of 
 the child view controllers of the tab bar controller.
 */
@property (nonatomic, assign) CGFloat tabBarWidth;


@end
