//
//  TableViewController.m
//  TableHeaderViewDemo
//
//  Created by Vols on 15/4/16.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "TableViewController.h"

#import "VOrderHeaderView.h"

@interface TableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSource = [[NSMutableArray alloc] init];
}


#pragma mark - UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return _dataSource.count;
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [_dataSource[section] count];
    return 2;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    NSString *key=[_datas objectAtIndex:section];
    
    NSString * string = @"8月4日 星期一&afefwf#afefafwfef&8月4日 星期一8月4日 星期一8月4日 星期一8月4日 星期一8月4日";

    return [VOrderHeaderView heightForHeaderViewWithData:string];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    NSString * string = @"8月4日 星期一&afefwf#afefafwfef&8月4日 星期一8月4日 星期一8月4日 星期一8月4日 星期一8月4日";

    VOrderHeaderView * headerView = [[VOrderHeaderView alloc] initWithData:string tableView:tableView];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 15)];
    view.backgroundColor=[UIColor whiteColor];
    return view;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"DelayTakeOrderTableCell";
    
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //    for(UIView * view in cell.contentView.subviews){
    //        [view removeFromSuperview];
    //    }
    

    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
