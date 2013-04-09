//
//  MHVerticalTabBar.h
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 1/3/13.
//  Copyright (c) 2013 mwhuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MHVerticalTabBar;

/*
 Tab bar delegate
 */
@protocol MHVerticalTabBarDelegate <NSObject>

/*
 Delegate method called when an item has been selected
 */
- (void)tabBar:(MHVerticalTabBar *)tabBar didSelectItem:(UITabBarItem *)item;

@end

@interface MHVerticalTabBar : UIScrollView

#pragma mark - properties

/**
 The tab bar delegate.
 */
@property (nonatomic, assign) id<MHVerticalTabBarDelegate> tabBarDelegate;

/**
 The selected index of the tab bar.
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

/**
 The animation duration for the selectedBackgroundView which slides to the 
 selected index. The default duration is 0.2s.
 */
@property (nonatomic, assign) CGFloat animationDuration;

/**
 An `NSArray` of the the `MHVerticalTabBarButton` objects.
 */
@property (nonatomic, copy) NSArray *tabBarButtons;

/**
 An `NSArray` of the the `UITabBarButtonItem` objects.
 */
@property (nonatomic, copy) NSArray *items;

/**
 `NSAttributedString` label attributes that are applied to all buttons by default.
 */
@property (nonatomic, copy) NSDictionary *labelAttributes;

/**
 The selected background view
 */
@property (nonatomic, strong) UIView *selectedBackgroundView;


#pragma mark - instance methods


/**
 Sets the selected background image by creating an `UIImageView` and adding it as a subview
 @param selectedBackgroundImage image to set as the background for the selected background view
 */
- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage;

@end
