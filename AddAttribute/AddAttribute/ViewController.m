//
//  ViewController.m
//  AddAttribute
//
//  Created by DengBin on 16/5/3.
//  Copyright © 2016年 DB. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+DBButton.h"
#import "DBObjcet.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.db_time=1;
    
    [self tryAddingFunction];
    [self tryMemberFunc];
    // Do any additional setup after loading the view, typically from a nib.
}
//获取类的属性包括私有的 并修改
- (void)tryMember
{
    DBObjcet *object = [[DBObjcet alloc] init];
    
    NSLog(@"before runtime:%@", [object description]);
    
    unsigned int count = 0;
    Ivar *members = class_copyIvarList([DBObjcet class], &count);
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        const char *memberName = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var);
        NSLog(@"%s----%s", memberName, memberType);
    }
    
    
    Ivar m_name = members[0];
    Ivar m_sex = members[1];
 
    object_setIvar(object, m_name, @"ios");
    object_setIvar(object, m_sex, @"男");

    NSLog(@"after runtime:%@", [object description]);
    
    
}

//获取类的方法 及 添加方法
- (void)tryMemberFunc
{
    unsigned int count = 0;
    Method *memberFuncs = class_copyMethodList([DBObjcet class], &count);//所有在.m文件显式实现的方法都会被找到
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(memberFuncs[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        NSLog(@"member method:%@", methodName);
    }
    
    DBObjcet *object = [[DBObjcet alloc] init];
    objc_msgSend(object,@selector(method::),1,@"1");
   // [object method:1:@"1"];//当你敲入father实例后，是无法获得method的提示的，只能靠手敲。而且编译器会给出"-method" not found的警告，可以忽略
}

//替换系统方法
- (void)tryMethodExchange
{
    Method method1 = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method method2 = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(method1, method2);
    NSLog(@"lowcase of WENG zilin:%@", [@"WENG zilin" lowercaseString]);
    NSLog(@"uppercase of WENG zilin:%@", [@"WENG zilin" uppercaseString]);
}








- (void)tryAddingFunction
{
    class_addMethod([DBObjcet class],@selector(method::) , (IMP)myAddingFunction, "i@:i@");
    
}
//具体的实现，即IMP所指向的方法
int myAddingFunction(id self, SEL _cmd, int var1, NSString *str)
{
    NSLog(@"I am added funciton");
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
