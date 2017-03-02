//
//  ViewController.m
//  Es7
//
//  Created by Gabriele Suerz on 24/01/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer *_timer;
    int _sec;
    int _min;
    int _hour;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _sec = 0;
    _min = 0;
    _hour = 0;
    [self initTimer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateLabel) userInfo:nil repeats:true];
}

-(void) updateLabel {
    if (_sec == 59) {
        _sec = 0;
        if(_min == 59) {
            _min = 0;
            _hour++;
        } else {
            _min++;
        }
    } else {
        _sec++;
    }
    NSString *dateStr = [NSString stringWithFormat:@"%i:%i:%i", _hour, _min, _sec];
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    // Convert date object to desired output format
    [dateFormat setDateFormat:@"HH:mm:ss"];
    dateStr = [dateFormat stringFromDate:date];
    [self.lblTimer setText:dateStr];}

@end
