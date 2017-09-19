//
//  ViewController.m
//  VoicAndShakeControl
//
//  Created by DayHR on 2017/1/3.
//  Copyright © 2017年 xiangzuhua. All rights reserved.
//

#import "ViewController.h"
#import "SoundControlSingle.h"

@interface ViewController ()
@property(nonatomic,assign)BOOL isSoundOpen;//声音打开
@property(nonatomic,assign)BOOL isProjectSoundOpen;//声音打开
@property(nonatomic,assign)BOOL isShakeOpen;//震动打开
@property(nonatomic,assign)BOOL isRemindOpen;//提醒控制

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    self.isShakeOpen = self.isSoundOpen = self.isProjectSoundOpen = self.isRemindOpen =  YES;
}
#pragma mark -- 开关选择事件
//声音控制
- (IBAction)soundControlAction:(UISwitch *)sender {
    if (sender.on) {
        self.isSoundOpen = YES;
    } else {
        self.isSoundOpen = NO;
    }
}
//震动控制
- (IBAction)shakeControlAction:(UISwitch *)sender {
    if (sender.on) {
        self.isShakeOpen = YES;
    } else {
        self.isShakeOpen = NO;
    }
}
//项目中的音频文件
- (IBAction)projectSound:(UISwitch *)sender {
    if (sender.on) {
        self.isProjectSoundOpen = YES;
    } else {
        self.isProjectSoundOpen = NO;
    }
    
}
//提醒控制
- (IBAction)remindControlAction:(UISwitch *)sender {
    if (sender.on) {
        self.isRemindOpen = YES;
    } else {
        self.isRemindOpen = NO;
    }
}

#pragma mark -- 测试按钮事件
//声音测试
- (IBAction)soundText:(UIButton *)sender {
    SoundControlSingle * single1 = [SoundControlSingle sharedInstanceForSound];//获取声音对象
    SoundControlSingle * single2 = [SoundControlSingle sharedInstanceForProjectSound];//获取自定义声音对象
    if (self.isSoundOpen) {//声音控制打开----可以播放声音
        if (self.isProjectSoundOpen) {//播放自定义的声音
            [single2 play];//播放
        } else {//播放系统的声音
            [single1 play];//播放
        }
    }
//    if (self.isProjectSoundOpen) {//如果播放自定义提示音的开关是打开的
//        [single2 play];//播放
//        return;
//    }
//    if (self.isSoundOpen) {//播放提示音的开关是打开的
//        [single1 play];//播放
//    }
}
//震动测试
- (IBAction)shakeText:(UIButton *)sender {
    SoundControlSingle * single = [SoundControlSingle sharedInstanceForVibrate];
    if (self.isShakeOpen) {
        [single play];
    }else{
        
    }
}
//提醒测试
- (IBAction)remindText:(UIButton *)sender {
    SoundControlSingle * single = [SoundControlSingle sharedInstanceForSound];
    if (self.isRemindOpen) {
        [single playRemind];//播放提示
    }else{
        
    }
}



@end
