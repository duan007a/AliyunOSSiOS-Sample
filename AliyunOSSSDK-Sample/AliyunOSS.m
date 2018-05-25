//
//  AliyunOSS.m
//  AliyunOSSSDK-Sample
//
//  Created by huaixu on 2018/5/24.
//  Copyright © 2018年 huaixu. All rights reserved.
//

#import "AliyunOSS.h"

@interface AliyunOSS()

@property (nonatomic, strong) OSSClient *client;

@end

static NSString *oss_sts_server_url = @"oss_sts_server_url";
static NSString *oss_endPoint = @"oss_endPoint";

@implementation AliyunOSS

- (OSSClient *)client{
    if (!_client) {
        OSSAuthCredentialProvider *cred = [[OSSAuthCredentialProvider alloc] initWithAuthServerUrl:oss_sts_server_url];
        _client = [[OSSClient alloc] initWithEndpoint:oss_endPoint credentialProvider:cred];
    }
    return _client;
}

+ (instancetype)sharedInstance{
    static AliyunOSS *instance = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [AliyunOSS new];
        [instance client];
    });
    return instance;
}

@end
