//
//  ViewController.m
//  TableTest
//
//  Created by vera wang on 15/6/29.
//  Copyright (c) 2015年 slbw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (copy,nonatomic) NSArray *dwarves;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dwarves=@[@"hello",@"world",@"傻逼",@"大傻逼",@"ios",@"屌丝男士",@"十万个冷笑话",@"你好"];
    UITableView *tableView=(id)[self.view viewWithTag:1];
    UIEdgeInsets contentInset=tableView.contentInset;
    contentInset.top=20;
    [tableView setContentInset:contentInset];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setRowHeight:60];
    [tableView setSeparatorColor:[UIColor lightTextColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dwarves count];
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:SimpleTableIdentifier];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text=self.dwarves[indexPath.row];
    UIImage *image=[UIImage imageNamed:@"m"];
    cell.imageView.image=image;
    cell.detailTextLabel.text=@"呵呵，这是演示文本";
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lx",(long)indexPath.row);
    return indexPath.row;
}

-(NSIndexPath *)tableView:(UITableView *) tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0)
    {
        return nil;
    }
    else
    {
        return indexPath;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *rowValue=self.dwarves[indexPath.row];
//    NSString *message=[[NSString alloc] initWithFormat:@"you select %@",rowValue];
//    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Row Selected!" message:message delegate:nil cancelButtonTitle:@"Yes i did!" otherButtonTitles:nil];
//    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
