//
//  WCDBViewController.m
//  AXiOSKitExample
//
//  Created by liuweixing on 2020/3/9.
//  Copyright © 2020 liu.weixing. All rights reserved.
//

#import "WCDBViewController.h"
#import "AXUserInfoDao.h"
#import "AXUserInfo.h"
#import <AXiOSKit/AXiOSKit.h>
#import "TZImagePickerController.h"
#import <MJExtension/MJExtension.h>

@interface WCDBViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UITextField *tf2;

@end

@implementation WCDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tf.placeholder = @"输入name";
    self.tf2.placeholder = @"id 为int";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    AXLogFunc;
}

-(void)dealloc{
    axLong_dealloc;
    
}
- (IBAction)addDB:(id)sender {
    AXUserInfo *model = [[AXUserInfo alloc]init];
    NSString *Id = self.tf.text;
    model.name = [NSString stringWithFormat:@"name%@",Id];
    model.registerDate = [NSDate date];
    BOOL result = [AXUserInfoDao.sharedDao insertWithModel:model];
    NSLog(@"result插入数据 %@",result ? @"成功" : @"失败");
}

- (IBAction)readDB:(id)sender {
    
    NSString *Id = self.tf2.text;
    AXUserInfo *model = [AXUserInfoDao.sharedDao getOneById:Id.integerValue];
    NSLog(@"model = %@",[model mj_JSONObject]);
    
}

@end
