//
//  VOrderHeaderView.h
//  TableHeaderViewDemo
//
//  Created by Vols on 15/4/16.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VOrderHeaderView : UIView

- (id)initWithData:(NSString *)string tableView:(UITableView *)tableView;

+ (float)heightForHeaderViewWithData:(NSString *)string;


@end
