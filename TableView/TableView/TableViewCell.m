//
//  TableViewCell.m
//  TableView
//
//  Created by 骏飞 奚 on 16/4/5.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)mask:(CGFloat)margin {
    self.layer.mask = [self getMask:margin/self.frame.size.height];
    self.layer.masksToBounds = YES;
}

- (CAGradientLayer *)getMask:(CGFloat)precentage {
    CAGradientLayer *mask = [CAGradientLayer layer];
    mask.frame = self.bounds;
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:1 - precentage].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:(2 - precentage)].CGColor;
    mask.colors = [NSArray arrayWithObjects:(__bridge id)outerColor,
                        (__bridge id)innerColor, nil];
    mask.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:1],nil];
    
    return mask;
}

@end
