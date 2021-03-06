//
//  AXFoundationAssistant.h
//  AXiOSKit
//
//  Created by AXing on 2019/7/26.
//  Copyright © 2019 liu.weixing. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
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
NSString *ax_AppStoreURL(NSString *appId);

/**
 AppStore 评分 url
 
 @param AppStoreID AppStoreID
 @return url String
 */
NSString *ax_AppStoreScoreURL(NSString *AppStoreID);

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
BOOL ax_OpenURLStr(id _Nonnull url);

/**
 打开URL NSString || NSURL
 
 @param url NSString || NSURL
 @return BOOL
 */
BOOL ax_OpenURL(id _Nonnull url);

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
int ax_randomZeroToValue(int to);

/**
 * 获取一个随机整数，范围在[from,t]，包括from，包括to
 */
int ax_randomFromTo(int from, int to);

/**
 是否 nil 或者 空
 不要用分类, 为nil 时,不走分类方法
 */
extern BOOL ax_is_null(id obj);

/**
 是否不为 nil 或者 空
 */
extern BOOL ax_is_no_null(id obj);

/**
 gcd 创建串行队列 queue
 
 @param label 队列标识
 @return dispatch_queue_t
 */
dispatch_queue_t ax_get_queue_SERIAL(const char *label);

/**
 gcd 创建并行队列 queue
 
 @param label 队列标识
 @return dispatch_queue_t
 */
dispatch_queue_t ax_get_queue_CONCURRENT(const char *label);

/**
 * Localizable.strings  标准名称 国际化文件
 */
NSString *AXNSLocalizedString(NSString *key);

/**
 * AXKit 自定义国际化文件
 */
NSString *AXKitLocalizedString(NSString *key);

/**
 封装NSLog用printf 没有__FILE__ 和 __FILE__
 
 @param format NSLog样式 format
 @param ... NSLog样式 ...
 */
void AXLoger(NSString *format, ...);

/**
 封装NSLog用printf 有__FILE__ 和 __FILE__
 
 @param file __FILE__
 @param function __FUNCTION__
 @param line __LINE__
 @param format format
 @param ... NSLog样式 ...
 */
void AXLogerInfo(const char *file, const char *function, NSUInteger line,
                 NSString *format, ...);

/**
 封装NSLog用printf,添加打印头部标识 没有__FILE__ 和 __FILE__

 @param msg 标识
 @param format 样式
 @param ... 参数
 */
void AXLogerMessage(NSString *msg,NSString *format, ...);

/**
 封装NSLog用printf 纯输出
 
 @param format NSLog样式 format
 @param ... NSLog样式 ...
 */
void AXNoMsgLog(NSString *format, ...);

/**
 打开iPhone设置界面
 */
void AXOpenSettings(void);

#pragma mark - 添加属性

/**
 Retain Strong nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名 @selector() 格式
 @param value 值
 */
void ax_setStrongAssociatedObject(id object, const void *propertyName,
                                  id value);

/**
 Copy nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名 @selector() 格式
 @param value 值
 */
void ax_setCopyAssociatedObject(id object, const void *propertyName, id value);

/**
 Retain Strong nonatomic 属性添加值
 
 @param object 对象
 @param propertyName 属性名 @selector() 格式
 @param value 值
 */
void ax_setAssignAssociatedObject(id object, const void *propertyName,
                                  id value);

/**
 Retain Strong Copy Assign 对象获取值
 Assign 需要转型
 
 @param object 实例
 @param propertyName 属性名 @selector() 格式
 @return id 值
 */
id ax_getAssociatedObject(id object, const void *propertyName);

NS_ASSUME_NONNULL_END
