//
//  ViewController.m
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import "ViewController.h"
#import "FoldingQQListViewController.h"

@interface ViewController ()

@property (nonatomic , strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ShowTheListButton:(id)sender {
    
    FoldingQQListViewController *foldingQQListVC = [[FoldingQQListViewController alloc] init];
    foldingQQListVC.dataSource = self.dataSource;
    [self.navigationController pushViewController:foldingQQListVC animated:YES];
}
-(NSArray *)dataSource
{
    if (!_dataSource) {
        self.dataSource = @[@{@"title":@"朋友" , @"name":@[@"朋友1",@"朋友2",@"朋友3"]},@{@"title":@"陌生人" , @"name":@[@"陌生人1",@"陌生人2"]},@{@"title":@"同学", @"name":@[@"同学1",@"同学2",@"同学3",@"同学4",@"同学5"]}];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
