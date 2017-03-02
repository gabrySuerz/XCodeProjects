//
//  ViewController.m
//  Es2
//
//  Created by Gabriele Suerz on 23/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.txtNumber setKeyboardType:UIKeyboardTypePhonePad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)txtNumberDidEndOnExit:(id)sender {
    [self calc];
}

-(void)calc {
    NSString *result = [self pariDisp];
    [self.lblNumber setText:[NSString stringWithFormat:@"%@", result]];
    NSLog(@"%@", result);
}

-(NSString *)pariDisp {
    int num = self.txtNumber.text.intValue;
    
    if(num % 2 == 0){
        return @"Pari";
    } else{
        return @"Dispari";
    }
}

@end
