//
//  NSObject+parentViewController.m
//  ResponderChain
//
//  Created by 赵海亭 on 2017/12/25.
//  Copyright © 2017年 赵海亭. All rights reserved.
//

#import "NSObject+parentViewController.h"

@implementation NSObject (parentViewController)

- (UIViewController *)visibleViewController
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIViewController *rootViewController = window.rootViewController;
    
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedController = [(UITabBarController *)rootViewController selectedViewController];
        if ([selectedController isKindOfClass:[UINavigationController class]]) {
            return [(UINavigationController *)selectedController topViewController];
        } else {
            return selectedController;
        }
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *)rootViewController topViewController];
    } else {
        return rootViewController;
    }
}

@end
