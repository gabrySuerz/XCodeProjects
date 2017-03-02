//
//  ViewController.m
//  Es6
//
//  Created by Gabriele Suerz on 24/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.txtAge setKeyboardType:UIKeyboardTypePhonePad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender {
    NSLog(@"\n Nome: %@ Cognome: %@ Età: %@", self.txtName.text, self.txtSurname.text, self.txtAge.text);
}


@end
