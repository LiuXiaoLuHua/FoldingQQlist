//
//  FoldingQQListHeaderView.m
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import "FoldingQQListHeaderView.h"
#import "FoldingQQlistModel.h"

@interface FoldingQQListHeaderView ()

@property (nonatomic , weak) UILabel      * titleLabel;
@property (nonatomic , weak) UIImageView  * arrowImageView;

@end
@implementation FoldingQQListHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self loadMySubviews];
    }
    return self;
}
-(void)loadMySubviews {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    [self addSubview:arrowImageView];
    self.arrowImageView = arrowImageView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureEvent:)];
    [self addGestureRecognizer:tapGesture];
}
-(void)setModel:(FoldingQQlistModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    if (model.isOpen) {
        [self.arrowImageView setImage:[UIImage imageNamed:@"home_pupilus_arrow_down"]];
    } else {
        [self.arrowImageView setImage:[UIImage imageNamed:@"home_pupilus_arrow_up"]];
    }
}
-(void)setSection:(NSInteger)section {
    _section = section;
    self.tag = section;
}
-(void)tapGestureEvent:(UITapGestureRecognizer *)tapGesture {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerViewTapGestureEvent:)]) {
        [self.delegate headerViewTapGestureEvent:tapGesture];
    }
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 15;
    
    self.titleLabel.frame = CGRectMake(padding, 0, kScreenWidth - padding, CGRectGetHeight(self.frame));
    UIImage *image = [UIImage imageNamed:@"home_pupilus_arrow_down"];
    CGFloat arrowImageX = kScreenWidth - image.size.width - padding;
    CGFloat arrowImageY = (CGRectGetHeight(self.frame) - image.size.height) / 2;
    self.arrowImageView.frame = CGRectMake(arrowImageX, arrowImageY, image.size.width, image.size.height);
    
}
@end
