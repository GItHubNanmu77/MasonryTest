//
//  CellPerson.m
//  MansonyTest
//
//  Created by yanyu on 2018/10/9.
//  Copyright © 2018年 yanyu. All rights reserved.
//


//屏幕宽高
#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height


#define RATIO_WIDHT750 [UIScreen mainScreen].bounds.size.width/375.0
#define RATIO_HEIGHT750 [UIScreen mainScreen].bounds.size.height/667.0


#import "CellPerson.h"
#import <Masonry.h>

@interface CellPerson()
@property (nonatomic, strong) UIImageView *ivHeader;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbContent;
@property (nonatomic, strong) UITextField *tfNum;
@property (nonatomic, strong) UIButton *btnSel;
@property (nonatomic, strong) UIButton *btnClose;
@end
@implementation CellPerson
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      //  self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _ivHeader = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivHeader.image = [UIImage imageNamed:@""];
        _ivHeader.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_ivHeader];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbName.textColor = [UIColor blackColor];
        _lbName.font = [UIFont systemFontOfSize:15*RATIO_WIDHT750];
        [self.contentView addSubview:_lbName];
        
        _lbContent = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbContent.textColor = [UIColor blueColor];
        _lbContent.font = [UIFont systemFontOfSize:14*RATIO_WIDHT750];
        _lbContent.numberOfLines = 0;
        [self.contentView addSubview:_lbContent];
        
        _tfNum = [[UITextField alloc]initWithFrame:CGRectZero];
        _tfNum.font = [UIFont systemFontOfSize:14];
        _tfNum.textColor = [UIColor blackColor];
        _tfNum.placeholder = @"请输入手机号";
        _tfNum.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_tfNum];
        
        _btnSel = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnSel setTitle:@"VIP" forState:UIControlStateNormal];
        [_btnSel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnSel.titleLabel.font = [UIFont systemFontOfSize:20];
        _btnSel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_btnSel];
        
        _btnClose = [[UIButton alloc] initWithFrame:CGRectZero];
        [_btnClose setTitle:@"X" forState:UIControlStateNormal];
        [_btnClose setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnClose.titleLabel.font = [UIFont systemFontOfSize:20];
        _btnClose.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_btnClose];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.ivHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.left.equalTo(self.contentView).mas_offset(10);
    }];
    
    [self.lbName mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.ivHeader.mas_centerY);
        make.top.equalTo(self.ivHeader.mas_top).offset(5);
        make.left.equalTo(self.ivHeader.mas_right).mas_offset(10);
        make.height.lessThanOrEqualTo(@15);
    }];
    [self.btnSel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.ivHeader.mas_centerY);
        //        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.lbName.mas_right).offset(5);
        make.right.lessThanOrEqualTo(self.btnClose.mas_left).offset(-10);
        make.width.equalTo(@30);
    }];
    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.ivHeader.mas_centerY);
        make.right.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.tfNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lbName.mas_bottom).offset(5);
        make.left.equalTo(self.ivHeader.mas_right).mas_offset(10);
        make.width.lessThanOrEqualTo(@150);
    }];
    
    
    [self.lbContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).mas_offset(10);
        make.right.equalTo(self.contentView).mas_offset(-10);
        make.top.equalTo(self.ivHeader.mas_bottom).mas_offset(5);
        make.height.greaterThanOrEqualTo(@15);
    }];
}

+ (CGFloat)calHeight{
    return 100;
}
- (void)updateData{
    
}
- (void)updateData:(NSDictionary *)data{
    self.lbName.text = data[@"num"];
    self.lbContent.text = data[@"name"];
    
//    [self.lbName mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.tfNum.mas_left).offset(-5);
//    }];
//    [self.tfNum mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.lbName.mas_right).offset(5);
//    }];
}

+ (CGFloat)calHeightWithData:(NSDictionary *)data{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = data[@"name"];
    label.font = [UIFont systemFontOfSize:14*RATIO_WIDHT750];
    CGSize z = [label sizeThatFits:CGSizeMake(DEVICEWIDTH - 20 , 15)];
    
    return 50 + 5 + z.height+5;
}

@end
