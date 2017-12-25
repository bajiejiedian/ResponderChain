//
//  EventProxy.m
//  ResponderChain
//
//  Created by 赵海亭 on 2017/12/25.
//  Copyright © 2017年 赵海亭. All rights reserved.
//

#import "EventProxy.h"
#import "UIResponder+Router.h"
#import "Const.h"
#import "NSObject+parentViewController.h"
#import "SecondViewController.h"

@interface EventProxy ()

@property (nonatomic, strong) NSDictionary<NSString *, NSInvocation *> *eventStrategy;

@end

@implementation EventProxy

#pragma mark - event response

- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    
    NSInvocation *invocation = self.eventStrategy[eventName];
    NSAssert(invocation, @"请先添加事件");
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}

- (NSInvocation *)createInvocationWithSelector:(SEL)sel {
    
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:sel];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:signature];
    inv.selector = sel;
    inv.target = self;
    return inv;
}

- (void)ticketEvent:(NSDictionary *)info {
    
    NSLog(@"i want to say %@", info[@"title"]);
}

- (void)promotionEvent:(NSDictionary *)info {
    
    Class class = NSClassFromString(info[@"vc"]);
    SecondViewController *con = [[class alloc] init];
    con.message = [info[@"title"] copy];
    [self.visibleViewController.navigationController pushViewController:con animated:YES];
}

#pragma mark - setter && getter

- (NSDictionary<NSString *,NSInvocation *> *)eventStrategy {
    
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           kBLGoodsDetailTicketEvent:[self createInvocationWithSelector:@selector(ticketEvent:)],
                           kBLGoodsDetailPromotionEvent:[self createInvocationWithSelector:@selector(promotionEvent:)],
                           };
    }
    return _eventStrategy;
}

@end
