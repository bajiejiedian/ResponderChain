//
//  ViewController.m
//  ResponderChain
//
//  Created by 赵海亭 on 2017/12/25.
//  Copyright © 2017年 赵海亭. All rights reserved.
//

#import "ViewController.h"
#import "UIResponder+Router.h"
#import "EventProxy.h"
#import "Const.h"
#import "SecondViewController.h"

@interface ViewController ()

/** proxy */
@property (nonatomic, strong) EventProxy *proxy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pushClick:(id)sender {
    
    NSDictionary *param = @{
                            @"vc":NSStringFromClass([SecondViewController class]),
                            @"title":@"Merry Christmas",
                            };
    [self.proxy handleEvent:kBLGoodsDetailPromotionEvent userInfo:param];
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    
    [self.proxy handleEvent:eventName userInfo:userInfo];
}

- (EventProxy *)proxy {
    
    if (_proxy == nil) {
        _proxy = [EventProxy new];
    }
    return _proxy;
}



@end
