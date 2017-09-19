//
//  SoundControlSingle.h
//  CXWisdomBus
//
//  Created by DayHR on 2016/11/15.
//  Copyright © 2016年 lisiye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface SoundControlSingle : NSObject
@property(nonatomic,assign)SystemSoundID soundID;//播放文件标识
//获取震动、声音、自定义声音对象的方法
+ (id) sharedInstanceForVibrate;
+ (id) sharedInstanceForSound;
+ (id) sharedInstanceForProjectSound;
/**
 *  @brief  为播放震动效果初始化
 *  @return self
*/
 -(id)initForPlayingVibrate;
/**
 *  @brief  为播放系统音效初始化(无需提供音频文件)
 *  @param resourceName 系统音效名称
 *  @param type 系统音效类型
 *  @return self
*/
 -(id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type;
/**
 *  @brief  为播放特定的音频文件初始化（需提供音频文件）
 *  @param filename 音频文件名（加在工程中）
 *  @return self
 */
-(id)initForPlayingSoundEffectWith:(NSString *)filename;
//播放声音或者震动
-(void)play;
//播放提醒
-(void)playRemind;
//取消声音
-(void)cancleSound;
@end
