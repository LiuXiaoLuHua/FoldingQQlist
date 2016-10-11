//
//  FoldingQQListViewController.m
//  FoldingQQlist
//
//  Created by xiangtai on 16/9/27.
//  Copyright © 2016年 sxy. All rights reserved.
//

#import "FoldingQQListViewController.h"
#import "FoldingQQListHeaderView.h"
#import "FoldingQQlistModel.h"

static const CGFloat tableViewHeaderViewHeight = 60;
static const CGFloat tableViewFooterViewHeight = 0.0001;

@interface FoldingQQListViewController ()<UITableViewDataSource , UITableViewDelegate,FoldingQQListViewDelegate>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) FoldingQQListHeaderView *headerView;
@property (nonatomic , strong) NSArray *dataArrays;

@end

@implementation FoldingQQListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"QQ好友列表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}
#pragma mark - FoldingQQListViewDelegate
-(void)headerViewTapGestureEvent:(UITapGestureRecognizer *)tapGesture {
    FoldingQQlistModel *model = self.dataArrays[tapGesture.view.tag];
    model.isOpen = !model.isOpen;
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FoldingQQlistModel *model = self.dataArrays[section];
    if (model.isOpen) {
        return model.name.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArrays.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    FoldingQQlistModel *model = self.dataArrays[indexPath.section];
    NSString *name = model.name[indexPath.row];
    cell.textLabel.text = name;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return tableViewHeaderViewHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return tableViewFooterViewHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FoldingQQListHeaderView *headerView = [[FoldingQQListHeaderView alloc] init];
    headerView.delegate = self;
    headerView.section = section;
    FoldingQQlistModel *model = self.dataArrays[section];
    headerView.model = model;
    return headerView;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
-(NSArray *)dataArrays // 此部分为仿后台返回的数据进行的操作，具体项目中按实际进行修改即可
{
    if (!_dataArrays) {
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.dataSource.count];
        for (NSDictionary *dict in self.dataSource) {
            FoldingQQlistModel *model = [FoldingQQlistModel listWithDict:dict];
            [array addObject:model];
        }
        self.dataArrays = [array copy];
    }
    return _dataArrays;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
