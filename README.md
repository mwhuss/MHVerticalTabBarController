# MHVerticalTabBarController

## About

MHVerticalTabBarController is a custom vertical tab bar controller that works on iPhone and iPad and allows easy customization.

![Screenshot](http://f.cl.ly/items/3d3D122U3X3O2Q1s2a2M/tabbar-ipad.png)

## Installation

### Cocopods

`cocopods notes`
Add the following to your Podfile:

`pod 'MHVerticalTabBarController'`

### Manually

Add the `MHVerticalTabBarController/Classes` folder to your project. Note that this project uses [ARC](http://stackoverflow.com/questions/10523816/how-to-enable-arc-for-a-single-file).


## Usage

### General Usage

The tab bar controller has a `viewControllers` property that takes an array of `UIViewController`'s. 

```objective-c
MHVerticalTabBarController *tabBarController = [[MHVerticalTabBarController alloc] init];
tabBarController.viewControllers = @[vc1, vc2, vc3, vc4];
```

### Setting the width

To change the width of the tab bar use the `tabBarWidth` property on the tab bar controller. This will change the frame of the tab bar as well as all the child view controller.s

```objective-c
tabBarController.tabBarWidth = 180.0;
```

### Setting the title and image

The tab bar controller uses the child view controllers `UITabBarItem` to set the title and image on the tab. If `title` is nil then the image is centered in the tab.

If you'd like the title or image moved around each tab bar button includes a `titleOffset` and `imageOffset` property that's based on the center of the tab.

```objective-c
// put the title above the image
[self.tabBarController.tabBar.tabBarButtons enumerateObjectsUsingBlock:^(MHVerticalTabBarButton *button, NSUInteger idx, BOOL *stop) {
    button.titleOffset = CGSizeMake(0, -20);
    button.imageOffset = CGSizeMake(0, 20);
}];
```

### Title attributes

To set the default style for all the title labels use the `labelAttributes` property on the tab bar which takes an NSDictionary of attributed string attributes.

```objective-c
NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor redColor] };
self.tabBarController.tabBar.labelAttributes = attributes;
```


### Selected background view

The `MHVerticalTabBar` has `selectedBackgroundView` property that returns a `UIView`. By default this has a color, is square, has the same width as the tab bar, and animates when a new tab is selected.

```objective-c
// set animation duration, 0 disables it
self.tabBarController.tabBar.animationDuration = 0.0;
```

```objective-c
UIView *selectedBackgroundView = self.tabBarController.tabBar.selectedBackgroundView;
UIView *roundedView = [[UIView alloc] initWithFrame:selectedBackgroundView.bounds];
roundedView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
roundedView.frame = CGRectInset(roundedView.frame, 4, 4);
roundedView.backgroundColor = selectedBackgroundView.backgroundColor;
roundedView.layer.cornerRadius = 4.0;
selectedBackgroundView.backgroundColor = [UIColor clearColor];
[selectedBackgroundView addSubview:roundedView];
```

![Selected background view](http://f.cl.ly/items/020W1I3q0T363h1F0H0v/tabbar-iphone.png)


The tab bar also has a method to use an image as the selected background.

```objective-c
- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage;
```

## Credits

MHVerticalTabBarController is brought to you by [Marshall Huss](http://nezumiapp.com) and [contributors to the project](https://github.com/mwhuss/MHVerticalTabBarController/contributors). The icons were made by [Griffin Moore](http://okgriffin.com/). If you have feature suggestions or bug reports, feel free to help out by sending pull requests or by [creating new issues](https://github.com/mwhuss/MHVerticalTabBarController/issues/new). If you're using MHVerticalTabBarController in your project, please let me know! I can be reached [@mwhuss](http://twitter.com/mwhuss)