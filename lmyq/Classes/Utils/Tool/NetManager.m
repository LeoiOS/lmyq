//
//  NetManager.m
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//

#import "NetManager.h"
#import "AFNetworking.h"

@implementation NetManager

+ (instancetype)manager {
    
    static NetManager *netManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[NetManager alloc] init];
    });
    return netManager;
}

#pragma mark - Base Method

- (void)GET:(NSString *)URLString parameters:(id)parameters progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    
    [manager GET:[self validURLString:URLString] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        success(task, responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failure(task, error);
    }];
}

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    return [self GET:URLString parameters:parameters progress:nil success:success failure:failure];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters progress:(ProgressBlock)progress success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"appType"];
    
    [manager POST:[self validURLString:URLString] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        success(task, responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failure(task, error);
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    return [self POST:URLString parameters:parameters progress:nil success:success failure:failure];
}

- (NSString *)validURLString:(NSString * _Nullable)URLString {
    
    return [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - Common Method

- (void)getSystemTimeSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [self GET:SYS_TIME parameters:nil success:success failure:failure];
}

@end
