//
//  ToolbarContainerView.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//

#import "ToolbarContainerView.h"
// Color and height of the orange divider
#define DIVIDER_COLOR [UIColor colorWithRed:255.0/255.0 green:149.0/255.0 blue:0.0 alpha:1.0];
#define DIVIDER_HEIGHT 4.0
#define BUTTON_SIZE CGSizeMake(72, 56)

//let DIVIDER_COLOR: UIColor = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0, alpha: 1.0)
//let DIVIDER_HEIGHT: CGFloat = 4.0

@implementation ToolbarContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    // get current context
    CGContextRef ctxRef = UIGraphicsGetCurrentContext();
    UIColor *color = DIVIDER_COLOR;
    CGContextSetFillColorWithColor(ctxRef, color.CGColor);
    
    CGSize size = rect.size;
    CGContextFillRect(ctxRef, CGRectMake(0, size.height-DIVIDER_HEIGHT, size.width, DIVIDER_HEIGHT));
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //
    CGSize size = self.frame.size;
    CGSize buttonSize = BUTTON_SIZE;
    CGFloat width = size.width- self.subviews.count*BUTTON_SIZE.width;
    CGFloat height = size.height- buttonSize.height;
    CGPoint origin = CGPointMake(width/2.0, height/2.0);
    
    origin.y += 15-DIVIDER_HEIGHT;
    
    for (UIView *view in self.subviews)
    {
        view.frame = CGRectMake(origin.x, origin.y, view.frame.size.width, view.frame.size.height);
        origin.x += buttonSize.width;
    }
}

@end
