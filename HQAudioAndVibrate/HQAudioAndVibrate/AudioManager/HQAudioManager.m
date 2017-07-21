//
//  HQAudioManager.m
//  HQAudioAndVibrate
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 judian. All rights reserved.
//

#import "HQAudioManager.h"
#import <AudioToolbox/AudioToolbox.h>

static HQAudioManager *_manager = nil;

@implementation HQAudioManager

/**
 *  单利实例化对象
 *
 *  @return 单例对象
 */
+ (instancetype)shareAudioManger
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[[self class] alloc] init];
    });
    return _manager;
}

/**
 *  获取音效ID
 *
 *  @param file 音频文件路径
 *
 *  @return 音效ID
 */

- (SystemSoundID)getSystemSoundIDWithFile:(NSString *)file
{
    // 1.URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:file withExtension:nil];
    // 2.把文件添加进入内存 得到相应的soundID
   
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
#warning 此处输出soundID，如果为0则文件路径出错
    if (soundID == 0) {
        NSLog(@"文件路径出错");
        return 0;
    }else
    {
        // 3.返回生成的音效ID
        return soundID;
    }
    
}

#pragma mark 实例方法 （推荐使用单例创建实现）
/**
 *  播放音效--
 *
 *  @param file 音频文件路径
 */
- (void)playAudioSystemSoundWithFile:(NSString *)file
{
    // 获取音效ID
    SystemSoundID soundID = [self getSystemSoundIDWithFile:file];
    
    // .播放音效
    AudioServicesPlaySystemSound(soundID);
    
}

/**
 *  播放音效+震动
 */
- (void)playAudioSystemSoundAndAlertSoundWithFile:(NSString *)file
{
    // 获取音效ID
    SystemSoundID soundID = [self getSystemSoundIDWithFile:file];
    
    // .播放音效
    AudioServicesPlaySystemSound(soundID);
    
    // .添加震动 （模拟器没有效果）
    AudioServicesPlayAlertSound(soundID);
}


@end
