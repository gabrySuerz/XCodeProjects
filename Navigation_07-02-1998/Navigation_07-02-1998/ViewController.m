//
//  ViewController.m
//  Navigation_02-02-1998
//
//  Created by Gabriele Suerz on 07/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self doTheSeguePerform];
    }];
    [timer fire];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIColor *myColor = [UIColor yellowColor];
    if([segue.identifier isEqualToString:@"buttonSender"]){
        UIButton *button;
        if([sender isKindOfClass:[UIButton class]]){
            button = (UIButton *) sender;
            NSLog(@"Premuto: %@", button.currentTitle);
            myColor = [UIColor redColor];
        }
    } else if ([segue.identifier isEqualToString:@"controllerSegue"]) {
        NSLog(@"Controller Segue");
        myColor = [UIColor blueColor];
    }
    
    SecondViewController *svc = segue.destinationViewController;
    svc.myColor = myColor;
}

-(void)doTheSeguePerform{
    [self performSegueWithIdentifier:@"controllerSegue" sender:nil];
}

-(IBAction)goToSecondViewController:(UIStoryboardSegue *)segue{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
