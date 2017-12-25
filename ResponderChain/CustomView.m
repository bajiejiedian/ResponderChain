//
//  CustomView.m
//  ResponderChain
//
//  Created by 赵海亭 on 2017/12/25.
//  Copyright © 2017年 赵海亭. All rights reserved.
//

#import "CustomView.h"
#import "UIResponder+Router.h"
#import "Const.h"

@interface CustomView ()



@end

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)btnClick:(id)sender {
    
    [self routerEventWithName:kBLGoodsDetailTicketEvent userInfo:@{@"title":@"i have a pen"}];
}

@end
