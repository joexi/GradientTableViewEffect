//
//  ViewController.h
//  TableView
//
//  Created by 骏飞 奚 on 16/4/5.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UIImageView *_imgView;
    
    UITableView *_tableView;
}

@end

