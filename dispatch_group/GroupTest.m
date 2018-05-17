//
//  GroupTest.m
//  dispatch_group
//
//  Created by doushuyao on 2018/5/17.
//  Copyright © 2018年 opooc. All rights reserved.
//

#import "GroupTest.h"
@interface GroupTest()
{
    dispatch_queue_t concurrent;
    NSMutableArray *arr;
}

@end

@implementation GroupTest
-(id)init{
    if(self =[super init]){
        concurrent = dispatch_queue_create("groupCurrent", DISPATCH_QUEUE_CONCURRENT);
        arr = [NSMutableArray array];
    }
    return self;
}

-(void)handl{
    dispatch_group_t groupP;
    
    for(id img in arr){
        
        dispatch_group_async(groupP, concurrent, ^{
            NSLog(@"%@",img);
        });
    }
    
    dispatch_notify(groupP, dispatch_get_main_queue(), ^{
        NSLog(@"finsh");
    });
}
@end
