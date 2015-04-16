//
//  ViewController.m
//  TableHeaderViewDemo
//
//  Created by Vols on 15/4/16.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "ViewController.h"
#import "VOrderHeaderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString * string = @"8月4日 星期一&afefwf#afefafwfef&8月4日 星期一8月4日 星期一8月4日 星期一8月4日 星期一8月4日";
    
    VOrderHeaderView * orderView = [[VOrderHeaderView alloc] initWithData:string tableView:nil];
    orderView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:orderView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
