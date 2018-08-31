//
//  AXStaticMethod.h
//  AXiOSToolsDemo
//
//  Created by mac on 2018/8/31.
//  Copyright © 2018年 liuweixing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AXStaticMethod : NSObject


#pragma mark - Foundation

/**
 xcode 奔溃日志
 */
void ax_LogXcodeCache(void);

/**
 是debug 环境下
 
 @return 是否
 */
BOOL ax_isDebug(void);

/**
 是否 iPad
 @return 是否
 */
BOOL ax_isiPad(void);

/**
 * AppStore链接,填写自己的iD
 */
NSString * ax_AppStoreURL(NSString *appId);

/**
 AppStore 评分 url
 
 @param AppStoreID AppStoreID
 @return url String
 */
NSString * ax_AppStoreScoreURL(NSString *AppStoreID);

/**
 拨打电话,直接拨打
 
 @param phone 号码
 
 @return 是否成功
 */
BOOL ax_CallTel(NSString *phone);

/**
 * 打开通用设置
 */
BOOL ax_OpenPrefsRoot(void);

/**
 是否能打开url
 
 @param url url str
 
 @return 是否打开
 */
BOOL ax_CanOpenURL(id url);

/**
 打开url
 
 @param url url str
 
 @return 打开是否成功
 */
BOOL ax_OpenURLStr(id url);

/**
 打开URL NSString || NSURL
 
 @param url NSString || NSURL
 @return BOOL
 */
BOOL ax_OpenURL(id url);

/**
 拨打电话,弹出alert界面
 
 @param phone 号码
 
 @return 是否成功
 */
BOOL ax_CallTelprompt(NSString *phone);

/**
 * URL With str
 */
NSURL *ax_URLWithStr(NSString *str);

/**
 * int --> NSString
 */
NSString *ax_intToString(int aInt);

/**
 * double --> NSString
 */
NSString *ax_doubleToString(double aDouble);

/**
 * double --> NSString
 */
NSString *ax_floatToString(float aFloat);

/**
 * 获取一个随机整数，范围在包括0，不包括自身
 */
int ax_getRandomZeroToValue(int to);

/**
 * 获取一个随机整数，范围在[from,t]，包括from，包括to
 */
int ax_getRandomFromTo(int from ,int to);


#pragma mark - UIKit

/**
 创建xib With xib 名称
 
 @param name xib 名称
 @return UINib
 */
UINib * ax_Nib(NSString *name);

/**
 创建xib
 
 @param aClass xib 名称 xib与源文件名称一致
 @return UINib
 */
UINib * ax_NibClass(Class aClass);

/**
 UIImage With 图片名
 
 @param name 图片名
 @return UIImage
 */
UIImage * ax_Image(NSString *name);



#pragma mark - 添加属性

/**
 Retain Strong nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名
 @param value 值
 */
void ax_setStrongAssociatedObject(id _Nonnull object, const void * _Nonnull propertyName ,id value );


/**
 Copy nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名
 @param value 值
 */
void ax_setCopyAssociatedObject(id _Nonnull object, const void * _Nonnull propertyName ,id value );
/**
 Retain Strong nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名
 @param value 值
 */
void ax_setAssignAssociatedObject(id _Nonnull object, const void * _Nonnull propertyName ,id value );

/**
 Retain Strong Copy Assign 对象获取值
 Assign 需要转型
 
 @param object 实例
 @param propertyName 属性名
 @return id 值
 */
id ax_getAssociatedObject(id _Nonnull object, const void * _Nonnull propertyName );


@end