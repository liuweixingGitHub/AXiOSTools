//
//  SOAComponentAppDelegate.h
//  AXiOSKit_Example
//
//  Created by 小星星吃KFC on 2020/10/26.
//  Copyright © 2020 axinger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SOAComponentAppDelegate : NSObject

+ (instancetype)instance;


@property(nonatomic, strong) NSMutableSet *services;


@end

NS_ASSUME_NONNULL_END