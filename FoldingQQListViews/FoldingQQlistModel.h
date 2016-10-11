//
//  FoldingQQlistModel.h
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoldingQQlistModel : NSObject

@property (nonatomic , strong) NSArray * name;
@property (nonatomic , copy)  NSString * title;
@property (nonatomic , assign) BOOL isOpen; // 自己添加的字段，判断其打开关闭的状态

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)listWithDict:(NSDictionary *)dict;

@end
