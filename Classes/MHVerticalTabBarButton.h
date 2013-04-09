//
//  MHVerticalTabBarButton.h
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 1/3/13.
//  Copyright (c) 2013 mwhuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHVerticalTabBarButton : UIControl

/**
 The title label for the tab bar button.
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 The image view for the tab bar button.
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 `NSAttributedString` label attributes that are applied to all buttons by default.
 */
@property (nonatomic, copy) NSDictionary *labelAttributes;

/**
 The offset of the titleLabel from the center.
 */
@property (nonatomic, assign) CGSize titleOffset;

/**
 The offset of the image from the center.
 */
@property (nonatomic, assign) CGSize imageOffset;

/**
 Sets the selected tab bar button.
 */
@property (nonatomic, assign, getter = isSelected) BOOL selected;

/**
 Initializer that takes a `UITabBarItem`.
 @param tabBarItem tab bar button to create
 */
- (id)initWithTabBarItem:(UITabBarItem *)tabBarItem;

/**
 Initializer that takes a title, image, and selected image.
 @param title Title for the button. If the image is nil the title will be centered, otherwise it will be offset below the image.
 @param image Image for the button. If the title is nil the image will be centered, otherwise it will be offset above the image.
 @param selectedImage Image to show when the button is selected
 */
- (id)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
