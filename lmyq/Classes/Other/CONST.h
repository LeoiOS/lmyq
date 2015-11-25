//
//  CONST.h
//  lmyq
//
//  Created by Leo on 15/11/25.
//  Copyright © 2015年 LanMeng Tec. All rights reserved.
//  存放常数和网络接口

#ifndef CONST_h
#define CONST_h


/******************** SDK KEY ********************/
#pragma mark - SDK KEY

// 高德地图
#define MAP_KEY_DIS     @"8421fe47839c0241e35dc8c1bf5d58ad"
#define MAP_KEY_DEV     @"de4dab61ec0094e232ea7ba373c58e22"




/******************** 常数 ********************/
#pragma mark - 常数

// 网络超时时间
#define TIMEOUT_INTERVAL    15.0f




/******************** 主机地址 ********************/
#pragma mark - 主机地址


// 主机接口
#define ENV 10

#if ENV == 100              // 生产服务器
#define HOST                @"http://yun.lanmengkeji.com"
#define PUSH_CER_NAME       @"lmyqDis"
#define MAP_KEY            MAP_KEY_DIS

#elif ENV == 10             // 开发服务器
#define HOST                @"http://123.57.67.53:1010"
#define PUSH_CER_NAME       @"PushDev"
#define MAP_KEY            MAP_KEY_DEV

#elif ENV == 91
#define HOST                @"http://123.57.67.53:9191"
#define PUSH_CER_NAME       @"PushDev"
#define MAP_KEY            MAP_KEY_DEV

#elif ENV == 90
#define HOST                @"http://123.57.67.53:9090"
#define PUSH_CER_NAME       @"PushDev"
#define MAP_KEY            MAP_KEY_DEV

#elif ENV == 80
#define HOST                @"http://123.57.67.53:8080"
#define PUSH_CER_NAME       @"PushDev"
#define MAP_KEY            MAP_KEY_DEV

#elif ENV == 80235
#define HOST                @"http://192.168.1.235:8080"
#define PUSH_CER_NAME       @"PushDev"
#define MAP_KEY            MAP_KEY_DEV

#endif


/******************** 登录 ********************/
#pragma mark - 登录




/******************** 首页 ********************/
#pragma mark - 首页




/******************** 联系人 ********************/
#pragma mark - 联系人




/******************** 发现 ********************/
#pragma mark - 发现




/******************** 设置 ********************/
#pragma mark - 设置








#endif /* CONST_h */
