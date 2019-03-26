//
//  ViewController.m
//  AXiOSToolsExample
//
//  Created by AXing on 2019/1/19.
//  Copyright © 2019 liu.weixing. All rights reserved.
//
#import "ViewController.h"
#import "AAViewController.h"
#import "AXiOSTools.h"
#import "WebSocketManager.h"

@interface ViewController ()

@property(nonatomic, strong) AAViewController *avc;

/**<#description#>*/
@property(nonatomic, strong) UIView *leftView;
@property(nonatomic, strong) UIView *rightView;
@property(nonatomic, strong) UILabel *leftLabel;
@property(nonatomic, strong) UILabel *rightLabel;
@property(weak, nonatomic) IBOutlet UILabel *label;
@property(weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation ViewController




- (void)viewDidLoad {
  [super viewDidLoad];
    axLong_viewDidLoad
    
    
    AXLog(@"中文~~%@",@"迭代22");
    
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
//  AAViewController *vc = [[AAViewController alloc] init];
//  [self.navigationController pushViewController:vc animated:YES];
  
   
//    AXWKWebVC *vc = [[AXWKWebVC alloc]init];
//    vc.loadHTMLFilePath = [NSBundle.mainBundle pathForResource:@"HTML/home.html" ofType:nil];
//
//     NSLog(@"%@",vc.loadHTMLFilePath);
//    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btnAction:(id)sender {
  NSDictionary *dcit = @{
    @"msg" : self.tf.text,
    @"onlineCount" : @2,
    @"type" : @"SPEAK",
    @"username" : @"tom"
  };

  [WebSocketManager.shared sendDataToServer:[dcit ax_toJSONString]];
}

- (IBAction)btnAc2:(id)sender {
}

@end
