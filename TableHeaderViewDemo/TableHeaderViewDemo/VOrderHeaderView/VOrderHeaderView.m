//
//  VOrderHeaderView.m
//  TableHeaderViewDemo
//
//  Created by Vols on 15/4/16.
//  Copyright (c) 2015年 Vols. All rights reserved.
//

#import "VOrderHeaderView.h"

#define kSCREEN_SIZE        [UIScreen mainScreen].bounds.size

@interface VOrderHeaderView()

@property (nonatomic, strong) NSArray * dataArr;
@property (nonatomic, strong) UITableView * parentTableView;


@property (nonatomic, strong) UIImageView * bgImgView;
@property (nonatomic, strong) UILabel * dateLabel;
@property (nonatomic, strong) UILabel * addressLabel;

@end

@implementation VOrderHeaderView

#pragma mark - public

- (id)initWithData:(NSString *)string tableView:(UITableView *)tableView{
    self = [super init];
    
    if (self) {
        self.dataArr = [string componentsSeparatedByString:@"&"];

        self.parentTableView = tableView;
        [self displayUI];

    }
    return self;
}



+ (float)heightForHeaderViewWithData:(NSString *)string{
    NSArray * array = [string componentsSeparatedByString:@"&"];
 
    NSString * str = array[2];
    CGSize size;
    if (![str isEqual:[NSNull null]]) {
        NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]};
        // 获取文字的宽高
        size = [str boundingRectWithSize:CGSizeMake(260, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    }
    else {
        size = CGSizeMake(260, 30);
    }
    
    return 100 + size.height - 30;
}


#pragma mark - private


- (void)displayUI{
    [self addSubview:self.bgImgView];
    
    [self addSubview:self.dateLabel];
    [self addSubview:self.addressLabel];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(27, 30, 100, 30)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.text = @"取餐地址：";
    [self addSubview:label];
  
}

- (void)setDataArr:(NSArray *)dataArr{
    self.frame = CGRectMake(0, 100, kSCREEN_SIZE.width, 100);
    _dataArr = dataArr;
}

- (UIImageView *)bgImgView{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.frame = self.bounds;
        
        NSLog(@"%@", NSStringFromCGRect(_bgImgView.frame));
        _bgImgView.backgroundColor = [UIColor orangeColor];
        _bgImgView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImgView.image = [UIImage imageNamed:@"待取image"];

    }
    return _bgImgView;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.frame = CGRectMake(27, 10, 160, 20);
        _dateLabel.font = [UIFont boldSystemFontOfSize:15];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.textColor = [UIColor whiteColor];
        _dateLabel.text = _dataArr[0];

    }
    return _dateLabel;
}

- (UILabel *)addressLabel{
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.frame = CGRectMake(27, 60, kSCREEN_SIZE.width-54, 20);
//        _addressLabel.frame = CGRectMake(27, 60, _parentTableView.bounds.size.width-54, 20);
        _addressLabel.font = [UIFont boldSystemFontOfSize:15];
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = [UIColor whiteColor];
        _addressLabel.numberOfLines = 0;
        
        CGSize size=[self contentSize:_dataArr[2]];
        _addressLabel.frame=CGRectMake(27, 60, size.width, size.height);
        _addressLabel.text = _dataArr[2];
    }
    return _addressLabel;
}




- (CGSize)contentSize:(NSString *)str{
    
    if (![str isEqual:[NSNull null]]) {
        NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f]};
        // 获取文字的宽高
        CGSize size = [str boundingRectWithSize:CGSizeMake(260, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        return size;
    }
    else {
        return CGSizeMake(260, 30);
    }
}


@end
