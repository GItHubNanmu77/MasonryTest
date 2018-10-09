//
//  ViewController.m
//  MansonyTest
//
//  Created by yanyu on 2018/10/9.
//  Copyright © 2018年 yanyu. All rights reserved.
//


//屏幕宽高
#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHEIGHT [UIScreen mainScreen].bounds.size.height

//宽比a



//基本组件高度
#define IS_IPHONE_X ((DEVICEHEIGHT == 812.0f) ? YES : NO)
#define STATUS_HEIGHT  ((IS_IPHONE_X==YES)?44.0f: 20.0f)        //状态栏高度
#define NAV_STATUS_HEIGHT ((IS_IPHONE_X==YES)?88.0f: 64.0f)       //导航+状态栏高度
#define NAV_HEIGHT 44.0f      //导航
#define TABBAR_HEIGHT ((IS_IPHONE_X==YES)?83.0f: 49.0f)          //Tabbar高度




#import "ViewController.h"
#import "CellPerson.h"
#import <Masonry.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.table];
//    [self.view addSubview:self.btn];
//    [self setupScrollView];
    [self setupkeyborad];
    self.dataSource = @[@{@"name":@"大幅度发送到发送到发送到",@"num":@"阿斯顿发"},
                        @{@"name":@"阿斯顿发送到发送到士大夫撒地方是否大是大非发",@"num":@"发多发送到发送到发生撒旦法的说法少"},
                        @{@"name":@"啊",@"num":@"啊"},
                        @{@"name":@"阿斯顿发送到发送到发的发发的所发生的发送到送到发送到发送到",@"num":@"大师法师打发斯蒂芬阿斯蒂芬斯蒂芬阿斯顿发送到发送到发斯蒂芬阿斯顿发送到发"},
                        @{@"name":@"阿斯顿发送到大范德萨发斯蒂芬阿斯顿发阿斯顿发送到发斯蒂芬阿斯顿发阿斯顿发阿斯顿发阿斯顿发阿斯顿发阿斯顿发撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法撒旦法大是大非撒旦法 撒旦法士大夫是的撒多发送到发多少多方式啊的说法的说法大范德萨 多方式发送到发送到发送到发斯蒂芬阿斯顿发的说法是的法师打发斯蒂芬的撒发送到发送到发送到发送发打发士大夫撒地方阿斯顿发送到发水电费啊",@"num":@"阿斯顿发送到发送到"},
                        @{@"name":@"大幅度发送到发送到发送到",@"num":@"阿斯顿发"}];
    
}
#pragma  mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CellPerson calHeightWithData:self.dataSource[indexPath.row]];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellPerson";
    CellPerson *cell = (CellPerson*)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[CellPerson alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell updateData:self.dataSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if(!header){
        header = [[UIView alloc]init];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Footer"];
    if(!footer){
        footer = [[UIView alloc]init];
        [footer addSubview:self.btn];
    }
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableView*)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, DEVICEWIDTH, DEVICEHEIGHT-20) style:UITableViewStyleGrouped];
        _table.backgroundColor = [UIColor whiteColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (UIButton*)btn{
    if(!_btn){
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, DEVICEWIDTH - 20, 50)];
        [_btn setTitle:@"按钮" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor redColor];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn.tag = 100;
        [_btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (void)clickAction:(UIButton *)sender{
    NSLog(@"按钮点击");
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
//    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view).offset(-10);
//        make.bottom.equalTo(self.view).offset(-10);
//        make.height.mas_equalTo(50);
//    }];
}
- (void)setupScrollView{
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
        
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for( int i = 1 ; i <= count ; ++i )
        
    {
        
        UIView *subv = [UIView new];
        
        [container addSubview:subv];
        
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(container);
            
            make.height.mas_equalTo(@(20*i));
            
            if( lastView )
                
            {
                
                make.top.mas_equalTo(lastView.mas_bottom);
                
            }
            
            else
                
            {
                
                make.top.mas_equalTo(container.mas_top);
                
            }
            
        }];
        
        lastView = subv;
        
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(lastView.mas_bottom);
        
    }];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupkeyborad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    _textField                 = [UITextField new];
    _textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        //left,right,centerx,y  不能共存只能有其二
        make.left.mas_equalTo(20);
        //        make.right.mas_equalTo(-60);
        make.centerX.equalTo(weakSelf.view);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-10);
    }];
    
    // 注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat keyboardHeight   = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改下边距约束
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-keyboardHeight);
    }];
    
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    
    // 获得键盘动画时长
    NSDictionary *userInfo   = [notification userInfo];
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改为以前的约束（距下边距0）
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
    }];
    
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
