//
//  NetManager.h
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//  网络请求

#import <Foundation/Foundation.h>

typedef void (^ProgressBlock)(NSProgress *netProgress);
typedef void (^SuccessBlock)(NSURLSessionDataTask * task, id responseObject);
typedef void (^FailureBlock)(NSURLSessionDataTask * task, NSError * error);


@interface NetManager : NSObject


/**
 *  网络请求单例
 *
 *  @return 网络请求单例
 */
+ (instancetype)manager;



#pragma mark - Base Method

/**
 *  发送 GET 请求 (带进度)
 *
 *  @param URLString  接口地址
 *  @param parameters 参数
 *  @param progress   进度回调
 *  @param success    成功回调
 *  @param failure    失败回调
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;

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
 *  发送 POST 请求 (带进度)
 *
 *  @param URLString  接口地址
 *  @param parameters 参数
 *  @param progress   进度回调
 *  @param success    成功回调
 *  @param failure    失败回调
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 *  发送 POST 请求
 *
 *  @param URLString  接口地址
 *  @param parameters 参数
 *  @param success    成功回调
 *  @param failure    失败回调
 */
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure;



#pragma mark - Common Method


/**
 *  获取系统时间
 *
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)getSystemTimeSuccess:(SuccessBlock)success failure:(FailureBlock)failure;


@end
