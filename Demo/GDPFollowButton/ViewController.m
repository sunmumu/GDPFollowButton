//
//  ViewController.m
//  GDPFollowButton
//
//  Created by ule on 2020/10/22.
//

#import "ViewController.h"
#import "GDPFollowButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

// MARK: - SetupUI
- (void)setupUI {
    GDPFollowButton *button1 = [[GDPFollowButton alloc] init];
    button1.frame = CGRectMake(100, 140, 100, 50);
    button1.backgroundColor = [UIColor colorWithRed:37/255.0 green:118/255.0 blue:249/255.0 alpha:1.0];
    button1.layer.cornerRadius = 25;
    [self.view addSubview:button1];
    
    GDPFollowButton *button2 = [[GDPFollowButton alloc] init];
    button2.frame = CGRectMake(100, 200, 100, 50);
    button2.backgroundColor = [UIColor colorWithRed:37/255.0 green:118/255.0 blue:249/255.0 alpha:1.0];
    button2.layer.cornerRadius = 25;
    button2.loading = YES;
    [self.view addSubview:button2];

    GDPFollowButton *button3 = [[GDPFollowButton alloc] init];
    button3.frame = CGRectMake(100, 260, 100, 50);
    button3.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    button3.layer.cornerRadius = 25;
    button3.selected = YES;
    [self.view addSubview:button3];

    GDPFollowButton *button4 = [[GDPFollowButton alloc] init];
    button4.frame = CGRectMake(100, 320, 100, 50);
    button4.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
    button4.layer.cornerRadius = 25;
    button4.mutual = YES;
    [self.view addSubview:button4];
}


@end
