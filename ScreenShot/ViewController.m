//
//  ViewController.m
//  ScreenShot
//
//  Created by Mercsjho on 16/5/15.
//  Copyright © 2016年 Mercsjho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self makeView];
}

- (void)makeView {
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(100, 100 ,200 ,200)];
    self.contentView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.contentView];
    
    self.merBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.merBtn.frame = CGRectMake(125, 350, 100, 50);
    self.merBtn.backgroundColor = [UIColor blackColor];
    [self.merBtn setTitle:NSLocalizedString(@"截屏", nil) forState:UIControlStateNormal];
    [self.merBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.merBtn addTarget:self action:@selector(jzcBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.merBtn];
}

- (void)jzcBtn {
    //延迟两秒保存
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //获取图形上下文
        UIGraphicsBeginImageContext(self.contentView.frame.size);
        //将viewh绘制到图形上下文中
        [self.contentView.layer renderInContext:UIGraphicsGetCurrentContext()];
        //保存到相册
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    });
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"failed");
    } else {
        NSLog(@"success");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
