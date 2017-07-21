//
//  HQAudioManager.h
//  HQAudioAndVibrate
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 judian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQAudioManager : NSObject
/**
 *   单例实例化对象
 */
+ (instancetype)shareAudioManger;
#pragma mark 实例方法 （推荐使用单例创建实现）
/**
 *  播放音效
 *
 *  @param file 音频文件路径
 */
- (void)playAudioSystemSoundWithFile:(NSString *)file;
/**
 *  播放音效 + 震动
 *
 *  @param file 音频文件路径
 */
- (void)playAudioSystemSoundAndAlertSoundWithFile:(NSString *)file;
@end
