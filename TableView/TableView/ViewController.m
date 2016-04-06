//
//  ViewController.m
//  TableView
//
//  Created by 骏飞 奚 on 16/4/5.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        
        _imgView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _imgView.image = [UIImage imageNamed:@"aaa"];
        [self.view addSubview:_imgView];
        
        _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.allowsSelection = NO;
        _tableView.alwaysBounceVertical = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:_tableView];
        [_tableView reloadData];
        
        [_tableView setScrollEnabled:YES];
        
        [self.view bringSubviewToFront:_tableView];
        _tableView.userInteractionEnabled = YES;
        
        
        [_tableView setBounces:NO];
        
        [self reload:_tableView];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload:(UIScrollView *)scrollView
{
    float offset = fabs(scrollView.contentOffset.y);
    for (TableViewCell *cell in _tableView.visibleCells) {
        [cell mask:(offset - cell.frame.origin.y + cell.frame.size.height)];
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self reload:scrollView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] init];
    }
    cell.index = (int)indexPath.row;
    if (indexPath.row % 2) {
         [cell setBackgroundColor:[UIColor colorWithRed:235./255. green:241./255. blue:223./255. alpha:1]];
    }
    else {
         [cell setBackgroundColor:[UIColor colorWithRed:116./255. green:147./255. blue:67./255. alpha:1]];
    }
//     [cell setBackgroundColor:[UIColor clearColor]];
    cell.textLabel.text = @"1";
    return cell;
}
@end

