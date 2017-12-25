//
//  UIResponder+Router.h
//  ResponderChain
//
//  Created by 赵海亭 on 2017/12/25.
//  Copyright © 2017年 赵海亭. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *_Nullable)userInfo;

NS_ASSUME_NONNULL_END

@end
