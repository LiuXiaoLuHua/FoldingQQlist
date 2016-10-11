//
//  FoldingQQlistModel.m
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import "FoldingQQlistModel.h"

@implementation FoldingQQlistModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)listWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
