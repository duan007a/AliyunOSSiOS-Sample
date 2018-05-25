//
//  ViewController.m
//  AliyunOSSSDK-Sample
//
//  Created by huaixu on 2018/1/22.
//  Copyright © 2018年 huaixu. All rights reserved.
//

#import "ViewController.h"
#import <AliyunOSSiOS/AliyunOSSiOS.h>
#import <Photos/Photos.h>
#import "AppDelegate.h"
#import "AliyunOSS.h"

static NSString *oss_bucket_name = @"oss_bucket_name";

@interface ViewController ()

@property (nonatomic, strong) OSSClient *client;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *progresses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uploadMovies
{
    for (int i = 0; i < 8; i++) {
        OSSClient *client = [AliyunOSS sharedInstance].client;
        OSSMultipartUploadRequest *req = [OSSMultipartUploadRequest new];
        req.bucketName = oss_bucket_name;
        req.uploadingFileURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"MOV"];
        req.objectKey = [NSString stringWithFormat:@"upload-movie-%d", i];
        
        __weak typeof(self) weakifySelf = self;
        req.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UILabel *progress = weakifySelf.progresses[i];
                progress.text = [NSString stringWithFormat:@"%f", (totalBytesSent * 1.f) / totalBytesExpectedToSend];
            });
        };
        OSSTask *t = [client multipartUpload:req];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[t continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
                NSLog(@"任务完成啦");
                return nil;
            }] waitUntilFinished];
        });
    }
}

- (IBAction)uploadMovie:(id)sender {
    [self uploadMovies];
}
@end
