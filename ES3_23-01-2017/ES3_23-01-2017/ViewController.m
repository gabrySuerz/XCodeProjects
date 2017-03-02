//
//  ViewController.m
//  Es3
//
//  Created by Gabriele Suerz on 23/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){

    int _number;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setGame {
    int n = [self getRandomNumberBetween:1 to:100];
    _number = n % 2;
    
    [self.lblNumber setText: [NSString stringWithFormat: @"%i", n]];
    NSLog(@"%i", _number);
}

-(IBAction)buttonPariPressed:(id)sender{
    if(_number == 0) {
        [self alert:@"ESATTA"];
    } else {
        [self alert:@"SBAGLIATA"];
    }
}

-(IBAction)buttonDispariPressed:(id)sender{
    if(_number == 1) {
        [self alert:@"ESATTA"];
    } else {
        [self alert:@"SBAGLIATA"];
    }
}

-(void)alert:(NSString *)risposta {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"La risposta è: ..." message:risposta preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setGame];
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:true completion:nil];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}


@end
