//
//  ViewController.m
//  HQAudioAndVibrate
//
//  Created by admin on 2017/7/21.
//  Copyright © 2017年 judian. All rights reserved.
//

#import "ViewController.h"
#import "HQAudioManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[HQAudioManager shareAudioManger] playAudioSystemSoundAndAlertSoundWithFile:@"alertsound.wav"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
