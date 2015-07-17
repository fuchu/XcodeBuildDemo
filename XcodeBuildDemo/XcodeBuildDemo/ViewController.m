//
//  ViewController.m
//  XcodeBuildDemo
//
//  Created by housl on 15/7/17.
//  Copyright (c) 2015年 housl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *channelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    channelLabel.text = [NSString stringWithFormat:@"当前渠道:%@",[self v_getChannel]];
    channelLabel.textAlignment = NSTextAlignmentCenter;
    channelLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:channelLabel];
    
}

-(NSString *)v_getChannel
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"proChannel" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *chanle = [data objectForKey:@"CFrom"];
    
    return chanle?:@"未知";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
