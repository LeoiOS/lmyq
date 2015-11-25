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

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failure(operation, error);
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
    
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failure(operation, error);
    }];
}

- (void)getSystemTimeSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [self GET:SYS_TIME parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(operation, error);
    }];
}

@end
