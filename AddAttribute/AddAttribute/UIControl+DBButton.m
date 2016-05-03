//
//  UIControl+DBButton.m
//  AddAttribute
//
//  Created by DengBin on 16/5/3.
//  Copyright © 2016年 DB. All rights reserved.
//

#import "UIControl+DBButton.h"

#import <objc/runtime.h>
static const char * DB_CLICKKEY = "DB_clickkey";
@implementation UIControl (DBButton)
- (void)setDb_time:(NSTimeInterval)db_time{
    objc_setAssociatedObject(self, DB_CLICKKEY, @(db_time), OBJC_ASSOCIATION_ASSIGN);
    
}
- (NSTimeInterval)db_time{
    return [objc_getAssociatedObject(self, DB_CLICKKEY) doubleValue];
    
}
@end
