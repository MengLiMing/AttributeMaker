//
//  MainController.m
//  AttributeMaker
//
//  Created by my on 16/6/6.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "MainController.h"

@interface MainController ()
{
    NSArray *listArray;
}

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    listArray = @[@"简单文本"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = 0;
    cell.textLabel.text = listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self.navigationController pushViewController:[NSClassFromString(@"CustomViewController") new] animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
