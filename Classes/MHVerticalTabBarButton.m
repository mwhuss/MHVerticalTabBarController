//
//  MHVerticalTabBarButton.m
//  MHVerticalTabBarController
//
//  Created by Marshall Huss on 1/3/13.
//  Copyright (c) 2013 mwhuss. All rights reserved.
//

#import "MHVerticalTabBarButton.h"

@implementation MHVerticalTabBarButton

- (id)initWithTabBarItem:(UITabBarItem *)tabBarItem {
    if (tabBarItem.image) {
        self = [self initWithTitle:tabBarItem.title image:tabBarItem.image selectedImage:nil];
    }
    else {
        self = [self initWithTitle:tabBarItem.title image:tabBarItem.finishedUnselectedImage selectedImage:tabBarItem.finishedSelectedImage];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if (self) {
        [self commonInit];
        _titleLabel.text = title;
        _imageView.image = image;
        _imageView.highlightedImage = selectedImage;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeCenter;
    
    _titleOffset = CGSizeZero;
    _imageOffset = CGSizeZero;
}

- (void)setSelected:(BOOL)selected {
    _imageView.highlighted = selected;
}

- (void)setLabelAttributes:(NSDictionary *)labelAttributes {
    _labelAttributes = labelAttributes;
    if (self.titleLabel.text) {
        self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:_labelAttributes];
    }
}

- (void)setImageOffset:(CGSize)imageOffset {
    _imageOffset = imageOffset;
    [self setNeedsLayout];
}

- (void)setTitleOffset:(CGSize)titleOffset {
    _titleOffset = titleOffset;
    [self setNeedsLayout];
}

- (void)layoutSubviews {

    if ([_titleLabel.attributedText length] > 0) {
        if (CGSizeEqualToSize(_titleOffset, CGSizeZero)) {
            _titleLabel.frame = CGRectOffset(self.bounds, 0, _imageView.image.size.height * 0.6);
        }
        else {
            _titleLabel.frame = CGRectOffset(self.bounds, self.titleOffset.width, self.titleOffset.height);
        }
        
        if (CGSizeEqualToSize(_imageOffset, CGSizeZero)) {
            _imageView.frame = CGRectOffset(self.bounds, 0, _imageView.image.size.height * -0.2);
        }
        else {
            _imageView.frame = CGRectOffset(self.bounds, self.imageOffset.width, self.imageOffset.height);
        }
    }
    else {
        _imageView.frame = self.bounds;
    }

    [self addSubview:_imageView];
    [self addSubview:_titleLabel];
}


@end
