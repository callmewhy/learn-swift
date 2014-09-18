//
//  MainViewController.m
//  learn-gcd
//
//  Created by why on 9/18/14.
//  Copyright (c) 2014 why. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Without GCD

static NSOperationQueue * queue;

// 不用 GCD 的方案
- (IBAction)withoutGCD:(id)sender {
    [_indicatorView startAnimating];
    queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation * op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    [queue addOperation:op];
}

// 开始下载
- (void)download {
    NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
    NSError * error;
    NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(download_completed:) withObject:data waitUntilDone:NO];
    } else {
        NSLog(@"error when download:%@", error);
    }
}

// 下载完毕
- (void) download_completed:(NSString *) data {
    [_indicatorView stopAnimating];
    NSLog(@"call back = %@",data);
}


#pragma mark - With GCD

// 使用 GCD 的方案
- (IBAction)withGCD:(id)sender {
    [_indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 原代码块二
        NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
        NSError * error;
        NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (data != nil) {
            // 原代码块三
            dispatch_async(dispatch_get_main_queue(), ^{
                // 刷新 UI
                [_indicatorView stopAnimating];

                NSLog(@"call back = %@",data);
            });
        } else {
            NSLog(@"error when download:%@", error);
        }
    });
}


@end
