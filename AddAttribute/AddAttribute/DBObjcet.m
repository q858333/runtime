//
//  DBObjcet.m
//  AddAttribute
//
//  Created by DengBin on 16/5/4.
//  Copyright © 2016年 DB. All rights reserved.
//

#import "DBObjcet.h"
#import <objc/runtime.h>

@interface DBObjcet ()
{
    NSString *_sex;
}
@end

@implementation DBObjcet



- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, age:%@ ,sex:%@ ", _name, self.age ,_sex];
}

- (void)sayHello
{
    NSLog(@"hello , my name is %@",_name);
}

+ (void)sayGoodbye
{
    NSLog(@"sayGoodbye");
}



@end
