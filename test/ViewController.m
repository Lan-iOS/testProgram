//
//  ViewController.m
//  test
//
//  Created by Lan on 2022/6/22.
//

#import "ViewController.h"
#import "MyGreeter.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 200, 200, 100);
    [button setTitle:@"MyGreeter(Send Message)" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor brownColor]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:button];
    
}

- (void)buttonAction:(UIButton *)sender
{
    MyGreeter *greeter = [MyGreeter new];
    [greeter sendMessage];
//    NSLog(@"afad");
}


@end
