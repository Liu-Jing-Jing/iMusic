//
//  ZZTabBarViewController.m
//  iMusic
//
//  Created by Mark Lewis on 19-3-1.
//  Copyright (c) 2019年 Tsinghua University. All rights reserved.
//


#import "ZZTabBarViewController.h"
#import "ToolbarContainerView.h"
#import "TabsResponse.h"
#import "ToolbarItem.h"
#import "ToolbarButton.h"

@interface ZZTabBarViewController()
{
    int _selectedButtonIndex;
}
@property (nonatomic, strong) NSMutableArray * items;
@property (nonatomic, strong) NSMutableArray * buttons;
@property (nonatomic, assign) int selectedButtonIndex;
@end


@implementation ZZTabBarViewController
//@synthesize
- (int)selectedButtonIndex
{
    return _selectedButtonIndex;
}

- (void)setSelectedButtonIndex:(int)newButtonIndex
{
    if(_selectedButtonIndex != 1)
    {
        ToolbarButton *currentButton = self.buttons[_selectedButtonIndex];
        currentButton.selected = NO;
    }
    ToolbarButton *newButton = self.buttons[newButtonIndex];
    newButton.selected = YES;
        
    // Update the active view controller
    UIView* buttonContainerView = [self.view viewWithTag:1];
    if (buttonContainerView != nil)
    {
        CGRect onScreenFrame = self.view.frame;
        onScreenFrame.size.height -= buttonContainerView.frame.size.height;
        
        onScreenFrame.origin.y += buttonContainerView.frame.size.height;
        
        CGRect offScreenFrame = onScreenFrame;
        offScreenFrame.origin.y += offScreenFrame.size.height;
        
        if (_selectedButtonIndex == -1)
        {
            
            ToolbarItem *item = self.items[newButtonIndex];
            UIViewController* visibleViewController =item. viewController;
            
            visibleViewController.view.frame = onScreenFrame;
            [self addChildViewController:visibleViewController];
            
            [self.view addSubview:visibleViewController.view];
            
#warning 这个是什么API
            [visibleViewController didMoveToParentViewController:self];
        }
        else
        {
            ToolbarItem *item = self.items[_selectedButtonIndex];
            
            UIViewController* visibleViewController =item.viewController;

            item = self.items[newButtonIndex];
            UIViewController* newViewController = item.viewController;
            
            [visibleViewController willMoveToParentViewController:nil];
            
            newViewController.view.frame = offScreenFrame;
            [self addChildViewController:newViewController];
#warning 为什么要这样做
            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
#warning iOS5 API
            [self transitionFromViewController:visibleViewController toViewController:newViewController
                                      duration:0.25
                                       options:UIViewAnimationOptionCurveLinear animations:^{
                                           // Slide the visible controller down
                                           // 动画代码
                                           visibleViewController.view.frame = offScreenFrame;
                                       } completion:^(BOOL finished) {
                                           [visibleViewController.view removeFromSuperview];
                                           [self.view addSubview:newViewController.view];
                                           newViewController.view.frame = offScreenFrame;
                                           
                                           
                                           [UIView animateWithDuration:0.25 animations:^{
                                               newViewController.view.frame = onScreenFrame;
                                           } completion:^(BOOL finished) {
                                               [[UIApplication sharedApplication] endIgnoringInteractionEvents];
                                           }];
                                       }];
        }
    }

        _selectedButtonIndex = newButtonIndex;
}

//lazy
- (NSMutableArray *)items
{
    if (_items == nil)
    {
        UITableViewController *test1 = [[UITableViewController alloc] init];
        ToolbarItem *Tabs = [ToolbarItem toolbarItemWithTitle:@"Tabs" andImageName:@"tabs" vc:test1];
        ToolbarItem *Bookmarks = [ToolbarItem toolbarItemWithTitle:@"Bookmarks" andImageName:@"bookmarks" vc:test1];
        ToolbarItem *History = [ToolbarItem toolbarItemWithTitle:@"History" andImageName:@"history" vc:test1];
        ToolbarItem *Reader = [ToolbarItem toolbarItemWithTitle:@"Reader" andImageName:@"reader" vc:test1];
        ToolbarItem *Settings = [ToolbarItem toolbarItemWithTitle:@"Settings" andImageName:@"settings" vc:test1];
        
        _items = [NSMutableArray arrayWithArray:@[Tabs, Bookmarks, History, Reader, Settings]];
    }
//[ToolbarItem.Tabs, ToolbarItem.Bookmarks, ToolbarItem.History, ToolbarItem.Reader, ToolbarItem.Settings]
    return _items;
}

- (NSMutableArray *)buttons
{
    if (_buttons == nil)
    {
        _buttons = [NSMutableArray arrayWithArray:@[]];
    }
    
    return _buttons;
}


- (void)tappedButton:(UIButton *)sender
{
    for (int index = 0; index < self.buttons.count; index++)
    {
        ToolbarButton *button = self.buttons[index];
        
        if ([sender isEqual:button])
        {
            self.selectedButtonIndex = index;
            break;
        }
    }

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/**
 *  Lifecycle
 */
- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    _selectedButtonIndex = -1;
    id buttonContainerView = [self.view viewWithTag:1];
    if (buttonContainerView != nil)
    {
        for (int index = 0; index < self.items.count; index++)
        {
            ToolbarItem *item = self.items[index];
            
            ToolbarButton* toolbarButton = [[ToolbarButton alloc] initWithToolbarItem:item];
            [buttonContainerView addSubview:toolbarButton];
            [toolbarButton addTarget:self
                              action:@selector(tappedButton:)
                    forControlEvents:UIControlEventTouchUpInside];
            [self.buttons addObject:toolbarButton];
            
        }

        
    }
    _selectedButtonIndex = 0;
}
@end
