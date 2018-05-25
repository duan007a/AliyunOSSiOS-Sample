//
//  AliyunOSS.h
//  AliyunOSSSDK-Sample
//
//  Created by huaixu on 2018/5/24.
//  Copyright © 2018年 huaixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AliyunOSSiOS/AliyunOSSiOS.h>

@interface AliyunOSS : NSObject

@property (nonatomic, strong, readonly) OSSClient *client;

+ (instancetype)sharedInstance;

@end
