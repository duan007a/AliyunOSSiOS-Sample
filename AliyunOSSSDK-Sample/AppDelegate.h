//
//  AppDelegate.h
//  AliyunOSSSDK-Sample
//
//  Created by huaixu on 2018/1/22.
//  Copyright © 2018年 huaixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, copy) void (^completionHandler)(void);

@end

