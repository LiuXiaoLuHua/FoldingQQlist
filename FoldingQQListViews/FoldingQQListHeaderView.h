//
//  FoldingQQListHeaderView.h
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoldingQQlistModel;

@protocol FoldingQQListViewDelegate <NSObject>

-(void)headerViewTapGestureEvent:(UITapGestureRecognizer *)tapGesture;

@end
@interface FoldingQQListHeaderView : UIView

@property (nonatomic , strong) FoldingQQlistModel *model;
@property (nonatomic , assign) NSInteger   section;
@property (nonatomic , weak) id <FoldingQQListViewDelegate> delegate;

@end
