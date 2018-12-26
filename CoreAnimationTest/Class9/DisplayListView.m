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
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        self.hidden = YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
        tapRecognizer.delegate = self;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {//判断如果点击的是tableView的cell，就把手势给关闭了
        return NO;//关闭手势
    }
    return YES;
}

-(void)showView{
    self.hidden = NO;
    [UIView animateWithDuration:.3f animations:^{
        CGRect rect = self.contentView.frame;
        rect.size.height = self.contentViewHeight;
        self.contentView.frame = rect;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    } completion:nil];
}

- (void)hiddenView{
    [UIView animateWithDuration:.3f animations:^{
        CGRect rect = self.contentView.frame;
        rect.size.height = 0;
        self.contentView.frame = rect;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
-(void)setContentView:(UIView *)contentView{
    if (!_contentView){
        _contentView = contentView;
        [self addSubview:contentView];

    }else if (_contentView != contentView) {
        [_contentView removeFromSuperview];
        _contentView = contentView;
        [self addSubview:contentView];
    }
}

- (void)dealloc
{
    NSLog(@"DisplayListView Dealloc");
}
@end
