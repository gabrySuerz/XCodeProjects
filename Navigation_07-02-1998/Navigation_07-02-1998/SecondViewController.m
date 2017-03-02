//
//  SecondViewController.m
//  Navigation_02-02-1998
//
//  Created by Gabriele Suerz on 07/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.colorView setBackgroundColor:self.myColor];
}

-(void)viewDidLayoutSubviews {
    CGFloat width = self.colorView.frame.size.width;
    [self.colorView.layer setCornerRadius:width / 2];
}


-(IBAction)backButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)backFromProfileController:(UIStoryboardSegue *)segue{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
