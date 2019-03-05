//
//  ToolbarButton.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "ToolbarButton.h"
#import "UIView+Extension.h"
@implementation ToolbarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithToolbarItem:(ToolbarItem *)item
{
    CGSize size = BUTTON_SIZE;
    self = [super initWithFrame:CGRectMake(0, 0, size.width, size.width)];
    if (self)
    {
        self.item = item;
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"nav-%@-off.png", item.imageName]];
        [self setImage:image forState:UIControlStateNormal];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"nav-%@-on.png", item.imageName]];
        [self setImage:selectedImage forState:UIControlStateSelected];
        
        
        //设置字体大小
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel sizeToFit];
    }
    return self;
}


#warning Fix
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.imageView)
    {
        UIImageView* imageView = self.imageView;
        self.imageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        self.imageView.frame = CGRectMake(imageView.frame.origin.x, 0, imageView.width, imageView.height);
    }
    
    
    if(self.titleLabel)
    {
        self.titleLabel.width = self.frame.size.width;
        self.titleLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        self.titleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, self.height-self.titleLabel.height, self.titleLabel.width, self.titleLabel.width);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
