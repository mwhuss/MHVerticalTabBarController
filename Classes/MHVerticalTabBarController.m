//
//  MHVerticalTabBarController.m
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 1/3/13.
//  Copyright (c) 2013 mwhuss. All rights reserved.
//

#import "MHVerticalTabBarController.h"


@implementation MHVerticalTabBarController


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) { [self mh_commonInit]; }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { [self mh_commonInit]; }
    return self;
}

- (void)mh_commonInit {
    _tabBar = [[MHVerticalTabBar alloc] init];
    _tabBar.tabBarDelegate = self;
    _tabBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tabBarWidth = 110.0;
    [self.view addSubview:_tabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tabBarWidth = _tabBarWidth;
//    _tabBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    [self.view addSubview:_tabBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.selectedViewController viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.selectedViewController viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.selectedViewController viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.selectedViewController viewDidDisappear:animated];
}

- (NSArray *)viewControllers {
    return self.childViewControllers;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    
    // remove old child view controllers
    [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        [viewController willMoveToParentViewController:nil];
		[viewController removeFromParentViewController];
    }];
    
    // add new view controllers as children
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop) {
        [self addChildViewController:viewController];
        [viewController didMoveToParentViewController:self];
    }];
    
    // grab the tab bar items from the view controllers
    self.tabBar.items = [viewControllers valueForKey:@"tabBarItem"];
    
    // set the selected index and selected view controller to index 0
    self.tabBar.selectedIndex = 0;
    
    [self tabBar:self.tabBar didSelectItem:self.tabBar.items[0]];
}

#pragma mark - properties

- (NSUInteger)selectedIndex {
    return [self.childViewControllers indexOfObject:self.selectedViewController];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex > [self.viewControllers count]) return;

    self.selectedViewController = [self.childViewControllers objectAtIndex:selectedIndex];
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    if (![self.childViewControllers containsObject:selectedViewController]) return;

    _selectedViewController = selectedViewController;
    
    NSUInteger index = [self.childViewControllers indexOfObject:selectedViewController];
    self.tabBar.selectedIndex = index;
    
    [self swapViewController:_selectedViewController];
}

- (void)setTabBarWidth:(CGFloat)tabBarWidth {
    _tabBarWidth = tabBarWidth;
    
    _tabBar.frame =
    CGRectMake(0,
               0,
               _tabBarWidth,
               CGRectGetHeight(self.view.bounds));
    
    self.selectedViewController.view.frame =
    CGRectMake(_tabBarWidth,
               0,
               CGRectGetWidth(self.view.bounds) - _tabBarWidth,
               CGRectGetHeight(self.view.bounds));
}


#pragma mark - MHVerticalTabBarDelegate

- (void)tabBar:(MHVerticalTabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSUInteger index = [self.tabBar.items indexOfObject:item];
    
	UIViewController *viewController = self.childViewControllers[index];
    
    if (self.selectedViewController == viewController) {
        if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navController = (UINavigationController *)self.selectedViewController;
            [navController popToRootViewControllerAnimated:YES];
        }
    }
    else {
        [self swapViewController:viewController];
        
        if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
            [self.delegate tabBarController:self didSelectViewController:_selectedViewController];
        }
    }
}

#pragma mark - private

- (void)swapViewController:(UIViewController *)viewController {
    viewController.view.frame =
    CGRectMake(self.tabBarWidth,
               0,
               CGRectGetWidth(self.view.bounds) - self.tabBarWidth,
               CGRectGetHeight(self.view.bounds));
    viewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [_selectedViewController.view removeFromSuperview];
    [self.view addSubview:viewController.view];
    
    _selectedViewController = viewController;
}



@end
