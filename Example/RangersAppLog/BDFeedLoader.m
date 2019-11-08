//
//  BDFeedLoader.m
//  RangersAppLog
//
//  Created by bob on 2019/9/9.
//  Copyright © 2019 Bytedance. All rights reserved.
//

#import "BDFeedLoader.h"
#import "BDFeedModel.h"
#import "BDAdapter.h"
#import "BDPlayer.h"
#import "LocationTracker.h"
#import "BackgroundDownload.h"
#import "BackgroundTask.h"
#import "LocalPush.h"

@implementation BDFeedLoader

+ (NSArray<BDFeedModel *> *)loadDemoFeedList {
    NSMutableArray<BDFeedModel *> *array = [NSMutableArray array];
    
    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"Login with an ID";
        model.actionBlock = ^{
            [BDAdapter login];
        };
        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"Logout";
        model.actionBlock = ^{
            [BDAdapter logout];
        };
        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"Read ABTest Value";
        model.actionBlock = ^{
            id value = [BDAdapter ABTestValue];
            NSLog(@"value read from ABTest:(%@)",value);
        };
        
        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"open rangersapplog app";
        model.actionBlock = ^{
            NSString *url = @"rangersapplo://rangersapplog";
            NSURL *URL = [NSURL URLWithString:url];
            if ([[UIApplication sharedApplication] canOpenURL:URL]) {
                if (@available(iOS 10.0, *)) {
                    [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {
                        NSLog(@"Open success");
                    }];
                } else {
                    
                }
            }
        };

        model;
    })];


    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"开始播放，开启后台";
        model.actionBlock = ^{
            [[BDPlayer sharedInstance] play];
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"停止播放";
        model.actionBlock = ^{
            [[BDPlayer sharedInstance] stop];
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"开启后台定位";
        model.actionBlock = ^{
            [LocationTracker sharedInstance].enabled = YES;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"关闭定位";
        model.actionBlock = ^{
            [LocationTracker sharedInstance].enabled = NO;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"开启后台下载";
        model.actionBlock = ^{
            [BackgroundDownload sharedInstance].backgroundDownloadEnabled = YES;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"关闭后台下载";
        model.actionBlock = ^{
            [BackgroundDownload sharedInstance].backgroundDownloadEnabled = NO;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"开启一个10s后台任务";
        model.actionBlock = ^{
            [BackgroundTask sharedInstance].enabled = YES;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"前台本地通知";
        model.actionBlock = ^{
            [[LocalPush sharedInstance] scheduleLocalNotification];
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"后台启本地通知";
        model.actionBlock = ^{
            [LocalPush sharedInstance].enabled = YES;
        };

        model;
    })];

    [array addObject:({
        BDFeedModel *model = [BDFeedModel new];
        model.title = @"关闭本地通知";
        model.actionBlock = ^{
            [LocalPush sharedInstance].enabled = NO;
        };

        model;
    })];


    return array;
}

@end
