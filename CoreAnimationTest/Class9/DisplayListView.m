//
//  DisplayListView.m
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/22.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import "DisplayListView.h"

@implementation DisplayListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    }
    return self;
}

@end
