//
//  CellPerson.h
//  MansonyTest
//
//  Created by yanyu on 2018/10/9.
//  Copyright © 2018年 yanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellPerson : UITableViewCell
+ (CGFloat)calHeight;
+ (CGFloat)calHeightWithData:(NSDictionary *)data;
- (void)updateData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
