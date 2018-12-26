//
//  DisplayListView.h
//  CoreAnimationTest
//
//  Created by suojl on 2018/8/22.
//  Copyright © 2018年 com.dengyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayListView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) double contentViewHeight;

- (void)showView;
- (void)hiddenView;
@end
