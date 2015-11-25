//
//  NetManager.h
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//  网络请求

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

typedef void (^SuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^FailureBlock)(AFHTTPRequestOperation *operation, NSError *error);


@interface NetManager : NSObject


/**
 *  网络请求单例
 *
 *  @return 网络请求单例
 */
+ (instancetype)manager;



#pragma mark - 通用方法

/**
 *  发送 GET 请求
 *
 *  @param URLString  接口地址
 *  @param parameters 参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 *  发送 POST 请求
 *
 *  @param URLString  接口地址
 *  @param parameters 参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;



#pragma mark - 特定方法


/**
 *  获取系统时间
 *
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)getSystemTimeSuccess:(SuccessBlock)success failure:(FailureBlock)failure;


@end
